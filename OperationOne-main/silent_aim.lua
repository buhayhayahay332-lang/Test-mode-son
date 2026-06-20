local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local Module = {
    shared = nil,
    _initialized = false,
    _enabled = false,
    _mode = "silent",
    _teamCheck = true,
    _targetMode = "custom_parts",
    _targetGadgets = false,
    _aimAssistActivation = "mb2",
    _smoothness = 1,
    _fovRadius = 60,
    _fovRadiusSq = 60 * 60,
    _fovShape = "circle",
    _snaplineOrigin = "Bottom",
    _snaplineColor = Color3.fromRGB(255, 255, 255),
    _snaplineThickness = 1,
    _snaplineTransparency = 1,
    _visibleCheck = false,
    _showFovCircle = true,
    _showSnaplines = false,
    _mobileScopeButton = nil,
    _scopeButtonConn = nil,
    _scopeButtonToggled = false,
    _renderConn = nil,
    _fovCircle = nil,
    _snapline = nil,
    _viewmodelsFolder = nil,
    _hookInstalled = false,
}

local TARGET_PARTS = {
    "head", "torso", "shoulder1", "shoulder2",
    "arm1", "arm2", "hip1", "hip2", "leg1", "leg2",
}

local GADGET_TARGETS = {
    Drone = "HumanoidRootPart",
    Claymore = "Laser",
    ProximityAlarm = "RedDot",
    StickyCamera = "Cam",
    SignalDisruptor = "Screen",
}

local TEAM_COLOR = Color3.fromRGB(0, 150, 0)

local function clampNumber(v, minV, maxV, defaultV)
    local n = tonumber(v)
    if not n then
        return defaultV
    end
    if n < minV then
        return minV
    end
    if n > maxV then
        return maxV
    end
    return n
end

local function toLower(v)
    if type(v) ~= "string" then
        return ""
    end
    return string.lower(v)
end

local function isColorMatch(color, expected)
    if typeof(color) ~= "Color3" or typeof(expected) ~= "Color3" then
        return false
    end

    return math.floor(color.R * 255 + 0.5) == math.floor(expected.R * 255 + 0.5)
        and math.floor(color.G * 255 + 0.5) == math.floor(expected.G * 255 + 0.5)
        and math.floor(color.B * 255 + 0.5) == math.floor(expected.B * 255 + 0.5)
end

local function getDebugApi()
    if type(dbg) == "table" then
        return dbg
    end
    if type(debug) == "table" then
        return debug
    end
    return nil
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
        UserInputService = ref(game:GetService("UserInputService"))
        Workspace = ref(game:GetService("Workspace"))
        Players = ref(game:GetService("Players"))
    end

    return true
end

function Module:_getMousePosition()
    local camera = Workspace.CurrentCamera
    if not camera then
        return Vector2.new(0, 0)
    end
    return Vector2.new(camera.ViewportSize.X * 0.5, camera.ViewportSize.Y * 0.5)
end

function Module:_getMobileScopeButton()
    local cached = self._mobileScopeButton
    if cached and cached.Parent then
        return cached
    end

    local localPlayer = Players and Players.LocalPlayer
    local playerGui = localPlayer and localPlayer:FindFirstChild("PlayerGui")
    local gameGui = playerGui and playerGui:FindFirstChild("Game")
    local right = gameGui and gameGui:FindFirstChild("Right")
    local center = right and right:FindFirstChild("Center")
    local scopeButton = center and center:FindFirstChild("ScopeButton")
    if scopeButton and scopeButton:IsA("GuiButton") then
        self._mobileScopeButton = scopeButton
        return scopeButton
    end

    return nil
end

function Module:_isMobileScopePressed()
    if type(gethiddenproperty) ~= "function" then
        return false
    end

    local scopeButton = self:_getMobileScopeButton()
    if not scopeButton then
        return false
    end

    local ok, guiState = pcall(gethiddenproperty, scopeButton, "GuiState")
    return ok and guiState and guiState.Name == "Press" or false
end

function Module:_checkPart(part, mousePos, closestPart, closestDistSq)
    if not part or not part:IsA("BasePart") then
        return closestPart, closestDistSq
    end

    if self._visibleCheck and self:_isWallBlocked(part) then
        return closestPart, closestDistSq
    end

    local camera = Workspace.CurrentCamera
    if not camera then
        return closestPart, closestDistSq
    end

    local screenPos, onScreen = camera:WorldToViewportPoint(part.Position)
    if not onScreen then
        return closestPart, closestDistSq
    end

    local dx = screenPos.X - mousePos.X
    local dy = screenPos.Y - mousePos.Y
    local distSq = dx * dx + dy * dy

    if distSq <= self._fovRadiusSq and distSq < closestDistSq then
        return part, distSq
    end

    return closestPart, closestDistSq
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

