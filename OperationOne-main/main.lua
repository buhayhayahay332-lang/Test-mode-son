local moduleRepo = "https://github.com/buhayhayahay332-lang/Test-mode-son/raw/refs/heads/main/OperationOne-main/"

local MODULE_FILES = {
    shared_runtime     = "shared_runtime.lua",
    fullbright         = "fullbright.lua",
    gun_modification   = "gun_modification.lua",
    EspLib             = "EspLib.lua",
    silent_aim         = "silent_aim.lua",
    attachment_editor  = "attachment_editor.lua",
    homing_projectiles = "homing_projectiles.lua",
    auto_shoot         = "auto_shoot.lua",
    misc               = "misc.lua",
}

local moduleCache        = {}
local sharedRuntimeCache = nil
local ESP_MODULE_NAME    = "EspLib"

local function log(msg)
    print("[OP1] " .. tostring(msg))
end

local function loadSharedRuntime()
    if type(sharedRuntimeCache) == "table" then return sharedRuntimeCache end
    local ok, result = pcall(function()
        return loadstring(game:HttpGet(moduleRepo .. MODULE_FILES.shared_runtime))()
    end)
    if not ok or type(result) ~= "table" then
        log("shared runtime failed to load")
        return nil
    end
    sharedRuntimeCache = result
    if type(result.applyToEnv) == "function" then
        pcall(function() result:applyToEnv() end)
    end
    return sharedRuntimeCache
end

local function initModule(name, forceReload)
    local cached = moduleCache[name]
    if cached and cached.initialized and not forceReload then return cached.module end

    local file = MODULE_FILES[name]
    if not file then log("unknown module: " .. tostring(name)) return nil end

    local ok, moduleObj = pcall(function()
        return loadstring(game:HttpGet(moduleRepo .. file))()
    end)
    if not ok or not moduleObj then
        log(name .. " failed to load")
        return nil
    end

    local sharedRuntime = loadSharedRuntime()
    if sharedRuntime then
        sharedRuntime.modules = sharedRuntime.modules or {}
        sharedRuntime.modules[name] = moduleObj
        if type(moduleObj.setShared) == "function" then
            pcall(function() moduleObj:setShared(sharedRuntime) end)
        elseif type(moduleObj) == "table" and moduleObj.shared == nil then
            moduleObj.shared = sharedRuntime
        end
    end

    local okInit, initErr = true, nil
    if type(moduleObj.load) == "function" then
        okInit, initErr = moduleObj:load(forceReload == true)
    elseif type(moduleObj.init) == "function" then
        okInit, initErr = moduleObj:init(forceReload == true)
    end
    if okInit == false then
        log(name .. " init failed")
        return nil
    end

    moduleCache[name] = { initialized = true, module = moduleObj }
    return moduleObj
end

local function withModule(name, callback)
    local moduleObj = initModule(name, false)
    if not moduleObj then return false end
    local ok, result = pcall(callback, moduleObj)
    if not ok then log(name .. " callback error") return false end
    return result ~= false
end

local function withModuleRetry(name, callback, retries)
    retries = retries or 3
    local function attempt(n)
        local moduleObj = initModule(name, false)
        if moduleObj then
            local ok, result = pcall(callback, moduleObj)
            if ok and result ~= false then return end
        end
        if n > 1 then
            task.delay(0.5, function() attempt(n - 1) end)
        else
            log(name .. " gave up after retries")
        end
    end
    attempt(retries)
end

local function setSilentAim(state)
    withModule("silent_aim", function(m)
        if type(m.setEnabled) == "function" then m:setEnabled(state) end
    end)
end
local function setSilentAimFov(value)
    withModule("silent_aim", function(m)
        if type(m.setFov) == "function" then m:setFov(value) end
    end)
end
local function setSilentAimSmoothness(value)
    withModule("silent_aim", function(m)
        if type(m.setSmoothness) == "function" then m:setSmoothness(value) end
    end)
end
local function setSilentAimMode(mode)
    withModule("silent_aim", function(m)
        if type(m.setMode) == "function" then m:setMode(mode) end
    end)
end
local function setAimAssistActivation(mode)
    withModule("silent_aim", function(m)
        if type(m.setAimAssistActivation) == "function" then m:setAimAssistActivation(mode) end
    end)
end
local function setSilentAimTargetMode(mode)
    withModule("silent_aim", function(m)
        if type(m.setTargetMode) == "function" then m:setTargetMode(mode) end
    end)
end
local function setSilentAimTeamCheck(state)
    withModule("silent_aim", function(m)
        if type(m.setTeamCheck) == "function" then m:setTeamCheck(state) end
    end)
end
local function setSilentAimTargetGadgets(state)
    withModule("silent_aim", function(m)
        if type(m.setTargetGadgets) == "function" then m:setTargetGadgets(state) end
    end)
end
local function setSilentAimVisibleCheck(state)
    withModule("silent_aim", function(m)
        if type(m.setVisibleCheck) == "function" then m:setVisibleCheck(state) end
    end)
end
local function setSilentAimFovCircleVisual(state)
    withModule("silent_aim", function(m)
        if type(m.setFovCircleVisible) == "function" then m:setFovCircleVisible(state) end
    end)
end
local function setSilentAimSnaplines(state)
    withModule("silent_aim", function(m)
        if type(m.setSnaplinesEnabled) == "function" then m:setSnaplinesEnabled(state) end
    end)
end
local function setSilentAimSnaplineOrigin(value)
    withModule("silent_aim", function(m)
        if type(m.setSnaplineOrigin) == "function" then m:setSnaplineOrigin(value) end
    end)
end
local function setSilentAimSnaplineColor(color)
    withModule("silent_aim", function(m)
        if type(m.setSnaplineColor) == "function" then m:setSnaplineColor(color) end
    end)
end

local function setAutoShoot(state)
    withModule("auto_shoot", function(m)
        if type(m.setEnabled) == "function" then m:setEnabled(state) end
    end)
end
local function setAutoShootDelay(value)
    withModule("auto_shoot", function(m)
        if type(m.setDelay) == "function" then m:setDelay(value) end
    end)
end
local function setAutoShootTeamCheck(state)
    withModule("auto_shoot", function(m)
        if type(m.setTeamCheck) == "function" then m:setTeamCheck(state) end
    end)
end
local function setAutoShootTargetGadgets(state)
    withModule("auto_shoot", function(m)
        if type(m.setTargetGadgets) == "function" then m:setTargetGadgets(state) end
    end)
end
local function setAutoShootActivation(mode)
    withModule("auto_shoot", function(m)
        if type(m.setActivation) == "function" then m:setActivation(mode) end
    end)
end

local function setTombradyEnabled(state)
    withModule("homing_projectiles", function(m)
        if type(m.setTombradyEnabled) == "function" then m:setTombradyEnabled(state) end
    end)
end
local function setHk69Enabled(state)
    withModule("homing_projectiles", function(m)
        if type(m.setHk69Enabled) == "function" then m:setHk69Enabled(state) end
    end)
end
local function setHomingSpeed(value)
    withModule("homing_projectiles", function(m)
        if type(m.setHomingSpeed) == "function" then m:setHomingSpeed(value) end
    end)
end
local function setHomingSmoothness(value)
    withModule("homing_projectiles", function(m)
        if type(m.setHomingSmoothness) == "function" then m:setHomingSmoothness(value) end
    end)
end

local function setGunModEnabled(state)
    withModule("gun_modification", function(m)
        if type(m.setEnabled) == "function" then m:setEnabled(state) end
    end)
end
local function setGunModConfig(key, value)
    withModule("gun_modification", function(m)
        if type(m.updateConfig) == "function" then
            m:updateConfig({ [key] = value })
        elseif type(m.config) == "table" then
            m.config[key] = value
        end
    end)
end

local function setEspEnabled(state)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.setEnabled) == "function" then m:setEnabled(state)
        elseif m.Enabled ~= nil then m.Enabled = state == true end
    end)
end
local function setEspTeamCheck(state)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.setTeamCheck) == "function" then m:setTeamCheck(state)
        elseif m.Drawing and m.Drawing.TeamCheck then m.Drawing.TeamCheck.Enabled = state == true end
    end)
end
local function setEspPlayers(state)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.setPlayerBoxEnabled) == "function" then m:setPlayerBoxEnabled(state)
        elseif m.Drawing and m.Drawing.Boxes and m.Drawing.Boxes.Full then
            m.Drawing.Boxes.Full.Enabled = state == true
        end
    end)
