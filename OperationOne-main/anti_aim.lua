local Module = {
    shared = nil,
    _initialized = false,
    _util = nil,
    _character = nil,
    _stateObject = nil,
    _replicatedStorage = nil,
    _originalClampLook = nil,
    _keybindConn = nil,
    _spinAngle = 0,
    _config = {
        Enabled = false,
        SpinRevs = 10,
        PitchDown = 80,
        SpoofLook = true,
        FixCamera = true,
        CycleKey = Enum.KeyCode.LeftAlt,
    },
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RENDER_TAG = "OP1_AntiAim"
local LEGACY_RENDER_TAG = "AntiAim"

local function numberValue(value, fallback)
    if type(value) == "number" then return value end
    return fallback
end

local function resolveKey(key)
    if typeof(key) == "EnumItem" then return key end
    if type(key) == "string" then
        return Enum.KeyCode[key] or Enum.KeyCode.LeftAlt
    end
    return Enum.KeyCode.LeftAlt
end

function Module:setShared(shared)
    if type(shared) ~= "table" then return false, "shared must be table" end
    self.shared = shared

    local ref = shared.cloneref or shared.ref
    if type(ref) == "function" then
        local function safeRef(service)
            local ok, result = pcall(ref, service)
            return ok and result or service
        end
        Players = safeRef(game:GetService("Players"))
        RunService = safeRef(game:GetService("RunService"))
        UserInputService = safeRef(game:GetService("UserInputService"))
        ReplicatedStorage = safeRef(game:GetService("ReplicatedStorage"))
    end

    self._replicatedStorage = ReplicatedStorage
    return true
end

function Module:_cloneFunction(fn)
    local clone = self.shared and (self.shared.clonefunction or self.shared.cfn)
    if type(clone) == "function" then
        local ok, result = pcall(clone, fn)
        if ok and type(result) == "function" then return result end
    end
    return fn
end

function Module:_requireModule(parent, name)
    local node = parent and parent:FindFirstChild(name)
    if not node then return nil end
    local ok, result = pcall(require, node)
    return ok and result or nil
end

function Module:_resolveInternals()
    local modules = self._replicatedStorage and self._replicatedStorage:FindFirstChild("Modules")
    if not modules then return false, "ReplicatedStorage.Modules unavailable" end

    self._util = self:_requireModule(modules, "Util")
    self._character = self:_requireModule(modules, "Character")
    self._stateObject = self:_requireModule(modules, "StateObject")

    if not self._character and not self._stateObject then
        return false, "Character internals unavailable"
    end
    return true
end

function Module:_getCharacterObject()
    if self._character and type(self._character.get_char) == "function" then
        local ok, object = pcall(self._character.get_char)
        if ok and object then return object end
    end

    local classes = self._stateObject and self._stateObject.classes
    local class = classes and classes["Character"]
    local character = Players.LocalPlayer and Players.LocalPlayer.Character
    if class and class.objects and character then return class.objects[character] end
    return nil
end

function Module:_getRoot(characterObject)
    local root = characterObject and characterObject.values
        and characterObject.values.rootpart
    if type(root) == "table" and root.instance then root = root.instance end
    if not root and characterObject and characterObject.instance then
        root = characterObject.instance:FindFirstChild("HumanoidRootPart")
    end
    return root
end

function Module:_installCameraFix()
    if not self._util or self._originalClampLook then return end
    if type(self._util.clamp_look_vector) ~= "function" then return end

    local original = self:_cloneFunction(self._util.clamp_look_vector)
    self._originalClampLook = original
    self._util.clamp_look_vector = function(fromLook, toLook, fov)
        local config = self._config
        if config.Enabled ~= false and config.FixCamera ~= false then
            return toLook
        end
        return original(fromLook, toLook, fov)
    end
end

function Module:_installKeybind()
    if self._keybindConn then
        pcall(function() self._keybindConn:Disconnect() end)
        self._keybindConn = nil
    end

    self._keybindConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed or UserInputService:GetFocusedTextBox() then return end

        if input.KeyCode == resolveKey(self._config.CycleKey) then
            self:setEnabled(self._config.Enabled == false)
        end
    end)
