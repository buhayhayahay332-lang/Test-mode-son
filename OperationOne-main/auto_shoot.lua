local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local Module = {
    shared = nil,
    _initialized = false,
    _enabled = false,
    _delay = 0,
    _teamCheck = true,
    _targetGadgets = false,
    _active = false,
    _targetAcquiredAt = nil,
    _renderConn = nil,
    _viewmodelsFolder = nil,
}

local GADGET_TARGETS = {
    Drone = "HumanoidRootPart",
    Claymore = "Laser",
    ProximityAlarm = "RedDot",
    StickyCamera = "Cam",
    SignalDisruptor = "Screen",
}

local TEAM_COLOR = Color3.fromRGB(0, 150, 0)

local function isColorMatch(color, expected)
    if typeof(color) ~= "Color3" or typeof(expected) ~= "Color3" then
        return false
    end

    return math.floor(color.R * 255 + 0.5) == math.floor(expected.R * 255 + 0.5)
        and math.floor(color.G * 255 + 0.5) == math.floor(expected.G * 255 + 0.5)
        and math.floor(color.B * 255 + 0.5) == math.floor(expected.B * 255 + 0.5)
end

local function pressMouse()
    if type(mouse1press) == "function" then
        mouse1press()
        return
    end

    pcall(function()
        local vim = cloneref(game:GetService("VirtualInputManager"))
        vim:SendMouseButtonEvent(0, 0, 0, true, game, 1)
    end)
end

local function releaseMouse()
    if type(mouse1release) == "function" then
        mouse1release()
        return
    end

    pcall(function()
        local vim = cloneref(game:GetService("VirtualInputManager"))
        vim:SendMouseButtonEvent(0, 0, 0, false, game, 1)
    end)
end

function Module:setShared(shared)
    if type(shared) ~= "table" then
        return false, "shared must be table"
    end

    self.shared = shared

    if type(shared.applyToEnv) == "function" then
        pcall(function()
            shared:applyToEnv()
        end)
    end

    local ref = shared.cloneref
    if type(ref) ~= "function" then
        ref = shared.ref
    end

    if type(ref) == "function" then
        RunService = ref(game:GetService("RunService"))
        Workspace = ref(game:GetService("Workspace"))
    end

    return true
end

function Module:_getViewmodelTeamMap()
    local viewmodelTeams = {}

    for _, child in ipairs(Workspace:GetChildren()) do
        if child.ClassName == "Highlight" then
            local adornee = child.Adornee
            if adornee and adornee.Name == "Viewmodel" then
                local isTeammate = isColorMatch(child.FillColor, TEAM_COLOR)
                    or isColorMatch(child.OutlineColor, TEAM_COLOR)
                viewmodelTeams[adornee] = isTeammate
            end
        end
    end

    return viewmodelTeams
end

function Module:_isEnemyViewmodel(instance)
    if not self._viewmodelsFolder or not self._viewmodelsFolder.Parent then
        self._viewmodelsFolder = Workspace:FindFirstChild("Viewmodels")
    end

    local viewmodelsFolder = self._viewmodelsFolder
    if not viewmodelsFolder then
        return false
    end

    local current = instance
    while current do
        if current.Parent == viewmodelsFolder and current.Name == "Viewmodel" then
            local torso = current:FindFirstChild("torso")
            if torso and torso.Transparency == 1 then
                return false
            end

            local localViewmodel = viewmodelsFolder:FindFirstChild("LocalViewmodel")
            if localViewmodel and current == localViewmodel then
                return false
            end

            if self._teamCheck then
                local viewmodelTeams = self:_getViewmodelTeamMap()
                if viewmodelTeams[current] then
                    return false
                end
            end

            return true
        end

        current = current.Parent
    end

    return false
end

function Module:_isGadget(instance)
    if not self._targetGadgets then
        return false
    end

    local current = instance
    while current and current ~= Workspace do
        if current:IsA("Model") and GADGET_TARGETS[current.Name] then
            return true
        end
        current = current.Parent
    end

    return false