end
local function setEspCorners(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes and m.Drawing.Boxes.Corner then
            m.Drawing.Boxes.Corner.Enabled = state == true
        end
    end)
end
local function setEspFilled(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes and m.Drawing.Boxes.Filled then
            m.Drawing.Boxes.Filled.Enabled = state == true
        end
    end)
end
local function setEspBoxGradient(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes then m.Drawing.Boxes.Gradient = state == true end
    end)
end
local function setEspBoxAnimate(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes then m.Drawing.Boxes.Animate = state == true end
    end)
end
local function setEspBoxGradientFill(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes then m.Drawing.Boxes.GradientFill = state == true end
    end)
end
local function setEspHealthBar(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.HealthBar then m.Drawing.HealthBar.Enabled = state == true end
    end)
end
local function setEspSkeleton(state)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.setSkeletonEnabled) == "function" then m:setSkeletonEnabled(state)
        elseif type(m.ToggleSkeleton) == "function" then m.ToggleSkeleton(state)
        elseif m.Drawing and m.Drawing.Skeleton then m.Drawing.Skeleton.Enabled = state == true end
    end)
end
local function setEspNames(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Names then m.Drawing.Names.Enabled = state == true end
    end)
end
local function setEspDistances(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Distances then m.Drawing.Distances.Enabled = state == true end
    end)
end
local function setEspWeapons(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Weapons then m.Drawing.Weapons.Enabled = state == true end
    end)
end

local function setShootWhileRunning(state)
    withModule("misc", function(m)
        if type(m.setEnabled) == "function" then m:setEnabled(state) end
    end)
end
local function setEspWeaponIcons(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Weapons then m.Drawing.Weapons.IconEnabled = state == true end
    end)
end
local function setEspWeaponIconSize(size)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Weapons and type(size) == "number" and size > 0 then
            m.Drawing.Weapons.IconSize = size
        end
    end)
end
local function setEspChams(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Chams then m.Drawing.Chams.Enabled = state == true end
    end)
end
local function setEspChamsThermal(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Chams then m.Drawing.Chams.Thermal = state == true end
    end)
end
local function setEspChamsVisibleCheck(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Chams then m.Drawing.Chams.VisibleCheck = state == true end
    end)
end
local function setEspOffscreenArrows(state)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.ToggleOffscreenArrows) == "function" then m.ToggleOffscreenArrows(state)
        elseif m.Drawing and m.Drawing.OffscreenArrows then m.Drawing.OffscreenArrows.Enabled = state == true end
    end)
end
local function setEspOffscreenArrowsColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.SetOffscreenArrowsColor) == "function" then m.SetOffscreenArrowsColor(color)
        elseif m.Drawing and m.Drawing.OffscreenArrows then m.Drawing.OffscreenArrows.RGB = color end
    end)
end
local function setEspOffscreenArrowsSize(value)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.SetOffscreenArrowsSize) == "function" then m.SetOffscreenArrowsSize(value)
        elseif m.Drawing and m.Drawing.OffscreenArrows then m.Drawing.OffscreenArrows.Size = value end
    end)
end
local function setEspOffscreenArrowsTransparency(value)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.SetOffscreenArrowsTransparency) == "function" then m.SetOffscreenArrowsTransparency(value)
        elseif m.Drawing and m.Drawing.OffscreenArrows then m.Drawing.OffscreenArrows.Transparency = value end
    end)
end
local function setEspOffscreenArrowsShowDistance(state)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.ToggleOffscreenArrowsDistance) == "function" then m.ToggleOffscreenArrowsDistance(state)
        elseif m.Drawing and m.Drawing.OffscreenArrows then m.Drawing.OffscreenArrows.ShowDistance = state == true end
    end)
end
local function setEspTracers(state)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.ToggleTracers) == "function" then m.ToggleTracers(state)
        elseif m.Drawing and m.Drawing.Tracers then m.Drawing.Tracers.Enabled = state == true end
    end)
end
local function setEspTracersOrigin(value)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.SetTracersOrigin) == "function" then m.SetTracersOrigin(value)
        elseif m.Drawing and m.Drawing.Tracers then m.Drawing.Tracers.Origin = value end
    end)
end
local function setEspOffscreenArrowsDistanceColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.SetOffscreenArrowsDistanceColor) == "function" then m.SetOffscreenArrowsDistanceColor(color)
        elseif m.Drawing and m.Drawing.OffscreenArrows then m.Drawing.OffscreenArrows.DistanceRGB = color end
    end)
end
local function setEspOffscreenArrowsDistanceFontSize(value)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.SetOffscreenArrowsDistanceFontSize) == "function" then m.SetOffscreenArrowsDistanceFontSize(value)
        elseif m.Drawing and m.Drawing.OffscreenArrows then m.Drawing.OffscreenArrows.DistanceFontSize = value end
    end)
end
local function setEspFadeOut(state)
    withModule(ESP_MODULE_NAME, function(m)
        if m.FadeOut then m.FadeOut.OnDistance = state == true end
    end)
end
local function setEspMaxDistance(value)
    withModule(ESP_MODULE_NAME, function(m)
        if m.MaxDistance ~= nil then m.MaxDistance = tonumber(value) or m.MaxDistance end
    end)
end
local function setEspFontSize(value)
    withModule(ESP_MODULE_NAME, function(m)
        if m.FontSize ~= nil then m.FontSize = math.floor(tonumber(value) or m.FontSize) end
    end)
end
local function setEspCornerThickness(value)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.SetCornerThickness) == "function" then m.SetCornerThickness(value)
        elseif m.Drawing and m.Drawing.Boxes and m.Drawing.Boxes.Corner then
            m.Drawing.Boxes.Corner.Thickness = tonumber(value) or m.Drawing.Boxes.Corner.Thickness
        end
    end)
end
local function setEspCornerLength(value)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.SetCornerLength) == "function" then m.SetCornerLength(value)
        elseif m.Drawing and m.Drawing.Boxes and m.Drawing.Boxes.Corner then
            m.Drawing.Boxes.Corner.Length = tonumber(value) or m.Drawing.Boxes.Corner.Length
        end
    end)
end
local function setEspSkeletonThickness(value)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.setSkeletonThickness) == "function" then m:setSkeletonThickness(value)
        elseif type(m.SetSkeletonThickness) == "function" then m.SetSkeletonThickness(value)
        elseif m.Drawing and m.Drawing.Skeleton then
            m.Drawing.Skeleton.Thickness = tonumber(value) or m.Drawing.Skeleton.Thickness
        end
    end)
end
local function setEspBoxRotationSpeed(value)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes then
            m.Drawing.Boxes.RotationSpeed = tonumber(value) or m.Drawing.Boxes.RotationSpeed
        end
    end)
end
local function setEspFilledTransparency(value)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes and m.Drawing.Boxes.Filled then
            m.Drawing.Boxes.Filled.Transparency = tonumber(value) or m.Drawing.Boxes.Filled.Transparency
        end
    end)
end
local function setEspChamsFillTransparency(value)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Chams then
            m.Drawing.Chams.Fill_Transparency = tonumber(value) or m.Drawing.Chams.Fill_Transparency
        end
    end)
end
local function setEspChamsOutlineTransparency(value)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Chams then
            m.Drawing.Chams.Outline_Transparency = tonumber(value) or m.Drawing.Chams.Outline_Transparency
        end
    end)
end
local function setEspPlayerColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.setPlayerColor) == "function" then m:setPlayerColor(color)
        elseif m.Drawing and m.Drawing.Boxes then
            if m.Drawing.Boxes.Corner then m.Drawing.Boxes.Corner.RGB = color end
            if m.Drawing.Boxes.Full   then m.Drawing.Boxes.Full.RGB   = color end
            m.Drawing.Boxes.GradientRGB1     = color
            m.Drawing.Boxes.GradientFillRGB1 = color
        end
    end)
end
local function setEspGradientEndColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes then m.Drawing.Boxes.GradientRGB2 = color end
    end)
end
local function setEspFillGradientStartColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes then m.Drawing.Boxes.GradientFillRGB1 = color end
    end)
end
local function setEspFillGradientEndColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Boxes then m.Drawing.Boxes.GradientFillRGB2 = color end
    end)
end
local function setEspNameColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Names then m.Drawing.Names.RGB = color end
    end)
