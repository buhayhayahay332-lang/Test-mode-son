local Module = {
    shared = nil,
    _enabled = false,
    _initialized = false,
    _util = nil,
    _character = nil,
    _stateObject = nil,
    _replicatedStorage = nil,
    _originalClampLook = nil,
    _originalFrameLerp = nil,
    _keybindConn = nil,
    _activeRoot = nil,
    _spinAngle = 0,
    _spinSpeed = 1440,
    _pitchDown = 89,
    _spoofLook = true,
    _fixCamera = true,
    _toggleKey = Enum.KeyCode.RightAlt,
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RENDER_TAG = "OP1_AntiAim"

local function numberBetween(value, minimum, maximum, fallback)
    value = tonumber(value)
    if not value then return fallback end
    return math.clamp(value, minimum, maximum)
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

function Module:_newClosure(fn)
    local closure = self.shared and (self.shared.newcclosure or self.shared.closure)
    if type(closure) == "function" then
        local ok, result = pcall(closure, fn)
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

function Module:_installUtilHooks()
    if not self._util then return true end

    if type(self._util.clamp_look_vector) == "function" and not self._originalClampLook then
        local original = self:_cloneFunction(self._util.clamp_look_vector)
        self._originalClampLook = original
        self._util.clamp_look_vector = self:_newClosure(function(fromLook, toLook, fov)
            if self._enabled and self._fixCamera then return toLook end
            return original(fromLook, toLook, fov)
        end)
    end

    if type(self._util.frame_lerp) == "function" and not self._originalFrameLerp then
        local original = self:_cloneFunction(self._util.frame_lerp)
        self._originalFrameLerp = original
        self._util.frame_lerp = self:_newClosure(function(from, to, speed, dt, ...)
            local root = self._activeRoot
            if self._enabled and root and root.Parent and typeof(from) == "CFrame" then
                if (from.Position - root.Position).Magnitude < 0.01 then return from end
            end
            return original(from, to, speed, dt, ...)
        end)
    end
    return true
end

function Module:_installKeybind()
    if self._keybindConn then
        pcall(function() self._keybindConn:Disconnect() end)
        self._keybindConn = nil
    end

    local key = self._toggleKey
    self._keybindConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed or UserInputService:GetFocusedTextBox() then return end
        if input.KeyCode == key then self:setEnabled(not self._enabled) end
    end)
end

function Module:_onRenderStep(dt)
    if not self._enabled then self._activeRoot = nil return end

    local characterObject = self:_getCharacterObject()
    local root = self:_getRoot(characterObject)
    if not characterObject or not root or not root.Parent then
        self._activeRoot = nil
        return
    end

    self._activeRoot = root
    self._spinAngle = (self._spinAngle + math.rad(self._spinSpeed) * dt) % (math.pi * 2)

    local gyro = root:FindFirstChildWhichIsA("BodyGyro")
    if gyro then gyro.CFrame = CFrame.Angles(0, self._spinAngle, 0) end
    root.CFrame = CFrame.new(root.Position) * CFrame.Angles(0, self._spinAngle, 0)

    local collision = root.Parent:FindFirstChild("collision")
    if collision then
        local motor = collision:FindFirstChildWhichIsA("Motor6D")
            or collision:FindFirstChild("JointMotor")
        if motor then motor.Transform = CFrame.new() end
    end

    local values = characterObject.values
    local cameraState = values and values.camera
    local camera = workspace.CurrentCamera
    local ownCamera = false
    if camera and cameraState and type(cameraState.get) == "function" then
        local ok, currentCamera = pcall(cameraState.get, cameraState)
        ownCamera = ok and currentCamera == camera
    end

    local lookState = characterObject.states and characterObject.states.look
    if self._spoofLook and lookState and ownCamera
        and camera.CameraType == Enum.CameraType.Custom then
        local pitch = math.rad(numberBetween(self._pitchDown, 0, 89, 89))
        local lookVector = (CFrame.Angles(0, self._spinAngle, 0)
            * CFrame.Angles(-pitch, 0, 0)) * Vector3.new(0, 0, -1)
        if type(lookState.set) == "function" then lookState:set(lookVector) end
    end
end

function Module:init(force)
    if self._initialized and not force then return true end
    if self._initialized and force then self:unload() end

    local ok, err = self:_resolveInternals()
    if not ok then return false, err end

    self:_installUtilHooks()
    pcall(function() RunService:UnbindFromRenderStep(RENDER_TAG) end)
    RunService:BindToRenderStep(RENDER_TAG, Enum.RenderPriority.Last.Value + 3, function(dt)
        pcall(function() self:_onRenderStep(dt) end)
    end)
    self:_installKeybind()
    self._initialized = true
    return true
end

function Module:load(force) return self:init(force) end
function Module:isLoaded() return self._initialized end

function Module:setEnabled(state)
    local ok, err = self:init(false)
    if not ok then return false, err end
    self._enabled = state == true
    if not self._enabled then self._activeRoot = nil end
    return true
end

function Module:setSpinSpeed(value)
    self._spinSpeed = numberBetween(value, 0, 3600, 1440)
    return true
end

function Module:setPitchDown(value)
    self._pitchDown = numberBetween(value, 0, 89, 89)
    return true
end

function Module:setSpoofLook(state) self._spoofLook = state == true return true end
function Module:setFixCamera(state) self._fixCamera = state == true return true end

function Module:setToggleKey(key)
    if typeof(key) == "string" then
        key = Enum.KeyCode[key] or Enum.KeyCode.RightAlt
    end
    if typeof(key) ~= "EnumItem" then return false end
    self._toggleKey = key
    if self._initialized then self:_installKeybind() end
    return true
end

function Module:unload()
    self._enabled = false
    self._activeRoot = nil
    pcall(function() RunService:UnbindFromRenderStep(RENDER_TAG) end)

    if self._keybindConn then
        pcall(function() self._keybindConn:Disconnect() end)
        self._keybindConn = nil
    end

    if self._util then
        if self._originalClampLook then
            self._util.clamp_look_vector = self._originalClampLook
        end
        if self._originalFrameLerp then
            self._util.frame_lerp = self._originalFrameLerp
        end
    end

    self._originalClampLook = nil
    self._originalFrameLerp = nil
    self._util = nil
    self._character = nil
    self._stateObject = nil
    self._initialized = false
    return true
end

return Module