end

function Module:_onRenderStep(dt)
    local config = self._config
    if config.Enabled == false then return end

    local characterObject = self:_getCharacterObject()
    if not characterObject then return end

    local values = characterObject.values
    local cameraState = values and values.camera
    local camera = workspace.CurrentCamera
    local ownCamera = false
    if camera and cameraState and type(cameraState.get) == "function" then
        local ok, currentCamera = pcall(cameraState.get, cameraState)
        ownCamera = ok and currentCamera == camera
    end
    local customCamera = ownCamera and camera.CameraType == Enum.CameraType.Custom

    local root = self:_getRoot(characterObject)
    local lookState = characterObject.states and characterObject.states.look
    if not root or not lookState then return end

    local speed = math.rad(numberValue(config.SpinRevs, 10) * 360)
    local pitchDown = math.rad(numberValue(config.PitchDown, 80))
    self._spinAngle = (self._spinAngle + speed * dt) % (math.pi * 2)

    if root.Parent then
        root.CFrame = CFrame.new(root.Position) * CFrame.Angles(0, self._spinAngle, 0)
    end

    if config.SpoofLook ~= false and customCamera then
        local lookVector = (CFrame.Angles(0, self._spinAngle, 0)
            * CFrame.Angles(-pitchDown, 0, 0)) * Vector3.new(0, 0, -1)
        if type(lookState.set) == "function" then
            lookState:set(lookVector)
        end
    end

end

function Module:init(force)
    if self._initialized and not force then return true end
    if self._initialized and force then self:unload() end

    local ok, err = self:_resolveInternals()
    if not ok then return false, err end

    self:_installCameraFix()

    pcall(function() RunService:UnbindFromRenderStep(RENDER_TAG) end)
    pcall(function() RunService:UnbindFromRenderStep(LEGACY_RENDER_TAG) end)
    RunService:BindToRenderStep(RENDER_TAG, Enum.RenderPriority.Last.Value + 3, function(dt)
        pcall(function() self:_onRenderStep(dt) end)
    end)

    self:_installKeybind()
    self._initialized = true
    return true
end

function Module:load(force)
    return self:init(force)
end

function Module:isLoaded()
    return self._initialized
end

function Module:setStateChanged(callback)
    self._stateChanged = type(callback) == "function" and callback or nil
    return true
end

function Module:_notifyStateChanged()
    if self._stateChanged then
        pcall(self._stateChanged, self._config.Enabled == true)
    end
end
function Module:setEnabled(state)
    local ok, err = self:init(false)
    if not ok then return false, err end
    self._config.Enabled = state == true
    self:_notifyStateChanged()
    return true
end

function Module:setSpinRevs(value)
    self._config.SpinRevs = numberValue(value, self._config.SpinRevs or 10)
    return true
end


function Module:setPitchDown(value)
    self._config.PitchDown = numberValue(value, self._config.PitchDown or 80)
    return true
end

function Module:setSpoofLook(state)
    self._config.SpoofLook = state == true
    return true
end

function Module:setFixCamera(state)
    self._config.FixCamera = state == true
    return true
end

function Module:setToggleKey(key)
    self._config.CycleKey = resolveKey(key)
    if self._initialized then self:_installKeybind() end
    return true
end

function Module:unload()
    self._config.Enabled = false
    self:_notifyStateChanged()
    pcall(function() RunService:UnbindFromRenderStep(RENDER_TAG) end)
    pcall(function() RunService:UnbindFromRenderStep(LEGACY_RENDER_TAG) end)

    if self._keybindConn then
        pcall(function() self._keybindConn:Disconnect() end)
        self._keybindConn = nil
    end

    if self._util and self._originalClampLook then
        self._util.clamp_look_vector = self._originalClampLook
    end

    self._originalClampLook = nil
    self._util = nil
    self._character = nil
    self._stateObject = nil
    self._initialized = false
    return true
end

return Module