end
local function setEspSkeletonColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.setSkeletonColor) == "function" then m:setSkeletonColor(color)
        elseif type(m.SetSkeletonColor) == "function" then m.SetSkeletonColor(color)
        elseif m.Drawing and m.Drawing.Skeleton then m.Drawing.Skeleton.RGB = color end
    end)
end
local function setEspWeaponColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Weapons then m.Drawing.Weapons.RGB = color end
    end)
end
local function setEspDistanceColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Distances then m.Drawing.Distances.RGB = color end
    end)
end
local function setEspChamsFillColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Chams then m.Drawing.Chams.FillRGB = color end
    end)
end
local function setEspChamsOutlineColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if m.Drawing and m.Drawing.Chams then m.Drawing.Chams.OutlineRGB = color end
    end)
end
local function setEspTracersColor(color)
    withModule(ESP_MODULE_NAME, function(m)
        if type(m.SetTracersColor) == "function" then m.SetTracersColor(color)
        elseif m.Drawing and m.Drawing.Tracers then m.Drawing.Tracers.RGB = color end
    end)
end

local function setEspObjectEnabled(key, state)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        local fn = m["Toggle" .. key .. "Chams"]
        if type(fn) == "function" then fn(state) return end
        if m.ObjectChams and m.ObjectChams[key] then
            m.ObjectChams[key].Enabled = state == true
            return true
        end
        return false
    end)
end
local function setEspObjectColor(key, color)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        local fillFn    = m["Set" .. key .. "ChamsFill"]
        local outlineFn = m["Set" .. key .. "ChamsOutline"]
        if type(fillFn)    == "function" then fillFn(color) end
        if type(outlineFn) == "function" then outlineFn(color) end
        if m.ObjectChams and m.ObjectChams[key] then
            m.ObjectChams[key].FillRGB    = color
            m.ObjectChams[key].OutlineRGB = color
            return true
        end
        return false
    end)
end
local function setEspObjectTransparency(key, value)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if m.ObjectChams and m.ObjectChams[key] then
            m.ObjectChams[key].FillTrans    = tonumber(value) or 0.5
            m.ObjectChams[key].OutlineTrans = tonumber(value) or 0.5
            return true
        end
        return false
    end)
end
local function setEspObjectNamesEnabled(state)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if m.ObjectChams and m.ObjectChams.Names then
            m.ObjectChams.Names.Enabled = state == true
            return true
        end
        return false
    end)
end
local function setEspDroneEnabled(state)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if type(m.ToggleDroneChams) == "function" then m.ToggleDroneChams(state) return true end
        if m.ObjectChams and m.ObjectChams.Drones then
            m.ObjectChams.Drones.Enabled = state == true
            return true
        end
        return false
    end)
end
local function setEspClaymoreEnabled(state)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if type(m.ToggleClaymoreChams) == "function" then m.ToggleClaymoreChams(state) return true end
        if m.ObjectChams and m.ObjectChams.Claymores then
            m.ObjectChams.Claymores.Enabled = state == true
            return true
        end
        return false
    end)
end
local function setEspDroneColor(color)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if type(m.SetDroneChamsFill)    == "function" then m.SetDroneChamsFill(color) end
        if type(m.SetDroneChamsOutline) == "function" then m.SetDroneChamsOutline(color) end
        if m.ObjectChams and m.ObjectChams.Drones then
            m.ObjectChams.Drones.FillRGB    = color
            m.ObjectChams.Drones.OutlineRGB = color
            return true
        end
        return false
    end)
end
local function setEspClaymoreColor(color)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if type(m.SetClaymoreChamsFill)    == "function" then m.SetClaymoreChamsFill(color) end
        if type(m.SetClaymoreChamsOutline) == "function" then m.SetClaymoreChamsOutline(color) end
        if m.ObjectChams and m.ObjectChams.Claymores then
            m.ObjectChams.Claymores.FillRGB    = color
            m.ObjectChams.Claymores.OutlineRGB = color
            return true
        end
        return false
    end)
end
local function setEspDroneTransparency(value)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if m.ObjectChams and m.ObjectChams.Drones then
            m.ObjectChams.Drones.FillTrans    = tonumber(value) or 0.5
            m.ObjectChams.Drones.OutlineTrans = tonumber(value) or 0.5
            return true
        end
        return false
    end)
end
local function setEspClaymoreTransparency(value)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if m.ObjectChams and m.ObjectChams.Claymores then
            m.ObjectChams.Claymores.FillTrans    = tonumber(value) or 0.5
            m.ObjectChams.Claymores.OutlineTrans = tonumber(value) or 0.5
            return true
        end
        return false
    end)
end
local function setEspGadgetsEnabled(state)
    setEspDroneEnabled(state)
    setEspClaymoreEnabled(state)
    for _, key in ipairs({
        "ProximityAlarm","StickyCamera","RemoteC4","ThermiteCharge","ToxicCharge",
        "BreachCharge","HardBreachCharge","ShockBattery","DeployableShield",
        "BarbedWire","SignalDisruptor","BulletproofCamera",
    }) do
        setEspObjectEnabled(key, state)
    end
end

local function setRadarFlag(key, state)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if m.Radar and m.Radar[key] ~= nil then
            m.Radar[key] = state == true
            return true
        end
        return false
    end)
end
local function setRadarNumber(key, value)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if m.Radar and type(m.Radar[key]) == "number" then
            m.Radar[key] = value
            return true
        end
        return false
    end)
end
local function setRadarPositionX(value)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if m.Radar and m.Radar.Position then
            m.Radar.Position = Vector2.new(value, m.Radar.Position.Y)
            return true
        end
        return false
    end)
end
local function setRadarPositionY(value)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if m.Radar and m.Radar.Position then
            m.Radar.Position = Vector2.new(m.Radar.Position.X, value)
            return true
        end
        return false
    end)
end
local function setRadarThemeColor(key, color)
    withModuleRetry(ESP_MODULE_NAME, function(m)
        if m.Radar and m.Radar.Theme and typeof(color) == "Color3" then
            m.Radar.Theme[key] = color
            return true
        end
        return false
    end)
end

local function setFullbright(state)
    withModule("fullbright", function(m)
        if type(m.setEnabled) == "function" then m:setEnabled(state)
        elseif type(m.toggle) == "function" then m:toggle() end
    end)
end
local function setFullbrightSetting(key, value)
    withModule("fullbright", function(m)
        if type(m.setSetting) == "function" then m:setSetting(key, value) end
    end)
end

local function setAttachmentEditorOption(key, value)
    withModule("attachment_editor", function(m)
        if type(m.setOption) == "function" then m:setOption(key, value)
        elseif type(m.updateConfig) == "function" then m:updateConfig({ [key] = value }) end
    end)
end
local function applyAttachmentEditor()
    withModule("attachment_editor", function(m)
        if type(m.applyAll) == "function" then
            local ok, err = m:applyAll()
            if ok == false then error(err) end
        end
    end)
end

