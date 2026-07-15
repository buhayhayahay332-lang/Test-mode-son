local RunService    = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace     = game:GetService("Workspace")
local Players       = game:GetService("Players")

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
    _fovRadiusSq = 3600,
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
    _fovGui = nil,
    _fovCircle = nil,
    _fovStroke = nil,
    _snapline = nil,
    _viewmodelsFolder = nil,
    _hookInstalled = false,
    _hookStrategy = nil,
    _gunModule = nil,
    _gunModuleEnv = nil,
    _originalCircularSpread = nil,
    _originalCircularSpreadPresent = false,
    _originalCFrameNew = nil,
    _originalInputShoot = nil,
    _originalInputShootEnv = nil,
    _inputShootHooked = false,
    _hookedGuns = nil,
}

local TARGET_PARTS  = { "head","torso","shoulder1","shoulder2","arm1","arm2","hip1","hip2","leg1","leg2" }
local GADGET_TARGETS = { Drone="HumanoidRootPart", Claymore="Laser", ProximityAlarm="RedDot", StickyCamera="Cam", SignalDisruptor="Screen" }
local TEAM_COLOR    = Color3.fromRGB(0, 150, 0)

local function clamp(v, lo, hi, def)
    local n = tonumber(v)
    if not n then return def end
    return math.clamp(n, lo, hi)
end

local function toLower(v)
    return type(v) == "string" and v:lower() or ""
end

local function colorMatch(a, b)
    if typeof(a) ~= "Color3" or typeof(b) ~= "Color3" then return false end
    return math.floor(a.R*255+.5)==math.floor(b.R*255+.5)
       and math.floor(a.G*255+.5)==math.floor(b.G*255+.5)
       and math.floor(a.B*255+.5)==math.floor(b.B*255+.5)
end

local function dbgApi()
    return type(dbg)=="table" and dbg or type(debug)=="table" and debug or nil
end

local function getRuntimeHelper(name, fallback)
    if type(getgenv) == "function" then
        local v = getgenv()[name]
        if v ~= nil then return v end
    end
    return fallback
end

local function noVirtualize(fn)
    local nv = getRuntimeHelper("LPH_NO_VIRTUALIZE", LPH_NO_VIRTUALIZE)
    if type(nv) == "function" then
        return nv(fn)
    end
    return fn
end

local function replaceEnvironment(fn, replacement)
    local helper = getRuntimeHelper("replace_environment", replace_environment)
    if type(helper) == "function" then
        return helper(fn, replacement)
    end

    if type(getfenv) == "function" and type(setfenv) == "function" and type(fn) == "function" then
        local oldEnv = getfenv(fn)
        if type(oldEnv) == "table" then
            local clonefn = getRuntimeHelper("clonefunction", clonefunction or function(v) return v end)
            local oldFn = type(clonefn) == "function" and clonefn(fn) or fn
            setfenv(fn, replacement)
            return oldFn, oldEnv
        end
    end

    return nil
end


function Module:setShared(shared)
    if type(shared) ~= "table" then return false, "shared must be table" end
    self.shared = shared
    if type(shared.applyToEnv) == "function" then pcall(function() shared:applyToEnv() end) end
    local ref = shared.cloneref or shared.ref
    if type(ref) == "function" then
        RunService       = ref(game:GetService("RunService"))
        UserInputService = ref(game:GetService("UserInputService"))
        Workspace        = ref(game:GetService("Workspace"))
        Players          = ref(game:GetService("Players"))
    end
    return true
end


function Module:_wrapGunShootLook(gun)
    if type(gun) ~= "table" then return false end
    self._hookedGuns = self._hookedGuns or setmetatable({}, { __mode = "k" })
    if self._hookedGuns[gun] then return true end

    local orig = rawget(gun, "get_shoot_look")
    if type(orig) ~= "function" then return false end

    self._hookedGuns[gun] = orig
    gun.get_shoot_look = function(s, ...)
        if self._enabled and self._mode == "silent" then
            local t = self:_getClosestTargetToCursor()
            if t and s and s.shot and s.shot.CFrame then
                return CFrame.lookAt(s.shot.CFrame.Position, t.Position)
            end
        end
        return orig(s, ...)
    end
    gun._op1_silentAimLookHooked = true
    return true
end