function Module:_getGadgetTargetPart(model)
    if not model or not model:IsA("Model") then
        return nil
    end

    local partName = GADGET_TARGETS[model.Name]
    if not partName then
        return nil
    end

    return model:FindFirstChild(partName)
end

function Module:_isWallBlocked(targetPart)
    local camera = Workspace.CurrentCamera
    if not camera then
        return false
    end

    if not self._viewmodelsFolder or not self._viewmodelsFolder.Parent then
        self._viewmodelsFolder = Workspace:FindFirstChild("Viewmodels")
    end

    local origin = camera.CFrame.Position
    local direction = targetPart.Position - origin
    if direction.Magnitude <= 0 then
        return false
    end

    local extraIgnore = {}
    local currentOrigin = origin
    local remaining = direction
    local stepDir = direction.Unit

    for _ = 1, 12 do
        local blacklist = { camera }
        local viewmodelsFolder = self._viewmodelsFolder
        if viewmodelsFolder then
            local localViewmodel = viewmodelsFolder:FindFirstChild("LocalViewmodel")
            if localViewmodel then
                table.insert(blacklist, localViewmodel)
            end
        end

        for _, inst in ipairs(extraIgnore) do
            table.insert(blacklist, inst)
        end

        local params = RaycastParams.new()
        params.FilterType = Enum.RaycastFilterType.Exclude
        params.FilterDescendantsInstances = blacklist
        params.IgnoreWater = true

        local hit = Workspace:Raycast(currentOrigin, remaining, params)
        if not hit then
            return false
        end

        local instance = hit.Instance
        if not instance then
            return false
        end

        if instance == targetPart or instance:IsDescendantOf(targetPart.Parent) then
            return false
        end

        if instance:IsA("BasePart") and instance.Transparency > 0 then
            table.insert(extraIgnore, instance)
            local nextOrigin = hit.Position + stepDir * 0.05
            remaining = targetPart.Position - nextOrigin
            if remaining.Magnitude <= 0.05 then
                return false
            end
            currentOrigin = nextOrigin
        else
            return true
        end
    end

    return true
end

function Module:_getClosestTargetToCursor()
    local closestPart = nil
    local closestDistSq = math.huge
    local mousePos = self:_getMousePosition()
    local viewmodelTeams = self:_getViewmodelTeamMap()

    if not self._viewmodelsFolder or not self._viewmodelsFolder.Parent then
        self._viewmodelsFolder = Workspace:FindFirstChild("Viewmodels")
    end

    local viewmodelsFolder = self._viewmodelsFolder
    if viewmodelsFolder then
        for _, vm in ipairs(viewmodelsFolder:GetChildren()) do
            if vm.Name == "Viewmodel" then
                if self._teamCheck and viewmodelTeams[vm] then
                    continue
                end

                local torso = vm:FindFirstChild("torso")
                if torso and torso.Transparency == 1 then
                    continue
                end

                if self._targetMode == "head_only" then
                    local head = vm:FindFirstChild("head")
                    closestPart, closestDistSq = self:_checkPart(head, mousePos, closestPart, closestDistSq)
                else
                    for _, partName in ipairs(TARGET_PARTS) do
                        local part = vm:FindFirstChild(partName)
                        closestPart, closestDistSq = self:_checkPart(part, mousePos, closestPart, closestDistSq)
                    end
                end
            end
        end
    end

    if self._targetGadgets then
        for _, child in ipairs(Workspace:GetChildren()) do
            local gadgetPart = self:_getGadgetTargetPart(child)
            if gadgetPart then
                closestPart, closestDistSq = self:_checkPart(gadgetPart, mousePos, closestPart, closestDistSq)
            end
        end
    end

    return closestPart
end

function Module:_isAimAssistInputActive()
    if self._aimAssistActivation == "always" then
        return true
    end

    if self._aimAssistActivation == "mobile_hold" then
        return self:_isMobileScopePressed()
    end

    if self._aimAssistActivation == "mobile_toggle" then
        return self._scopeButtonToggled
    end

    if UserInputService.TouchEnabled and not UserInputService.MouseEnabled then
        return self:_isMobileScopePressed()
    end

    if self._aimAssistActivation == "mb1" then
        return UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
    end

    return UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
end

function Module:_runAimAssist()
    if not self._enabled or self._mode ~= "aim_assist" then
        return
    end

    if not self:_isAimAssistInputActive() then
        return
    end

    local camera = Workspace.CurrentCamera
    if not camera then
        return
    end

    local target = self:_getClosestTargetToCursor()
    if not target then
        return
    end

    local desired = CFrame.lookAt(camera.CFrame.Position, target.Position)
    local alpha = clampNumber(self._smoothness, 0.01, 1, 1)

    if alpha >= 0.999 then
        camera.CFrame = desired
    else
        camera.CFrame = camera.CFrame:Lerp(desired, alpha)
    end