local function applyDefaults()
    setSilentAim(false); setSilentAimFov(60); setSilentAimSmoothness(1)
    setSilentAimMode("silent"); setSilentAimTeamCheck(true)
    setAimAssistActivation("mb2"); setSilentAimTargetMode("custom_parts")
    setSilentAimTargetGadgets(false); setSilentAimVisibleCheck(false)
    setSilentAimFovCircleVisual(true)
    setSilentAimSnaplines(false); setSilentAimSnaplineOrigin("Center")
    setAutoShoot(false); setAutoShootDelay(0); setAutoShootTeamCheck(true); setAutoShootTargetGadgets(false); setAutoShootActivation("always")
    setTombradyEnabled(false); setHk69Enabled(false)
    setHomingSpeed(60); setHomingSmoothness(1)

    setGunModEnabled(false); setGunModConfig("recoil_reduction", 0)
    setGunModConfig("horizontal_recoil", 0); setGunModConfig("no_spread", false)
    setGunModConfig("force_auto", false)

    setEspEnabled(false); setEspTeamCheck(false); setEspPlayers(false)
    setEspCorners(false); setEspFilled(false); setEspBoxGradient(true)
    setEspBoxAnimate(false); setEspBoxGradientFill(true); setEspHealthBar(false)
    setEspSkeleton(false); setEspFadeOut(false); setEspNames(false)
    setEspDistances(false); setEspWeapons(false); setEspWeaponIcons(false); setEspChams(false)
    setEspChamsThermal(false); setEspChamsVisibleCheck(false)
    setEspMaxDistance(1000); setEspFontSize(11); setEspCornerThickness(1)
    setEspTracers(false); setEspTracersOrigin("Bottom")
    setEspOffscreenArrows(false); setEspOffscreenArrowsSize(10); setEspOffscreenArrowsTransparency(1)
    setEspOffscreenArrowsShowDistance(true); setEspOffscreenArrowsDistanceFontSize(12)
    setEspCornerLength(15); setEspSkeletonThickness(1); setEspBoxRotationSpeed(300)
    setEspFilledTransparency(0.75); setEspChamsFillTransparency(50)
    setEspChamsOutlineTransparency(50)

    setEspPlayerColor(Color3.fromRGB(255,255,255))
    setEspGradientEndColor(Color3.fromRGB(0,0,0))
    setEspFillGradientStartColor(Color3.fromRGB(255,255,255))
    setEspFillGradientEndColor(Color3.fromRGB(0,0,0))
    setEspSkeletonColor(Color3.fromRGB(255,255,255))
    setEspNameColor(Color3.fromRGB(255,255,255))
    setEspDistanceColor(Color3.fromRGB(255,255,255))
    setEspWeaponColor(Color3.fromRGB(255,255,255))
    setEspWeaponIconSize(15)
    setEspChamsFillColor(Color3.fromRGB(255,80,80))
    setEspChamsOutlineColor(Color3.fromRGB(255,255,255))
    setEspOffscreenArrowsColor(Color3.fromRGB(255,255,255))
    setEspOffscreenArrowsDistanceColor(Color3.fromRGB(255,255,255))
    setEspTracersColor(Color3.fromRGB(255,255,255))
    setSilentAimSnaplineColor(Color3.fromRGB(255,255,255))

    setEspGadgetsEnabled(false); setEspObjectNamesEnabled(false)
    setEspDroneTransparency(0.5); setEspClaymoreTransparency(0.5)
    setEspDroneColor(Color3.fromRGB(0,255,255))
    setEspClaymoreColor(Color3.fromRGB(255,0,0))

    setRadarFlag("Enabled", false); setRadarFlag("Lines", true)
    setRadarFlag("Rotation", false); setRadarFlag("SmoothRot", true)
    setRadarFlag("CardinalDisplay", true); setRadarFlag("ShowOffscreen", true)
    setRadarFlag("DisplayTeammates", false); setRadarFlag("DisplayTeamColors", true)
    setRadarFlag("DisplayFriendColors", true); setRadarFlag("DisplayRGBColors", false)
    setRadarFlag("MarkerFalloff", true); setRadarFlag("UseFallback", false)
    setRadarFlag("UseQuads", true); setRadarFlag("UseTeamColors", false)
    setRadarFlag("VisibilityCheck", false)
    setRadarNumber("LineDistance", 50); setRadarNumber("Scale", 1)
    setRadarNumber("Radius", 120); setRadarNumber("Range", 300)
    setRadarNumber("SmoothRotAmnt", 30); setRadarNumber("MarkerSize", 2)
    setRadarNumber("MarkerScaleBase", 1); setRadarNumber("MarkerScaleMax", 1)
    setRadarNumber("MarkerScaleMin", 0.75); setRadarNumber("MarkerFalloffAmnt", 125)
    setRadarNumber("OffscreenTransparency", 0.3); setRadarNumber("SelfDotSize", 2)
    setRadarPositionX(170); setRadarPositionY(170)
    setRadarThemeColor("Outline",        Color3.fromRGB(35,35,45))
    setRadarThemeColor("Background",     Color3.fromRGB(25,25,35))
    setRadarThemeColor("DragHandle",     Color3.fromRGB(50,50,255))
    setRadarThemeColor("Cardinal_Lines", Color3.fromRGB(110,110,120))
    setRadarThemeColor("Distance_Lines", Color3.fromRGB(65,65,75))
    setRadarThemeColor("Generic_Marker", Color3.fromRGB(255,25,115))
    setRadarThemeColor("Local_Marker",   Color3.fromRGB(115,25,255))
    setRadarThemeColor("Team_Marker",    Color3.fromRGB(25,115,255))
    setRadarThemeColor("Friend_Marker",  Color3.fromRGB(25,255,115))

    setFullbright(false); setFullbrightSetting("Brightness", 1)
    setFullbrightSetting("ClockTime", 12); setFullbrightSetting("FogEnd", 786543)
    setFullbrightSetting("GlobalShadows", false)
    setFullbrightSetting("Ambient", Color3.fromRGB(178,178,178))

    setAttachmentEditorOption("fixSkins", false)
    setAttachmentEditorOption("skin", "Default")
    setAttachmentEditorOption("charm", "Default")
end

local function runStartupInit()
    local initOrder = { "silent_aim", "auto_shoot", "homing_projectiles", "gun_modification", "misc", ESP_MODULE_NAME, "fullbright" }
    for _, name in ipairs(initOrder) do initModule(name, false) end
    applyDefaults()
    log("init complete")
end