function Module:_restoreGunShootLookHooks()
    if not self._hookedGuns then return end
    for gun, orig in pairs(self._hookedGuns) do
        if type(gun) == "table" then
            pcall(function()
                gun.get_shoot_look = orig
                gun._op1_silentAimLookHooked = nil
                gun._op1_original_get_shoot_look = nil
            end)
        end
    end
    self._hookedGuns = nil
end


function Module:_getMobileScopeButton()
    local c = self._mobileScopeButton
    if c and c.Parent then return c end
    local lp = Players and Players.LocalPlayer
    local pg = lp and lp:FindFirstChild("PlayerGui")
    local gg = pg and pg:FindFirstChild("Game")
    local btn = gg and gg:FindFirstChild("Right")
    btn = btn and btn:FindFirstChild("Center")
    btn = btn and btn:FindFirstChild("ScopeButton")
        return btn
    end

function Module:_isMobileScopePressed()
    if type(gethiddenproperty) ~= "function" then return false end
    local btn = self:_getMobileScopeButton()
    if not btn then return false end
    local ok, gs = pcall(gethiddenproperty, btn, "GuiState")
    return ok and gs and gs.Name == "Press" or false
end


function Module:_getViewmodelTeamMap()
    local map = {}
    for _, c in ipairs(Workspace:GetChildren()) do
        if c.ClassName == "Highlight" and c.Adornee and c.Adornee.Name == "Viewmodel" then
            map[c.Adornee] = colorMatch(c.FillColor, TEAM_COLOR) or colorMatch(c.OutlineColor, TEAM_COLOR)
        end
    end
    return map
end

function Module:_isWallBlocked(targetPart)
    local cam = Workspace.CurrentCamera
    if not cam then return false end
    if not self._viewmodelsFolder or not self._viewmodelsFolder.Parent then
        self._viewmodelsFolder = Workspace:FindFirstChild("Viewmodels")
    end
    local dir = targetPart.Position - cam.CFrame.Position
    if dir.Magnitude <= 0 then return false end
    local extra, origin, remaining, step = {}, cam.CFrame.Position, dir, dir.Unit
    for _ = 1, 12 do
        local bl = { cam }
        if self._viewmodelsFolder then
            local lv = self._viewmodelsFolder:FindFirstChild("LocalViewmodel")
            if lv then table.insert(bl, lv) end
        end
        for _, v in ipairs(extra) do table.insert(bl, v) end
        local p = RaycastParams.new()
        p.FilterType = Enum.RaycastFilterType.Exclude
        p.FilterDescendantsInstances = bl
        p.IgnoreWater = true
        local hit = Workspace:Raycast(origin, remaining, p)
        if not hit or not hit.Instance then return false end
        local inst = hit.Instance
        if inst == targetPart or inst:IsDescendantOf(targetPart.Parent) then return false end
        if inst:IsA("BasePart") and inst.Transparency > 0 then
            table.insert(extra, inst)
            origin = hit.Position + step * 0.05
            remaining = targetPart.Position - origin
            if remaining.Magnitude <= 0.05 then return false end
        else
            return true
        end
    end
    return true
end

function Module:_checkPart(part, mousePos, bestPart, bestDSq)
    if not part or not part:IsA("BasePart") then return bestPart, bestDSq end
    if self._visibleCheck and self:_isWallBlocked(part) then return bestPart, bestDSq end
    local cam = Workspace.CurrentCamera
    if not cam then return bestPart, bestDSq end
    local sp, on = cam:WorldToViewportPoint(part.Position)
    if not on then return bestPart, bestDSq end
    local dx, dy = sp.X - mousePos.X, sp.Y - mousePos.Y
    local dSq = dx*dx + dy*dy
    if dSq <= self._fovRadiusSq and dSq < bestDSq then return part, dSq end
    return bestPart, bestDSq
end