end

function Module:_updateFovCircle()
    if not self._fovCircle then
        return
    end

    local mousePos = self:_getMousePosition()
    local visible = self._enabled and self._showFovCircle and self._fovShape == "circle"

    self._fovCircle.Visible = visible
    self._fovCircle.Position = UDim2.fromOffset(mousePos.X, mousePos.Y)
    self._fovCircle.Size = UDim2.fromOffset(self._fovRadius * 2, self._fovRadius * 2)
end

function Module:_updateSnapline()
    if not self._snapline then return end

    local target = self:_getClosestTargetToCursor()
    if self._enabled and self._showSnaplines and target then
        local camera = Workspace.CurrentCamera
        if not camera then self._snapline.Visible = false return end

        local screenPos, onScreen = camera:WorldToViewportPoint(target.Position)
        if not onScreen then self._snapline.Visible = false return end

        local viewportSize = camera.ViewportSize
        local startPos

        if self._snaplineOrigin == "Top" then
            startPos = Vector2.new(viewportSize.X / 2, 0)
        elseif self._snaplineOrigin == "Center" then
            startPos = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
        else -- Bottom
            startPos = Vector2.new(viewportSize.X / 2, viewportSize.Y)
        end

        self._snapline.From = startPos
        self._snapline.To = Vector2.new(screenPos.X, screenPos.Y)
        self._snapline.Color = self._snaplineColor
        self._snapline.Thickness = self._snaplineThickness
        self._snapline.Transparency = self._snaplineTransparency
        self._snapline.Visible = true
    else
        self._snapline.Visible = false
    end
end

function Module:_onRenderStep()
    if not self._scopeButtonConn then
        local scopeButton = self:_getMobileScopeButton()
        if scopeButton then
            self._scopeButtonConn = scopeButton.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if self._aimAssistActivation == "mobile_toggle" then
                        self._scopeButtonToggled = not self._scopeButtonToggled
                    end
                end
            end)
        end
    end

    self:_updateFovCircle()
    self:_updateSnapline()
    self:_runAimAssist()
end

function Module:_installHook()
    if self._hookInstalled then
        return true
    end

    local clonefn = clonefunction or function(fn) return fn end
    local closure = newcclosure or function(fn) return fn end
    local hookfn = hookfunction

    if type(hookfn) ~= "function" then
        return false, "hookfunction unavailable"
    end

    local oldCF = clonefn(CFrame.new)
    local selfRef = self

    local ok, err = pcall(function()
        hookfn(CFrame.new, closure(function(...)
            if not selfRef._enabled or selfRef._mode ~= "silent" then
                return oldCF(...)
            end

            local dbgApi = getDebugApi()
            if not dbgApi then
                return oldCF(...)
            end

            local infoFn = dbgApi.info
            local getStackFn = dbgApi.getstack or getstack
            local setStackFn = dbgApi.setstack or setstack

            if type(infoFn) ~= "function" or type(getStackFn) ~= "function" or type(setStackFn) ~= "function" then
                return oldCF(...)
            end

            local stackLevel = nil
            if infoFn(2, "n") == "send_shoot" then
                stackLevel = 2
            elseif infoFn(3, "n") == "send_shoot" then
                stackLevel = 3
            end

            if stackLevel then
                local target = selfRef:_getClosestTargetToCursor()
                if target then
                    local origin = getStackFn(stackLevel, 3)
                    if origin and origin.Position then
                        setStackFn(stackLevel, 5, CFrame.lookAt(origin.Position, target.Position))
                    end
                end
            end

            return oldCF(...)
        end))
    end)

    if not ok then
        return false, tostring(err)
    end

    self._hookInstalled = true
    return true
end

local function createUICircle(radius, parent)
    local circle = Instance.new("Frame")
    circle.AnchorPoint = Vector2.new(0.5, 0.5)
    circle.Size = UDim2.fromOffset(radius * 2, radius * 2)
    circle.BackgroundTransparency = 1
    circle.BorderSizePixel = 0
    circle.Visible = false
    circle.Parent = parent

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1.5
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.Transparency = 0
    stroke.Parent = circle

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.5, 0)  -- 0.5 scale = perfect circle
    corner.Parent = circle

    return circle, stroke
end