end

function Module:_getTarget()
    local camera = Workspace.CurrentCamera
    if not camera then
        return nil
    end

    if not self._viewmodelsFolder or not self._viewmodelsFolder.Parent then
        self._viewmodelsFolder = Workspace:FindFirstChild("Viewmodels")
    end

    local viewmodelsFolder = self._viewmodelsFolder
    local maxDistance = 500
    local lookDir = camera.CFrame.LookVector
    local currentOrigin = camera.CFrame.Position
    local remainingDistance = maxDistance

    local blacklist = { camera }
    if viewmodelsFolder then
        local localViewmodel = viewmodelsFolder:FindFirstChild("LocalViewmodel")
        if localViewmodel then
            table.insert(blacklist, localViewmodel)
        end
    end

    for _ = 1, 10 do
        if remainingDistance <= 0.05 then
            break
        end

        local params = RaycastParams.new()
        params.FilterType = Enum.RaycastFilterType.Exclude
        params.FilterDescendantsInstances = blacklist
        params.IgnoreWater = true

        local hit = Workspace:Raycast(currentOrigin, lookDir * remainingDistance, params)
        if not hit or not hit.Instance then
            break
        end

        local hitPart = hit.Instance

        if self:_isEnemyViewmodel(hitPart) then
            return hitPart
        end

        if self:_isGadget(hitPart) then
            return hitPart
        end

        if hitPart:IsA("BasePart") and (hitPart.Transparency > 0 or not hitPart.CanCollide) then
            table.insert(blacklist, hitPart)
            currentOrigin = hit.Position + lookDir * 0.05
            remainingDistance = maxDistance - (currentOrigin - camera.CFrame.Position).Magnitude
        else
            break
        end
    end

    return nil
end

function Module:_run()
    if not self._enabled then
        if self._active then
            releaseMouse()
            self._active = false
            self._targetAcquiredAt = nil
        end
        return
    end

    local target = self:_getTarget()

    if target then
        if not self._targetAcquiredAt then
            self._targetAcquiredAt = os.clock()
        end

        local elapsed = os.clock() - self._targetAcquiredAt
        if elapsed >= self._delay and not self._active then
            pressMouse()
            self._active = true
        end
    else
        if self._active then
            releaseMouse()
            self._active = false
        end
        self._targetAcquiredAt = nil
    end
end

function Module:init(force)
    if self._initialized and not force then
        return true
    end

    if self._initialized and force then
        self:unload()
    end

    if self._renderConn then
        self._renderConn:Disconnect()
        self._renderConn = nil
    end

    self._renderConn = RunService.RenderStepped:Connect(function()
        self:_run()
    end)

    self._initialized = true
    return true
end

function Module:load(force)
    return self:init(force)
end

function Module:isLoaded()
    return self._initialized
end

function Module:setEnabled(state)
    local okInit, initErr = self:init(false)
    if not okInit then
        return false, initErr
    end

    self._enabled = state == true

    if not self._enabled and self._active then
        releaseMouse()
        self._active = false
        self._targetAcquiredAt = nil
    end

    return true
end

function Module:setDelay(msValue)
    local ms = tonumber(msValue) or 0
    if ms < 0 then ms = 0 end
    if ms > 200 then ms = 200 end
    self._delay = ms / 1000
    return true
end

function Module:setTeamCheck(state)
    self._teamCheck = state == true
    return true
end

function Module:setTargetGadgets(state)
    self._targetGadgets = state == true
    return true
end

function Module:unload()
    self._enabled = false

    if self._active then
        releaseMouse()
        self._active = false
    end

    self._targetAcquiredAt = nil

    if self._renderConn then
        self._renderConn:Disconnect()
        self._renderConn = nil
    end

    self._initialized = false
    return true
end

return Module