function Module:_getClosestTargetToCursor()
    local best, bestDSq = nil, math.huge
    local mp = Vector2.new(
        (Workspace.CurrentCamera and Workspace.CurrentCamera.ViewportSize.X or 0) * 0.5,
        (Workspace.CurrentCamera and Workspace.CurrentCamera.ViewportSize.Y or 0) * 0.5
    )
    local teamMap = self:_getViewmodelTeamMap()

    if not self._viewmodelsFolder or not self._viewmodelsFolder.Parent then
        self._viewmodelsFolder = Workspace:FindFirstChild("Viewmodels")
    end

    local vmf = self._viewmodelsFolder
    if vmf then
        for _, vm in ipairs(vmf:GetChildren()) do
            if vm.Name == "Viewmodel" then
                if self._teamCheck and teamMap[vm] then continue end
                local torso = vm:FindFirstChild("torso")
                if torso and torso.Transparency == 1 then continue end
                if self._targetMode == "head_only" then
                    best, bestDSq = self:_checkPart(vm:FindFirstChild("head"), mp, best, bestDSq)
                else
                    for _, pn in ipairs(TARGET_PARTS) do
                        best, bestDSq = self:_checkPart(vm:FindFirstChild(pn), mp, best, bestDSq)
                    end
                end
            end
        end
    end

    if self._targetGadgets then
        for _, child in ipairs(Workspace:GetChildren()) do
            if child:IsA("Model") then
                local pn = GADGET_TARGETS[child.Name]
                if pn then best, bestDSq = self:_checkPart(child:FindFirstChild(pn), mp, best, bestDSq) end
            end
        end
    end

    return best
end


function Module:_isAimAssistInputActive()
    local a = self._aimAssistActivation
    if a == "always" then return true end
    if a == "mobile_hold" then return self:_isMobileScopePressed() end
    if a == "mobile_toggle" then return self._scopeButtonToggled end
    if UserInputService.TouchEnabled and not UserInputService.MouseEnabled then return self:_isMobileScopePressed() end
    if a == "mb1" then return UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) end
    return UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
end

function Module:_runAimAssist()
    if not self._enabled or self._mode ~= "aim_assist" or not self:_isAimAssistInputActive() then return end
    local cam = Workspace.CurrentCamera
    if not cam then return end
    local target = self:_getClosestTargetToCursor()
    if not target then return end
    local desired = CFrame.lookAt(cam.CFrame.Position, target.Position)
    local alpha = clamp(self._smoothness, 0.01, 1, 1)
    cam.CFrame = alpha >= 0.999 and desired or cam.CFrame:Lerp(desired, alpha)
end


function Module:_updateFovCircle()
    if not self._fovCircle then return end
    local cam = Workspace.CurrentCamera
    local cx = cam and cam.ViewportSize.X * 0.5 or 0
    local cy = cam and cam.ViewportSize.Y * 0.5 or 0
    self._fovCircle.Visible  = self._enabled and self._showFovCircle
    self._fovCircle.Position = UDim2.fromOffset(cx, cy)
    self._fovCircle.Size     = UDim2.fromOffset(self._fovRadius * 2, self._fovRadius * 2)
end

function Module:_updateSnapline()
    local sl = self._snapline
    if not sl then return end
    local target = self._enabled and self._showSnaplines and self:_getClosestTargetToCursor()
    if not target then sl.Visible = false return end
    local cam = Workspace.CurrentCamera
    if not cam then sl.Visible = false return end
    local sp, on = cam:WorldToViewportPoint(target.Position)
    if not on then sl.Visible = false return end
    local vp = cam.ViewportSize
    local origins = { Top = Vector2.new(vp.X/2, 0), Center = Vector2.new(vp.X/2, vp.Y/2), Bottom = Vector2.new(vp.X/2, vp.Y) }
    sl.From        = origins[self._snaplineOrigin] or origins.Bottom
    sl.To          = Vector2.new(sp.X, sp.Y)
    sl.Color       = self._snaplineColor
    sl.Thickness   = self._snaplineThickness
    sl.Transparency = self._snaplineTransparency
    sl.Visible     = true
end

function Module:_createFovCircle()
    if self._fovCircle then return end
    local sg = Instance.new("ScreenGui")
    sg.Name = "Module_FovGui"
    sg.IgnoreGuiInset = true
    sg.ResetOnSpawn = false
    sg.Parent = (type(gethui)=="function" and gethui()) or cloneref(game:GetService("CoreGui"))

    local f = Instance.new("Frame")
    f.AnchorPoint = Vector2.new(0.5, 0.5)
    f.Size = UDim2.fromOffset(self._fovRadius*2, self._fovRadius*2)
    f.BackgroundTransparency = 1
    f.BorderSizePixel = 0
    f.Visible = false
    f.Parent = sg

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1.5
    stroke.Color = Color3.fromRGB(255,255,255)
    stroke.Parent = f

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.5, 0)
    corner.Parent = f

    self._fovGui = sg
    self._fovCircle = f
    self._fovStroke = stroke