local function buildNeverloseUi()
    local NeverLose = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/NeverLose/refs/heads/main/source.luau"))()
    
    local Notification = NeverLose:CreateNotification()
    local Logging = NeverLose:CreateLogger()
    local Indicator = NeverLose:CreateIndicator()
    local window = NeverLose:CreateWindow({
        Logo = "rbxassetid://13129527031",
        Name = "ASTRO.WTF",
        Content = "Operation One",
        Size = NeverLose.Scales.Default,
        ConfigFolder = "AstroOp1",
        Enable3DRenderer = true,
        Keybind = "RightShift"
    })

    local Watermark = window:Watermark()
    local discordBlock = Watermark:AddBlock("discord", "discord.gg/NtBMqWXySm")

    discordBlock:Input(function()
        if setclipboard then
            setclipboard("https://discord.gg/NtBMqWXySm")
            Notification.new({ Title = "ASTRO.WTF", Content = "Discord link copied to clipboard!", Duration = 3 })
        end
    end)

    task.spawn(function()
        while task.wait(1) do
            local pingVal = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
            pingBlock:SetText(tostring(pingVal) .. "MS")
        end
    end)

    window:AddTabLabel('COMBAT')
    local RageTab = window:AddTab({ Icon = 'crosshairs', Name = "Aim" })
    
    window:AddTabLabel('VISUALS')
    local VisualsTab = window:AddTab({ Icon = 'eye', Name = "Visuals" })
    local RadarTab = window:AddTab({ Icon = 'location-pin-map', Name = "Radar" })
    
    window:AddTabLabel('MISC')
    local GadgetsTab = window:AddTab({ Icon = 'backpack', Name = "Gadgets" })
    local LocalTab = window:AddTab({ Icon = 'person', Name = "Local" })

    -- COMBAT / RAGE TAB
    local AimMain = RageTab:AddSection({ Name = "MAIN" })
    local AimSettings = RageTab:AddSection({ Name = "SETTINGS", Position = 'left' })
    local AimWeapon = RageTab:AddSection({ Name = "WEAPON", Position = 'right' })
    local AimHoming = RageTab:AddSection({ Name = "HOMING", Position = 'right' })

    AimMain:AddLabel("Silent Aim"):AddToggle({ Default = false, Callback = setSilentAim, Flag = "sa_enabled" })
    AimMain:AddLabel("Team Check"):AddToggle({ Default = true, Callback = setSilentAimTeamCheck, Flag = "sa_team" })
    AimMain:AddLabel("Visible Check"):AddToggle({ Default = false, Callback = setSilentAimVisibleCheck, Flag = "sa_vis" })
    AimMain:AddLabel("Target Gadgets"):AddToggle({ Default = false, Callback = setSilentAimTargetGadgets, Flag = "sa_targ_gad" })
    AimMain:AddLabel("FOV Circle"):AddToggle({ Default = true, Callback = setSilentAimFovCircleVisual, Flag = "sa_fov_circ" })
    local sa_snap_lbl = AimMain:AddLabel("Snaplines")
    sa_snap_lbl:AddToggle({ Default = false, Callback = setSilentAimSnaplines, Flag = "sa_snap" })
    pcall(function() sa_snap_lbl:AddColorPicker({ Default = Color3.fromRGB(255,255,255), Callback = setSilentAimSnaplineColor, Flag = "sa_snap_clr" }) end)

    AimSettings:AddLabel("FOV Radius"):AddSlider({ Min = 10, Max = 400, Default = 60, Callback = setSilentAimFov, Flag = "sa_fov" })
    AimSettings:AddLabel("Smoothness"):AddSlider({ Min = 1, Max = 100, Default = 100, Type = "%", Size = 95, Callback = function(v) setSilentAimSmoothness(v / 100) end, Flag = "sa_smooth" })
    AimSettings:AddLabel("Aim Mode"):AddDropdown({ Values = { "silent", "aim_assist", "rage" }, Default = "silent", Callback = setSilentAimMode, Flag = "sa_mode" })
    AimSettings:AddLabel("Activation"):AddDropdown({ Values = { "mb2", "mb1", "always", "mobile_hold", "mobile_toggle" }, Default = "mb2", Callback = setAimAssistActivation, Flag = "sa_act" })
    AimSettings:AddLabel("Target Mode"):AddDropdown({ Values = { "custom_parts", "head_only" }, Default = "custom_parts", Callback = setSilentAimTargetMode, Flag = "sa_targ" })
    AimSettings:AddLabel("Snapline Origin"):AddDropdown({ Values = { "Top", "Center", "Bottom" }, Default = "Center", Callback = setSilentAimSnaplineOrigin, Flag = "sa_snap_orig" })

    AimWeapon:AddLabel("Auto Shoot"):AddToggle({ Default = false, Callback = setAutoShoot, Flag = "as_enabled" })
    AimWeapon:AddLabel("Shoot While Running"):AddToggle({ Default = false, Callback = setShootWhileRunning, Flag = "as_run" })
    AimWeapon:AddLabel("TriggerBot Delay"):AddSlider({ Min = 0, Max = 200, Default = 0, Type = "ms", Size = 95, Callback = setAutoShootDelay, Flag = "as_delay" })
    AimWeapon:AddLabel("TriggerBot Team"):AddToggle({ Default = true, Callback = setAutoShootTeamCheck, Flag = "as_team" })
    AimWeapon:AddLabel("TriggerBot Gadgets"):AddToggle({ Default = false, Callback = setAutoShootTargetGadgets, Flag = "as_gadgets" })
    AimWeapon:AddLabel("TriggerBot Activation"):AddDropdown({ Values = { "always", "mb1", "mb2", "mobile_hold", "mobile_toggle" }, Default = "always", Callback = setAutoShootActivation, Flag = "as_act" })

    AimWeapon:AddLabel("Gun Mod"):AddToggle({ Default = false, Callback = setGunModEnabled, Flag = "gm_enabled" })
    AimWeapon:AddLabel("Recoil Reduction"):AddSlider({ Min = 0, Max = 100, Default = 0, Type = "%", Size = 95, Callback = function(v) setGunModConfig("recoil_reduction", v / 100) end, Flag = "gm_recoil" })
    AimWeapon:AddLabel("Horizontal Recoil"):AddSlider({ Min = 0, Max = 100, Default = 0, Type = "%", Size = 95, Callback = function(v) setGunModConfig("horizontal_recoil", v / 100) end, Flag = "gm_hrecoil" })
    AimWeapon:AddLabel("No Spread"):AddToggle({ Default = false, Callback = function(v) setGunModConfig("no_spread", v) end, Flag = "gm_spread" })
    AimWeapon:AddLabel("Force Automatic"):AddToggle({ Default = false, Callback = function(v) setGunModConfig("force_auto", v) end, Flag = "gm_auto" })

    AimHoming:AddLabel("Tombrady Throw"):AddToggle({ Default = false, Callback = setTombradyEnabled, Flag = "hm_tomb" })
    AimHoming:AddLabel("HK69 Homing"):AddToggle({ Default = false, Callback = setHk69Enabled, Flag = "hm_hk" })
    AimHoming:AddLabel("Homing Speed"):AddSlider({ Min = 10, Max = 250, Default = 60, Callback = setHomingSpeed, Flag = "hm_spd" })
    AimHoming:AddLabel("Homing Smoothness"):AddSlider({ Min = 1, Max = 100, Default = 100, Type = "%", Size = 95, Callback = function(v) setHomingSmoothness(v / 100) end, Flag = "hm_smooth" })

    -- VISUALS TAB
    local EspMain = VisualsTab:AddSection({ Name = "ESP", Position = 'left' })
    local EspStyle = VisualsTab:AddSection({ Name = "STYLE", Position = 'right' })
    local Lighting = VisualsTab:AddSection({ Name = "LIGHTING", Position = 'left' })

    local esp_label = EspMain:AddLabel("ESP Enabled")
    esp_label:AddToggle({ Default = false, Callback = setEspEnabled, Flag = "esp_enabled" })
    pcall(function() esp_label:AddColorPicker({ Default = Color3.fromRGB(210, 50, 80), Callback = setEspPlayerColor, Flag = "esp_clr" }) end)

    local esp_opt = esp_label:AddOption()
    esp_opt:AddLabel("Team Check"):AddToggle({ Default = false, Callback = setEspTeamCheck, Flag = "esp_team" })
    esp_opt:AddLabel("Box Full"):AddToggle({ Default = false, Callback = setEspPlayers, Flag = "esp_boxf" })
    esp_opt:AddLabel("Box Corner"):AddToggle({ Default = false, Callback = setEspCorners, Flag = "esp_boxc" })
    esp_opt:AddLabel("Box Fill"):AddToggle({ Default = false, Callback = setEspFilled, Flag = "esp_fill" })
    
    local esp_grad_lbl = esp_opt:AddLabel("Box Gradient")
    esp_grad_lbl:AddToggle({ Default = true, Callback = setEspBoxGradient, Flag = "esp_grad" })
    pcall(function() esp_grad_lbl:AddColorPicker({ Default = Color3.fromRGB(0, 0, 0), Callback = setEspGradientEndColor, Flag = "esp_grad_end" }) end)

    esp_opt:AddLabel("Box Animate"):AddToggle({ Default = false, Callback = setEspBoxAnimate, Flag = "esp_boxa" })

    local esp_fill_grad_lbl = esp_opt:AddLabel("Box Fill Gradient")
    esp_fill_grad_lbl:AddToggle({ Default = true, Callback = setEspBoxGradientFill, Flag = "esp_fill_g" })
    pcall(function() esp_fill_grad_lbl:AddColorPicker({ Default = Color3.fromRGB(0, 0, 0), Callback = setEspFillGradientEndColor, Flag = "esp_fill_end" }) end)

    esp_opt:AddLabel("Health Bar"):AddToggle({ Default = false, Callback = setEspHealthBar, Flag = "esp_hp" })
    
    local esp_skel = EspMain:AddLabel("Skeleton")
    esp_skel:AddToggle({ Default = false, Callback = setEspSkeleton, Flag = "esp_skel" })
    pcall(function() esp_skel:AddColorPicker({ Default = Color3.fromRGB(210, 50, 80), Callback = setEspSkeletonColor, Flag = "esp_skel_clr" }) end)

    local name_lbl = EspMain:AddLabel("Names")
    name_lbl:AddToggle({ Default = false, Callback = setEspNames, Flag = "esp_names" })
    pcall(function() name_lbl:AddColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspNameColor, Flag = "esp_nm_clr" }) end)
    
    local dist_lbl = EspMain:AddLabel("Distance")
    dist_lbl:AddToggle({ Default = false, Callback = setEspDistances, Flag = "esp_dist" })
    pcall(function() dist_lbl:AddColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspDistanceColor, Flag = "esp_dist_clr" }) end)

    local wep_lbl = EspMain:AddLabel("Weapon")
    wep_lbl:AddToggle({ Default = false, Callback = setEspWeapons, Flag = "esp_wep" })
    pcall(function() wep_lbl:AddColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspWeaponColor, Flag = "esp_wep_clr" }) end)

    EspMain:AddLabel("Weapon Icons"):AddToggle({ Default = false, Callback = setEspWeaponIcons, Flag = "esp_wepi" })
    
    local esp_chams = EspMain:AddLabel("Chams")
    esp_chams:AddToggle({ Default = false, Callback = setEspChams, Flag = "esp_chams" })
    pcall(function() esp_chams:AddColorPicker({ Default = Color3.fromRGB(243, 116, 166), Callback = setEspChamsFillColor, Flag = "esp_chams_clr" }) end)

    local chm_opt = esp_chams:AddOption()
    chm_opt:AddLabel("Chams Thermal"):AddToggle({ Default = false, Callback = setEspChamsThermal, Flag = "esp_chm_therm" })
    chm_opt:AddLabel("Chams Vis Check"):AddToggle({ Default = false, Callback = setEspChamsVisibleCheck, Flag = "esp_chm_vis" })
    
    local chm_out_lbl = chm_opt:AddLabel("Chams Outline")
    pcall(function() chm_out_lbl:AddColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspChamsOutlineColor, Flag = "esp_chm_out" }) end)

    local trc_lbl = EspMain:AddLabel("Tracers")
    trc_lbl:AddToggle({ Default = false, Callback = setEspTracers, Flag = "esp_tracers" })
    pcall(function() trc_lbl:AddColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspTracersColor, Flag = "esp_trc_clr" }) end)

    local arr_lbl = EspMain:AddLabel("Offscreen Arrows")
    arr_lbl:AddToggle({ Default = false, Callback = setEspOffscreenArrows, Flag = "esp_off" })
    pcall(function() arr_lbl:AddColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspOffscreenArrowsColor, Flag = "esp_off_clr" }) end)

    local arr_opt = arr_lbl:AddOption()
    local arr_dist_lbl = arr_opt:AddLabel("Show Distance")
    arr_dist_lbl:AddToggle({ Default = true, Callback = setEspOffscreenArrowsShowDistance, Flag = "esp_arr_dist" })
    pcall(function() arr_dist_lbl:AddColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspOffscreenArrowsDistanceColor, Flag = "esp_arr_dclr" }) end)

    EspStyle:AddLabel("Max Distance"):AddSlider({ Min = 100, Max = 3000, Default = 1000, Callback = setEspMaxDistance, Flag = "es_dist" })
    EspStyle:AddLabel("Font Size"):AddSlider({ Min = 8, Max = 24, Default = 11, Callback = setEspFontSize, Flag = "es_font" })
    EspStyle:AddLabel("Corner Len"):AddSlider({ Min = 5, Max = 35, Default = 15, Callback = setEspCornerLength, Flag = "es_corn" })
    EspStyle:AddLabel("Corner Thick"):AddSlider({ Min = 1, Max = 10, Default = 1, Callback = setEspCornerThickness, Flag = "es_cthk" })
    EspStyle:AddLabel("Fill Trans"):AddSlider({ Min = 0, Max = 100, Default = 75, Type = "%", Size = 95, Callback = function(v) setEspFilledTransparency(v / 100) end, Flag = "es_fill_trn" })
    EspStyle:AddLabel("Box Rot Speed"):AddSlider({ Min = 0, Max = 1000, Default = 300, Callback = setEspBoxRotationSpeed, Flag = "es_rot" })
    EspStyle:AddLabel("Skel Thick"):AddSlider({ Min = 1, Max = 10, Default = 1, Callback = setEspSkeletonThickness, Flag = "es_sthk" })
    EspStyle:AddLabel("Wep Icon Size"):AddSlider({ Min = 5, Max = 40, Default = 15, Callback = setEspWeaponIconSize, Flag = "es_wisz" })
    EspStyle:AddLabel("Chams Fill Trn"):AddSlider({ Min = 0, Max = 100, Default = 50, Type = "%", Size = 95, Callback = function(v) setEspChamsFillTransparency(v / 100) end, Flag = "es_cftrn" })
    EspStyle:AddLabel("Chams Out Trn"):AddSlider({ Min = 0, Max = 100, Default = 50, Type = "%", Size = 95, Callback = function(v) setEspChamsOutlineTransparency(v / 100) end, Flag = "es_cotrn" })
    EspStyle:AddLabel("Arrow Size"):AddSlider({ Min = 5, Max = 50, Default = 10, Callback = setEspOffscreenArrowsSize, Flag = "es_asz" })
    EspStyle:AddLabel("Arrow Trans"):AddSlider({ Min = 0, Max = 100, Default = 100, Type = "%", Size = 95, Callback = function(v) setEspOffscreenArrowsTransparency(v / 100) end, Flag = "es_atrn" })
    EspStyle:AddLabel("Arr Font Size"):AddSlider({ Min = 8, Max = 24, Default = 12, Callback = setEspOffscreenArrowsDistanceFontSize, Flag = "es_afsz" })
    EspStyle:AddLabel("Tracer Origin"):AddDropdown({ Values = { "Top", "Center", "Bottom" }, Default = "Bottom", Callback = setEspTracersOrigin, Flag = "es_tr_orig" })

    Lighting:AddLabel("Fullbright"):AddToggle({ Default = false, Callback = setFullbright, Flag = "fb_on" })
    Lighting:AddLabel("FPS Boost"):AddToggle({ Default = false, Callback = function(v) withModule("fullbright", function(m) m:setFpsBoostEnabled(v) end) end, Flag = "fb_fps" })
    Lighting:AddLabel("Brightness"):AddSlider({ Min = 0, Max = 500, Default = 100, Type = "%", Size = 95, Callback = function(v) setFullbrightSetting("Brightness", v / 100) end, Flag = "fb_bright" })
    Lighting:AddLabel("Clock Time"):AddSlider({ Min = 0, Max = 24, Default = 12, Callback = function(v) setFullbrightSetting("ClockTime", v) end, Flag = "fb_clock" })
    Lighting:AddLabel("Fog End"):AddSlider({ Min = 1000, Max = 1000000, Default = 786543, Callback = function(v) setFullbrightSetting("FogEnd", v) end, Flag = "fb_fog" })
    Lighting:AddLabel("Global Shadows"):AddToggle({ Default = false, Callback = function(v) setFullbrightSetting("GlobalShadows", v) end, Flag = "fb_shad" })
    local amb_lbl = Lighting:AddLabel("Ambient Color")
    pcall(function() amb_lbl:AddColorPicker({ Default = Color3.fromRGB(178,178,178), Callback = function(c) setFullbrightSetting("Ambient", c) end, Flag = "fb_amb" }) end)

    -- RADAR TAB
    local RadCore = RadarTab:AddSection({ Name = "CORE", Position = 'left' })
    local RadStyle = RadarTab:AddSection({ Name = "STYLE", Position = 'right' })
    local RadTheme = RadarTab:AddSection({ Name = "THEME", Position = 'right' })

    RadCore:AddLabel("Enabled"):AddToggle({ Default = false, Callback = function(v) setRadarFlag("Enabled", v) end, Flag = "r_en" })
    RadCore:AddLabel("Lines"):AddToggle({ Default = true, Callback = function(v) setRadarFlag("Lines", v) end, Flag = "r_lin" })
    RadCore:AddLabel("Rotation"):AddToggle({ Default = false, Callback = function(v) setRadarFlag("Rotation", v) end, Flag = "r_rot" })
    RadCore:AddLabel("Smooth Rot"):AddToggle({ Default = true, Callback = function(v) setRadarFlag("SmoothRot", v) end, Flag = "r_smrt" })
    RadCore:AddLabel("Cardinal"):AddToggle({ Default = true, Callback = function(v) setRadarFlag("CardinalDisplay", v) end, Flag = "r_card" })
    RadCore:AddLabel("Offscreen"):AddToggle({ Default = true, Callback = function(v) setRadarFlag("ShowOffscreen", v) end, Flag = "r_shof" })
    RadCore:AddLabel("Teammates"):AddToggle({ Default = false, Callback = function(v) setRadarFlag("DisplayTeammates", v) end, Flag = "r_tmat" })
    RadCore:AddLabel("Team Colors"):AddToggle({ Default = true, Callback = function(v) setRadarFlag("DisplayTeamColors", v) end, Flag = "r_tcol" })
    RadCore:AddLabel("Friend Colors"):AddToggle({ Default = true, Callback = function(v) setRadarFlag("DisplayFriendColors", v) end, Flag = "r_fcol" })
    RadCore:AddLabel("RGB Colors"):AddToggle({ Default = false, Callback = function(v) setRadarFlag("DisplayRGBColors", v) end, Flag = "r_rgb" })
    RadCore:AddLabel("Marker Falloff"):AddToggle({ Default = true, Callback = function(v) setRadarFlag("MarkerFalloff", v) end, Flag = "r_mfall" })
    RadCore:AddLabel("Use Quads"):AddToggle({ Default = true, Callback = function(v) setRadarFlag("UseQuads", v) end, Flag = "r_quad" })
    RadCore:AddLabel("Vis Check"):AddToggle({ Default = false, Callback = function(v) setRadarFlag("VisibilityCheck", v) end, Flag = "r_vis" })
    RadCore:AddLabel("Fallback"):AddToggle({ Default = false, Callback = function(v) setRadarFlag("UseFallback", v) end, Flag = "r_fallb" })
    RadCore:AddLabel("Team Colors (2)"):AddToggle({ Default = false, Callback = function(v) setRadarFlag("UseTeamColors", v) end, Flag = "r_tc2" })

    RadStyle:AddLabel("Radius"):AddSlider({ Min = 50, Max = 400, Default = 120, Callback = function(v) setRadarNumber("Radius", v) end, Flag = "r_rad" })
    RadStyle:AddLabel("Range"):AddSlider({ Min = 50, Max = 1000, Default = 300, Callback = function(v) setRadarNumber("Range", v) end, Flag = "r_rng" })
    RadStyle:AddLabel("Scale"):AddSlider({ Min = 10, Max = 500, Default = 100, Type = "%", Size = 95, Callback = function(v) setRadarNumber("Scale", v / 100) end, Flag = "r_scale" })
    RadStyle:AddLabel("Marker Size"):AddSlider({ Min = 1, Max = 20, Default = 2, Callback = function(v) setRadarNumber("MarkerSize", v) end, Flag = "r_msz" })
    RadStyle:AddLabel("Self Dot"):AddSlider({ Min = 1, Max = 20, Default = 2, Callback = function(v) setRadarNumber("SelfDotSize", v) end, Flag = "r_sdot" })
    RadStyle:AddLabel("Line Dist"):AddSlider({ Min = 1, Max = 200, Default = 50, Callback = function(v) setRadarNumber("LineDistance", v) end, Flag = "r_ldist" })
    RadStyle:AddLabel("Smooth Amt"):AddSlider({ Min = 0, Max = 100, Default = 30, Callback = function(v) setRadarNumber("SmoothRotAmnt", v) end, Flag = "r_smamt" })
    RadStyle:AddLabel("Falloff Amt"):AddSlider({ Min = 1, Max = 500, Default = 125, Callback = function(v) setRadarNumber("MarkerFalloffAmnt", v) end, Flag = "r_fallamt" })
    RadStyle:AddLabel("Offscr Trans"):AddSlider({ Min = 0, Max = 100, Default = 30, Type = "%", Size = 95, Callback = function(v) setRadarNumber("OffscreenTransparency", v / 100) end, Flag = "r_offtrn" })
    RadStyle:AddLabel("Pos X"):AddSlider({ Min = 0, Max = 2000, Default = 170, Callback = setRadarPositionX, Flag = "r_px" })
    RadStyle:AddLabel("Pos Y"):AddSlider({ Min = 0, Max = 1200, Default = 170, Callback = setRadarPositionY, Flag = "r_py" })

    local rt_out = RadTheme:AddLabel("Outline")
    pcall(function() rt_out:AddColorPicker({ Default = Color3.fromRGB(35,35,45), Callback = function(c) setRadarThemeColor("Outline", c) end, Flag = "rt_out" }) end)
    local rt_bg = RadTheme:AddLabel("Background")
    pcall(function() rt_bg:AddColorPicker({ Default = Color3.fromRGB(25,25,35), Callback = function(c) setRadarThemeColor("Background", c) end, Flag = "rt_bg" }) end)
    local rt_drag = RadTheme:AddLabel("Drag Handle")
    pcall(function() rt_drag:AddColorPicker({ Default = Color3.fromRGB(50,50,255), Callback = function(c) setRadarThemeColor("DragHandle", c) end, Flag = "rt_drag" }) end)
    local rt_card = RadTheme:AddLabel("Cardinal Lines")
    pcall(function() rt_card:AddColorPicker({ Default = Color3.fromRGB(110,110,120), Callback = function(c) setRadarThemeColor("Cardinal_Lines", c) end, Flag = "rt_card" }) end)
    local rt_dlin = RadTheme:AddLabel("Dist Lines")
    pcall(function() rt_dlin:AddColorPicker({ Default = Color3.fromRGB(65,65,75), Callback = function(c) setRadarThemeColor("Distance_Lines", c) end, Flag = "rt_dlin" }) end)
    local rt_gen = RadTheme:AddLabel("Generic Marker")
    pcall(function() rt_gen:AddColorPicker({ Default = Color3.fromRGB(255,25,115), Callback = function(c) setRadarThemeColor("Generic_Marker", c) end, Flag = "rt_gen" }) end)
    local rt_loc = RadTheme:AddLabel("Local Marker")
    pcall(function() rt_loc:AddColorPicker({ Default = Color3.fromRGB(115,25,255), Callback = function(c) setRadarThemeColor("Local_Marker", c) end, Flag = "rt_loc" }) end)
    local rt_team = RadTheme:AddLabel("Team Marker")
    pcall(function() rt_team:AddColorPicker({ Default = Color3.fromRGB(25,115,255), Callback = function(c) setRadarThemeColor("Team_Marker", c) end, Flag = "rt_team" }) end)
    local rt_fri = RadTheme:AddLabel("Friend Marker")
    pcall(function() rt_fri:AddColorPicker({ Default = Color3.fromRGB(25,255,115), Callback = function(c) setRadarThemeColor("Friend_Marker", c) end, Flag = "rt_fri" }) end)

    -- GADGETS TAB
    local GadChams = GadgetsTab:AddSection({ Name = "GADGET CHAMS", Position = 'left' })
    local GadColors = GadgetsTab:AddSection({ Name = "GADGET COLORS & TRANS", Position = 'right' })

    GadChams:AddLabel("Object Labels"):AddToggle({ Default = false, Callback = setEspObjectNamesEnabled, Flag = "g_names" })
    
    local gadgetKeys = {
        { key = "Drones", label = "Drone Chams", fn = setEspDroneEnabled },
        { key = "Claymores", label = "Claymore Chams", fn = setEspClaymoreEnabled },
        { key = "ProximityAlarm", label = "Proximity Alarm", fn = function(v) setEspObjectEnabled("ProximityAlarm", v) end },
        { key = "StickyCamera", label = "Sticky Camera", fn = function(v) setEspObjectEnabled("StickyCamera", v) end },
        { key = "RemoteC4", label = "Remote C4", fn = function(v) setEspObjectEnabled("RemoteC4", v) end },
        { key = "ThermiteCharge", label = "Thermite Charge", fn = function(v) setEspObjectEnabled("ThermiteCharge", v) end },
        { key = "ToxicCharge", label = "Toxic Charge", fn = function(v) setEspObjectEnabled("ToxicCharge", v) end },
        { key = "BreachCharge", label = "Breach Charge", fn = function(v) setEspObjectEnabled("BreachCharge", v) end },
        { key = "HardBreachCharge", label = "Hard Breach", fn = function(v) setEspObjectEnabled("HardBreachCharge", v) end },
        { key = "ShockBattery", label = "Shock Battery", fn = function(v) setEspObjectEnabled("ShockBattery", v) end },
        { key = "DeployableShield", label = "Deployable Shield", fn = function(v) setEspObjectEnabled("DeployableShield", v) end },
        { key = "BarbedWire", label = "Barbed Wire", fn = function(v) setEspObjectEnabled("BarbedWire", v) end },
        { key = "SignalDisruptor", label = "Signal Disruptor", fn = function(v) setEspObjectEnabled("SignalDisruptor", v) end },
        { key = "BulletproofCamera", label = "Bulletproof Camera", fn = function(v) setEspObjectEnabled("BulletproofCamera", v) end },
    }

    for _, g in ipairs(gadgetKeys) do
        GadChams:AddLabel(g.label):AddToggle({ Default = false, Callback = g.fn, Flag = "g_" .. g.key })
    end

    local defaultGadgetColors = {
        Drones            = Color3.fromRGB(0, 255, 255),
        Claymores         = Color3.fromRGB(255, 0, 0),
        ProximityAlarm    = Color3.fromRGB(255, 150, 0),
        StickyCamera      = Color3.fromRGB(0, 200, 255),
        RemoteC4          = Color3.fromRGB(255, 50, 50),
        ThermiteCharge    = Color3.fromRGB(255, 120, 0),
        ToxicCharge       = Color3.fromRGB(80, 255, 80),
        BreachCharge      = Color3.fromRGB(255, 80, 80),
        HardBreachCharge  = Color3.fromRGB(200, 80, 255),
        ShockBattery      = Color3.fromRGB(255, 255, 0),
        DeployableShield  = Color3.fromRGB(100, 180, 255),
        BarbedWire        = Color3.fromRGB(180, 140, 80),
        SignalDisruptor   = Color3.fromRGB(80, 80, 255),
        BulletproofCamera = Color3.fromRGB(0, 255, 200),
    }

    local gadgetTargets = {
        { key = "Drones", label = "Drone", colorFn = setEspDroneColor, transFn = function(v) setEspDroneTransparency(v/100) end },
        { key = "Claymores", label = "Claymore", colorFn = setEspClaymoreColor, transFn = function(v) setEspClaymoreTransparency(v/100) end },
        { key = "ProximityAlarm", label = "Proximity Alarm", colorFn = function(c) setEspObjectColor("ProximityAlarm", c) end, transFn = function(v) setEspObjectTransparency("ProximityAlarm", v/100) end },
        { key = "StickyCamera", label = "Sticky Camera", colorFn = function(c) setEspObjectColor("StickyCamera", c) end, transFn = function(v) setEspObjectTransparency("StickyCamera", v/100) end },
        { key = "RemoteC4", label = "Remote C4", colorFn = function(c) setEspObjectColor("RemoteC4", c) end, transFn = function(v) setEspObjectTransparency("RemoteC4", v/100) end },
        { key = "ThermiteCharge", label = "Thermite Charge", colorFn = function(c) setEspObjectColor("ThermiteCharge", c) end, transFn = function(v) setEspObjectTransparency("ThermiteCharge", v/100) end },
        { key = "ToxicCharge", label = "Toxic Charge", colorFn = function(c) setEspObjectColor("ToxicCharge", c) end, transFn = function(v) setEspObjectTransparency("ToxicCharge", v/100) end },
        { key = "BreachCharge", label = "Breach Charge", colorFn = function(c) setEspObjectColor("BreachCharge", c) end, transFn = function(v) setEspObjectTransparency("BreachCharge", v/100) end },
        { key = "HardBreachCharge", label = "Hard Breach", colorFn = function(c) setEspObjectColor("HardBreachCharge", c) end, transFn = function(v) setEspObjectTransparency("HardBreachCharge", v/100) end },
        { key = "ShockBattery", label = "Shock Battery", colorFn = function(c) setEspObjectColor("ShockBattery", c) end, transFn = function(v) setEspObjectTransparency("ShockBattery", v/100) end },
        { key = "DeployableShield", label = "Deployable Shield", colorFn = function(c) setEspObjectColor("DeployableShield", c) end, transFn = function(v) setEspObjectTransparency("DeployableShield", v/100) end },
        { key = "BarbedWire", label = "Barbed Wire", colorFn = function(c) setEspObjectColor("BarbedWire", c) end, transFn = function(v) setEspObjectTransparency("BarbedWire", v/100) end },
        { key = "SignalDisruptor", label = "Signal Disruptor", colorFn = function(c) setEspObjectColor("SignalDisruptor", c) end, transFn = function(v) setEspObjectTransparency("SignalDisruptor", v/100) end },
        { key = "BulletproofCamera", label = "Bulletproof Camera", colorFn = function(c) setEspObjectColor("BulletproofCamera", c) end, transFn = function(v) setEspObjectTransparency("BulletproofCamera", v/100) end },
    }

    for _, t in ipairs(gadgetTargets) do
        local lbl = GadColors:AddLabel(t.label)
        pcall(function() lbl:AddColorPicker({ Default = defaultGadgetColors[t.key] or Color3.new(1,1,1), Callback = t.colorFn, Flag = "gc_" .. t.key }) end)
        local opt = lbl:AddOption()
        opt:AddLabel("Transparency"):AddSlider({ Min = 0, Max = 100, Default = 50, Type = "%", Size = 90, Callback = t.transFn, Flag = "gt_" .. t.key })
    end

    -- LOCAL TAB
    local SkinS = LocalTab:AddSection({ Name = "SKIN CHANGER", Position = 'left' })
    local CharmS = LocalTab:AddSection({ Name = "CHARM CHANGER", Position = 'right' })
    local LocalMisc = LocalTab:AddSection({ Name = "MISC", Position = 'left' })

    SkinS:AddLabel("Weapon Skin"):AddDropdown({ 
        Values = { "Default","TidalWaveAK","CherryBlossom","RoyalCAL12","RedLineAW50","RedLineReaper","BlueFlowers","Synthwave","TigerCamo","Toxic","ToyGunM4","YellowPattern","RedRoses","BlackCamo","Blue","CarbonFiber","Cardboard","CheckeredSkin","ClassicAA12","CrackedEarth","DarkRedCamo","DeepRed","DesertCamo","Diamond","FestiveLightsM4","ForestCamo","FrenchSticker","Ghillie","GhostShipSkin","GhostSkin","GhostStickerSkin","Golden","Green","HalloweenParty","HazardMP7","HazardSkin","HotRedL85","Kalash","MakeshiftBeretta","NeonShapesM249","OilSpill","PurpleFadeC775","Red","RustyAUG","Skulls","SnowCamo","Space","SpiderWebSkin","Splattered","Steyr","Tan","WastelandRSh12","White","Yellow" }, 
        Default = "Default", 
        Callback = function(v) setAttachmentEditorOption("skin", v) end, 
        Flag = "lc_skin" 
    })

    CharmS:AddLabel("Charm"):AddDropdown({ 
        Values = { "Default","DiamondBurgerCharm","FishCharm","GoldMedal","GoldenTrophy","HourglassCharm","JussisCharm","LoveHeart","MedalTVCharm","NXTCharm","StaffCharm","TSKCharm","WalkieTalkieCharm","YinYangCharm","8BallCharm","AceCard","BananaCharm","BellCharm","BlueBall","BulletCharm","ChristmasTreeCharm","ColorfulSquares","DiamondCharm","DogTagCharm","EyeballCharm","GhostCharm","LuckyCharm","PumpkinCharm","S1Bronze","S1Champion","S1Diamond","S1Gold","S1Platinum","S1Silver","S2Bronze","S2Champion","S2Diamond","S2Gold","S2Platinum","S2Silver","SnowGlobeCharm","SnowflakeCharm","TargetPracticeCharm" }, 
        Default = "Default", 
        Callback = function(v) setAttachmentEditorOption("charm", v) end, 
        Flag = "lc_charm" 
    })

    LocalMisc:AddLabel("Fix Skins"):AddToggle({ 
        Default = false, 
        Callback = function(v) setAttachmentEditorOption("fixSkins", v) end, 
        Flag = "lc_fix" 
    })

    LocalMisc:AddButton({
        Icon = 'check',
        Name = "Apply Skin / Charm",
        Callback = function()
            pcall(applyAttachmentEditor)
            Notification.new({ Title = "Skin Changer", Content = "Applied successfully!", Duration = 3 })
        end
    })

    -- USER SETTINGS / CONFIG
    window.UserSettings:AddLabel("Menu Keybind"):AddKeybind({ Default = 'RightShift', Callback = function(v) window.Keybind = v end })
    window.UserSettings:AddLabel("Menu Scale"):AddDropdown({ Values = {"Default", "Large", "Mobile", "Small"}, Default = "Default", Callback = function(v) window:SetSize(NeverLose.Scales[v]) end })
    window.UserSettings:AddLabel("3D Menu"):AddToggle({ Default = false, Callback = function(v) pcall(function() window:Set3DRender(v) end) end })
    window.UserSettings:AddButton({
        Icon = 'x',
        Name = "Unload Script",
        Callback = function()
            setSilentAim(false)
            setAutoShoot(false)
            setEspEnabled(false)
            window:ToggleInterface()
            Notification.new({ Title = "ASTRO.WTF", Content = "Unloaded", Duration = 3 })
        end
    })

    Notification.new({
        Title = "ASTRO.WTF",
        Content = "Loaded successfully!",
        Duration = 5,
    })
end

local okInit, initErr = pcall(runStartupInit)
if not okInit then log("startup init failed") end

local okUi, uiErr = pcall(buildNeverloseUi)
if not okUi then log("UI build failed: " .. tostring(uiErr)) end

pcall(function() game:GetService("WebViewService"):Destroy() end)
warn("init")