function Module:_createFovCircle()
    if self._fovCircle then
        return
    end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "Module_FovGui"
    screenGui.IgnoreGuiInset = true
    screenGui.ResetOnSpawn = false
    screenGui.Parent = (gethui and gethui()) or cloneref(game:GetService("CoreGui"))

    local circle, stroke = createUICircle(self._fovRadius, screenGui)

    self._fovGui = screenGui
    self._fovCircle = circle
    self._fovStroke = stroke
end

function Module:_createSnapline()
    if self._snapline then return end
    if type(Drawing) ~= "table" or type(Drawing.new) ~= "function" then return end

    local env = (getgenv and getgenv()) or _G
    if type(env) == "table" and env.__op1_silent_snapline then
        pcall(function() env.__op1_silent_snapline:Remove() end)
    end

    local line = Drawing.new("Line")
    line.Visible = false
    line.Thickness = 1
    line.Color = self._snaplineColor
    line.Transparency = 1

    if type(env) == "table" then env.__op1_silent_snapline = line end
    self._snapline = line
end

function Module:init(force)
    if self._initialized and not force then
        return true
    end

    if self._initialized and force then
        self:unload()
    end

    local okHook, hookErr = self:_installHook()
    if not okHook then
        return false, hookErr
    end

    self:_createFovCircle()
    self:_createSnapline()

    if self._renderConn then
        self._renderConn:Disconnect()
        self._renderConn = nil
    end

    self._renderConn = RunService.RenderStepped:Connect(function()
        self:_onRenderStep()
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
    self:_updateFovCircle()
    self:_updateSnapline()
    return true
end

function Module:setFov(value)
    self._fovRadius = clampNumber(value, 10, 400, 60)
    self._fovRadiusSq = self._fovRadius * self._fovRadius
    self:_updateFovCircle()
    return true
end

function Module:setFovShape(shape)
    local s = toLower(shape)
    if s ~= "circle" and s ~= "square" then
        return false, "invalid fov shape"
    end

    self._fovShape = s
    self:_updateFovCircle()
    return true
end

function Module:setSmoothness(value)
    self._smoothness = clampNumber(value, 0.01, 1, 1)
    return true
end

function Module:setMode(mode)
    local m = toLower(mode)
    if m ~= "silent" and m ~= "aim_assist" then
        return false, "invalid mode"
    end

    self._mode = m
    return true
end

function Module:setAimAssistActivation(mode)
    local m = toLower(mode)
    if m ~= "mb1" and m ~= "mb2" and m ~= "always" and m ~= "mobile_hold" and m ~= "mobile_toggle" then
        return false, "invalid activation"
    end

    self._aimAssistActivation = m
    if m ~= "mobile_toggle" then
        self._scopeButtonToggled = false
    end

    return true
end

function Module:setTargetMode(mode)
    local m = toLower(mode)
    if m ~= "custom_parts" and m ~= "head_only" then
        return false, "invalid target mode"
    end

    self._targetMode = m
    return true
end

function Module:setTargetGadgets(state)
    self._targetGadgets = state == true
    return true
end

function Module:setTeamCheck(state)
    self._teamCheck = state == true
    return true
end

function Module:setVisibleCheck(state)
    self._visibleCheck = state == true
    return true
end

function Module:setFovCircleVisible(state)
    self._showFovCircle = state == true
    self:_updateFovCircle()
    return true
end

function Module:setSnaplinesEnabled(state)
    self._showSnaplines = state == true
    self:_updateSnapline()
    return true
end

function Module:setSnaplineColor(color)
    if typeof(color) == "Color3" then
        self._snaplineColor = color
    end
end

function Module:setSnaplineOrigin(origin)
    local valid = {["Top"] = true, ["Center"] = true, ["Bottom"] = true}
    if valid[origin] then
        self._snaplineOrigin = origin
    end
end

function Module:setSnaplineThickness(value)
    self._snaplineThickness = tonumber(value) or 1
end

function Module:unload()
    self._enabled = false
    self._mobileScopeButton = nil
    self._scopeButtonToggled = false

    if self._scopeButtonConn then
        self._scopeButtonConn:Disconnect()
        self._scopeButtonConn = nil
    end

    if self._renderConn then
        self._renderConn:Disconnect()
        self._renderConn = nil
    end

    if self._fovGui then
        pcall(function() self._fovGui:Destroy() end)
        self._fovGui = nil
    end

    self._fovCircle = nil
    self._fovStroke = nil

    if self._snapline then
        pcall(function()
            self._snapline.Visible = false
            self._snapline:Remove()
        end)
        self._snapline = nil
    end

    local env = (getgenv and getgenv()) or _G
    if type(env) == "table" then
        env.__op1_silent_fov_circle = nil
        env.__op1_silent_snapline = nil
    end

    self._initialized = false
    return true
end

return Module