end

function Module:_createSnapline()
    if self._snapline then return end
    if type(Drawing) ~= "table" or type(Drawing.new) ~= "function" then return end
    if self._snapline then pcall(function() self._snapline:Remove() end) self._snapline = nil end
    local line = Drawing.new("Line")
    line.Visible = false
    line.Thickness = 1
    line.Color = self._snaplineColor
    line.Transparency = 1
    self._snapline = line
end


function Module:_onRenderStep()
    if not self._scopeButtonConn then
        local btn = self:_getMobileScopeButton()
        if btn then
            self._scopeButtonConn = btn.InputBegan:Connect(function(input)
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
    if self._hookInstalled then return true end

    local selfRef = self
    local execName = ""
    local ok, name = pcall(function()
        if type(identifyexecutor) == "function" then return identifyexecutor()
        elseif type(getexecutorname) == "function" then return getexecutorname() end
        return ""
    end)
    if ok and type(name) == "string" then execName = name:lower() end

    local isDelta = execName:find("delta") ~= nil or execName:find("potassium") ~= nil

    if isDelta then
        print("DELTA IT IS FUCK NIGGA")
        local ok, err = pcall(function()
            local GunModule = require(game:GetService("ReplicatedStorage").Modules.Items.Item.Gun)
            local inputShoot = rawget(GunModule, "input_shoot")
            if type(inputShoot) ~= "function" then error("input_shoot unavailable") end

            selfRef._gunModule = GunModule
            selfRef._hookStrategy = "delta"

            local oldInputShoot, oldInputShootEnv
            oldInputShoot, oldInputShootEnv = replaceEnvironment(inputShoot, noVirtualize(newcclosure(function(_, global)
                if global == "os" then
                    local d = dbgApi()
                    local getStack = d and d.getstack or gstack or getstack
                    if type(getStack) == "function" then
                        local gun = getStack(3, 1)
                        if type(gun) == "table" then
                            selfRef:_wrapGunShootLook(gun)
                        end
                    end
                end

                return oldInputShoot(_, global)
            end)))

            if type(oldInputShoot) ~= "function" then
                error("replace_environment unavailable")
            end

            selfRef._originalInputShoot = oldInputShoot
            selfRef._originalInputShootEnv = oldInputShootEnv
            selfRef._inputShootHooked = true
        end)

        if not ok then
            selfRef._gunModule = nil
            selfRef._gunModuleEnv = nil
            selfRef._originalInputShoot = nil
            selfRef._originalInputShootEnv = nil
            selfRef._inputShootHooked = false
            selfRef._hookStrategy = nil
            return false, tostring(err)
        end
    else
        print("DIFF EXEC HO")
        local clonefn = clonefunction or function(fn) return fn end
        local closure = newcclosure or function(fn) return fn end
        local hookfn = getRuntimeHelper("hookfunction", hookfunction)
        if type(hookfn) ~= "function" then return false, "hookfunction unavailable" end

        local oldCF = clonefn(CFrame.new)
        selfRef._hookStrategy = "stack"
        selfRef._originalCFrameNew = oldCF

        local ok, err = pcall(function()
            hookfn(CFrame.new, closure(function(...)
                if not selfRef._enabled or selfRef._mode ~= "silent" then return oldCF(...) end
                local d = dbgApi()
                if not d then return oldCF(...) end
                local getStack = d.getstack or getstack
                local setStack = d.setstack or setstack
                if type(getStack) ~= "function" or type(setStack) ~= "function" then return oldCF(...) end

                for _, lvl in ipairs({2, 3}) do
                    if d.info and d.info(lvl, "n") == "send_shoot"
                    and d.info(lvl, "s") and d.info(lvl, "s"):find("ReplicatedStorage.Modules.Items.Item.Gun", 1, true) then
                        local target = selfRef:_getClosestTargetToCursor()
                        if target then
                            local origin = getStack(lvl, 3)
                            if origin and origin.Position then
                                setStack(lvl, 5, CFrame.lookAt(origin.Position, target.Position))
                            end
                        end
                        break
                    end
                end

                return oldCF(...)
            end))
        end)

        if not ok then
            selfRef._hookStrategy = nil
            selfRef._originalCFrameNew = nil
            return false, tostring(err)
        end
    end

    self._hookInstalled = true
    return true
end


function Module:init(force)
    if self._initialized and not force then return true end
    if self._initialized and force then self:unload() end

    local ok, err = self:_installHook()
    if not ok then return false, err end

    self:_createFovCircle()
    self:_createSnapline()

    if self._renderConn then self._renderConn:Disconnect() end
    self._renderConn = RunService.RenderStepped:Connect(function() self:_onRenderStep() end)
    self._initialized = true
    return true
end

function Module:load(force) return self:init(force) end
function Module:isLoaded() return self._initialized end

function Module:unload()
    self._enabled = false
    self._mobileScopeButton = nil
    self._scopeButtonToggled = false

    if self._scopeButtonConn then self._scopeButtonConn:Disconnect() self._scopeButtonConn = nil end
    if self._renderConn then self._renderConn:Disconnect() self._renderConn = nil end
    if self._fovGui then pcall(function() self._fovGui:Destroy() end) self._fovGui = nil end
    self._fovCircle = nil
    self._fovStroke = nil

    if self._snapline then
        pcall(function() self._snapline.Visible = false self._snapline:Remove() end)
        self._snapline = nil
    end

    self:_restoreGunShootLookHooks()

    if self._hookStrategy == "delta" and self._gunModule and (self._originalInputShoot or self._originalInputShootEnv) then
        pcall(function()
            local inputShoot = rawget(self._gunModule, "input_shoot")
            if type(inputShoot) == "function" then
                if type(self._originalInputShootEnv) == "table" and type(setfenv) == "function" then
                    setfenv(inputShoot, self._originalInputShootEnv)
                elseif self._originalInputShoot then
                    replaceEnvironment(inputShoot, self._originalInputShoot)
                end
            end
        end)
    elseif self._hookStrategy == "stack" and self._originalCFrameNew then
        pcall(function()
            local hookfn = getRuntimeHelper("hookfunction", hookfunction)
            if type(hookfn) == "function" then hookfn(CFrame.new, self._originalCFrameNew) end
        end)
    end

    self._gunModule = nil
    self._gunModuleEnv = nil
    self._originalCircularSpread = nil
    self._originalCircularSpreadPresent = false
    self._originalCFrameNew = nil
    self._originalInputShoot = nil
    self._originalInputShootEnv = nil
    self._inputShootHooked = false
    self._hookStrategy = nil
    self._hookInstalled = false
    self._initialized = false
    return true
end


function Module:setEnabled(state)
    local ok, err = self:init(false)
    if not ok then return false, err end
    self._enabled = state == true
    self:_updateFovCircle()
    self:_updateSnapline()
    return true
end

function Module:setFov(value)
    self._fovRadius = clamp(value, 10, 400, 60)
    self._fovRadiusSq = self._fovRadius * self._fovRadius
    self:_updateFovCircle()
    return true
end

function Module:setSmoothness(value)    self._smoothness = clamp(value, 0.01, 1, 1) return true end
function Module:setTeamCheck(state)     self._teamCheck = state == true return true end
function Module:setTargetGadgets(state) self._targetGadgets = state == true return true end
function Module:setVisibleCheck(state)  self._visibleCheck = state == true return true end
function Module:setSnaplineThickness(v) self._snaplineThickness = tonumber(v) or 1 end

function Module:setSnaplineColor(color)
    if typeof(color) == "Color3" then self._snaplineColor = color end
end

function Module:setSnaplineOrigin(origin)
    if ({Top=1,Center=1,Bottom=1})[origin] then self._snaplineOrigin = origin end
end

function Module:setMode(mode)
    local m = toLower(mode)
    if m ~= "silent" and m ~= "aim_assist" then return false, "invalid mode" end
    self._mode = m return true
end

function Module:setAimAssistActivation(mode)
    local m = toLower(mode)
    if not ({mb1=1,mb2=1,always=1,mobile_hold=1,mobile_toggle=1})[m] then return false, "invalid activation" end
    self._aimAssistActivation = m
    if m ~= "mobile_toggle" then self._scopeButtonToggled = false end
    return true
end

function Module:setTargetMode(mode)
    local m = toLower(mode)
    if m ~= "custom_parts" and m ~= "head_only" then return false, "invalid target mode" end
    self._targetMode = m return true
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

return Module
