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

local NeverLose = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/NeverLose/refs/heads/main/source.luau"))()

local function buildNeverloseUi()
    local Notification = NeverLose:CreateNotification()
    local Logging = NeverLose:CreateLogger()
    local Indicator = NeverLose:CreateIndicator()
    
    local window = NeverLose:CreateWindow({
        Logo = NeverLose.GlobalLogo,
        Name = "ASTRO.WTF",
        Content = "Operation One",
        Size = NeverLose.Scales.Default,
        ConfigFolder = "AstroOp1",
        Enable3DRenderer = false,
        Keybind = "RightShift"
    })

    window:AddTabLabel('COMBAT')
    local RageTab = window:AddTab({ Icon = 'crosshairs', Name = "Rage" })
    
    window:AddTabLabel('VISUALS')
    local VisualsTab = window:AddTab({ Icon = 'eye', Name = "Visuals" })
    local RadarTab = window:AddTab({ Icon = 'radio', Name = "Radar" })
    
    window:AddTabLabel('MISC')
    local GadgetsTab = window:AddTab({ Icon = 'box', Name = "Gadgets" })
    local LocalTab = window:AddTab({ Icon = 'user', Name = "Local" })
    local SettingsTab = window:AddTab({ Icon = 'settings', Name = "Settings" })

    -- RAGE TAB
    local AimMain = RageTab:AddSection({ Name = "MAIN" })
    local AimSettings = RageTab:AddSection({ Name = "SETTINGS", Position = 'left' })
    local AimWeapon = RageTab:AddSection({ Name = "WEAPON", Position = 'right' })
    local AimHoming = RageTab:AddSection({ Name = "HOMING", Position = 'right' })

    local sa_label = AimMain:AddLabel("Silent Aim")
    sa_label:AddToggle({ 
        Default = false, 
        Callback = setSilentAim, 
        Flag = "sa_enabled" 
    })
    
    local sa_opt = sa_label:AddOption()
    sa_opt:AddLabel("Team Check"):AddToggle({ 
        Default = true, 
        Callback = setSilentAimTeamCheck, 
        Flag = "sa_team" 
    })
    
    sa_opt:AddLabel("Visible Check"):AddToggle({ 
        Default = false, 
        Callback = setSilentAimVisibleCheck, 
        Flag = "sa_vis" 
    })
    
    sa_opt:AddLabel("FOV Circle"):AddToggle({ 
        Default = true, 
        Callback = setSilentAimFovCircleVisual, 
        Flag = "sa_fov_circ" 
    })

    local sa_snap_label = sa_opt:AddLabel("Snaplines")
    sa_snap_label:AddToggle({ 
        Default = false, 
        Callback = setSilentAimSnaplines, 
        Flag = "sa_snap" 
    })
    pcall(function() sa_snap_label:AddColorPicker({ Default = Color3.fromRGB(255,255,255), Callback = setSilentAimSnaplineColor, Flag = "sa_snap_clr" }) end)

    AimSettings:AddLabel("FOV Radius"):AddSlider({ 
        Min = 10, 
        Max = 400, 
        Default = 60, 
        Callback = setSilentAimFov, 
        Flag = "sa_fov" 
    })

    AimSettings:AddLabel("Smoothness"):AddSlider({ 
        Min = 1, 
        Max = 100, 
        Default = 100, 
        Type = "%", 
        Size = 95,
        Callback = function(v) setSilentAimSmoothness(v / 100) end, 
        Flag = "sa_smooth" 
    })
    
    AimSettings:AddLabel("Aim Mode"):AddDropdown({ 
        Values = { "silent", "aim_assist", "rage" }, 
        Default = "silent", 
        Callback = setSilentAimMode, 
        Flag = "sa_mode" 
    })

    AimSettings:AddLabel("Activation"):AddDropdown({ 
        Values = { "mb2", "mb1", "always", "mobile_hold", "mobile_toggle" }, 
        Default = "mb2", 
        Callback = setAimAssistActivation, 
        Flag = "sa_act" 
    })

    AimSettings:AddLabel("Target Mode"):AddDropdown({ 
        Values = { "custom_parts", "head_only" }, 
        Default = "custom_parts", 
        Callback = setSilentAimTargetMode, 
        Flag = "sa_targ" 
    })

    AimSettings:AddLabel("Snapline Origin"):AddDropdown({ 
        Values = { "Top", "Center", "Bottom" }, 
        Default = "Center", 
        Callback = setSilentAimSnaplineOrigin, 
        Flag = "sa_snap_orig" 
    })

    local as_label = AimWeapon:AddLabel("Auto Shoot")
    as_label:AddToggle({ 
        Default = false, 
        Callback = setAutoShoot, 
        Flag = "as_enabled" 
    })
    
    local as_opt = as_label:AddOption()
    as_opt:AddLabel("Run Shoot"):AddToggle({ 
        Default = false, 
        Callback = setShootWhileRunning, 
        Flag = "as_run" 
    })
    
    as_opt:AddLabel("Delay"):AddSlider({ 
        Min = 0, 
        Max = 200, 
        Default = 0, 
        Type = "ms", 
        Size = 90,
        Callback = setAutoShootDelay, 
        Flag = "as_delay" 
    })
    
    as_opt:AddLabel("Team Check"):AddToggle({ 
        Default = true, 
        Callback = setAutoShootTeamCheck, 
        Flag = "as_team" 
    })
    
    as_opt:AddLabel("Target Gadgets"):AddToggle({ 
        Default = false, 
        Callback = setAutoShootTargetGadgets, 
        Flag = "as_gadgets" 
    })
    
    as_opt:AddLabel("Activation"):AddDropdown({ 
        Values = { "always", "mb1", "mb2", "mobile_hold", "mobile_toggle" }, 
        Default = "always", 
        Callback = setAutoShootActivation, 
        Flag = "as_act" 
    })

    local gm_label = AimWeapon:AddLabel("Gun Mod")
    gm_label:AddToggle({ 
        Default = false, 
        Callback = setGunModEnabled, 
        Flag = "gm_enabled" 
    })
    
    local gm_opt = gm_label:AddOption()
    gm_opt:AddLabel("Recoil Reduc"):AddSlider({ 
        Min = 0, 
        Max = 100, 
        Default = 0, 
        Type = "%", 
        Size = 90,
        Callback = function(v) setGunModConfig("recoil_reduction", v / 100) end, 
        Flag = "gm_recoil" 
    })
    
    gm_opt:AddLabel("H-Recoil"):AddSlider({ 
        Min = 0, 
        Max = 100, 
        Default = 0, 
        Type = "%", 
        Size = 90,
        Callback = function(v) setGunModConfig("horizontal_recoil", v / 100) end, 
        Flag = "gm_hrecoil" 
    })
    
    gm_opt:AddLabel("No Spread"):AddToggle({ 
        Default = false, 
        Callback = function(v) setGunModConfig("no_spread", v) end, 
        Flag = "gm_spread" 
    })
    
    gm_opt:AddLabel("Force Auto"):AddToggle({ 
        Default = false, 
        Callback = function(v) setGunModConfig("force_auto", v) end, 
        Flag = "gm_auto" 
    })

    local hm_label = AimHoming:AddLabel("Tombrady")
    hm_label:AddToggle({ 
        Default = false, 
        Callback = setTombradyEnabled, 
        Flag = "hm_tomb" 
    })
    
    local hm_opt = hm_label:AddOption()
    hm_opt:AddLabel("HK69 Homing"):AddToggle({ 
        Default = false, 
        Callback = setHk69Enabled, 
        Flag = "hm_hk" 
    })
    
    hm_opt:AddLabel("Speed"):AddSlider({ 
        Min = 10, 
        Max = 250, 
        Default = 60, 
        Callback = setHomingSpeed, 
        Flag = "hm_spd" 
    })
    
    hm_opt:AddLabel("Smoothness"):AddSlider({ 
        Min = 1, 
        Max = 100, 
        Default = 100, 
        Type = "%", 
        Size = 90,
        Callback = function(v) setHomingSmoothness(v / 100) end, 
        Flag = "hm_smooth" 
    })

    -- VISUALS TAB
    local EspMain = VisualsTab:AddSection({ Name = "ESP", Position = 'left' })
    local EspStyle = VisualsTab:AddSection({ Name = "STYLE", Position = 'right' })
    local Lighting = VisualsTab:AddSection({ Name = "LIGHTING", Position = 'left' })

    local esp_label = EspMain:AddLabel("Enabled")
    esp_label:AddToggle({ 
        Default = false, 
        Callback = setEspEnabled, 
        Flag = "esp_enabled" 
    })
    pcall(function() esp_label:AddColorPicker({ Default = Color3.fromRGB(210, 50, 80), Callback = setEspPlayerColor, Flag = "esp_clr" }) end)

    local esp_opt = esp_label:AddOption()
    esp_opt:AddLabel("Team Check"):AddToggle({ Default = false, Callback = setEspTeamCheck, Flag = "esp_team" })
    esp_opt:AddLabel("Box Full"):AddToggle({ Default = false, Callback = setEspPlayers, Flag = "esp_boxf" })
    esp_opt:AddLabel("Box Corner"):AddToggle({ Default = false, Callback = setEspCorners, Flag = "esp_boxc" })
    esp_opt:AddLabel("Box Fill"):AddToggle({ Default = false, Callback = setEspFilled, Flag = "esp_fill" })
    esp_opt:AddLabel("Box Gradient"):AddToggle({ Default = true, Callback = setEspBoxGradient, Flag = "esp_grad" })
    esp_opt:AddLabel("Health Bar"):AddToggle({ Default = false, Callback = setEspHealthBar, Flag = "esp_hp" })
    
    local esp_skel = EspMain:AddLabel("Skeleton")
    esp_skel:AddToggle({ Default = false, Callback = setEspSkeleton, Flag = "esp_skel" })
    pcall(function() esp_skel:AddColorPicker({ Default = Color3.fromRGB(210, 50, 80), Callback = setEspSkeletonColor, Flag = "esp_skel_clr" }) end)

    local ext_opt = esp_skel:AddOption()
    ext_opt:AddLabel("Names"):AddToggle({ Default = false, Callback = setEspNames, Flag = "esp_names" })
    ext_opt:AddLabel("Distance"):AddToggle({ Default = false, Callback = setEspDistances, Flag = "esp_dist" })
    ext_opt:AddLabel("Weapon"):AddToggle({ Default = false, Callback = setEspWeapons, Flag = "esp_wep" })
    
    local esp_chams = EspMain:AddLabel("Chams")
    esp_chams:AddToggle({ Default = false, Callback = setEspChams, Flag = "esp_chams" })
    pcall(function() esp_chams:AddColorPicker({ Default = Color3.fromRGB(243, 116, 166), Callback = setEspChamsFillColor, Flag = "esp_chams_clr" }) end)

    local chm_opt = esp_chams:AddOption()
    chm_opt:AddLabel("Tracers"):AddToggle({ Default = false, Callback = setEspTracers, Flag = "esp_tracers" })
    chm_opt:AddLabel("Offscreen Arrows"):AddToggle({ Default = false, Callback = setEspOffscreenArrows, Flag = "esp_off" })

    EspStyle:AddLabel("Max Distance"):AddSlider({ Min = 100, Max = 3000, Default = 1000, Callback = setEspMaxDistance, Flag = "es_dist" })
    EspStyle:AddLabel("Font Size"):AddSlider({ Min = 8, Max = 24, Default = 11, Callback = setEspFontSize, Flag = "es_font" })
    EspStyle:AddLabel("Corner Len"):AddSlider({ Min = 5, Max = 35, Default = 15, Callback = setEspCornerLength, Flag = "es_corn" })
    EspStyle:AddLabel("Fill Trans"):AddSlider({ Min = 0, Max = 100, Default = 75, Type = "%", Size = 95, Callback = function(v) setEspFilledTransparency(v / 100) end, Flag = "es_fill_trn" })
    EspStyle:AddLabel("Tracer Origin"):AddDropdown({ Values = { "Top", "Center", "Bottom" }, Default = "Bottom", Callback = setEspTracersOrigin, Flag = "es_tr_orig" })

    Lighting:AddLabel("Fullbright"):AddToggle({ Default = false, Callback = setFullbright, Flag = "fb_on" })
    Lighting:AddLabel("Brightness"):AddSlider({ Min = 0, Max = 500, Default = 100, Type = "%", Size = 95, Callback = function(v) setFullbrightSetting("Brightness", v / 100) end, Flag = "fb_bright" })
    Lighting:AddLabel("Clock Time"):AddSlider({ Min = 0, Max = 24, Default = 12, Callback = function(v) setFullbrightSetting("ClockTime", v) end, Flag = "fb_clock" })
    Lighting:AddLabel("Ambient"):AddColorPicker({ Default = Color3.fromRGB(178,178,178), Callback = function(c) setFullbrightSetting("Ambient", c) end, Flag = "fb_amb" })

    -- RADAR TAB
    local RadCore = RadarTab:AddSection({ Name = "CORE", Position = 'left' })
    local RadStyle = RadarTab:AddSection({ Name = "STYLE", Position = 'right' })

    RadCore:AddLabel("Enabled"):AddToggle({ Default = false, Callback = function(v) setRadarFlag("Enabled", v) end, Flag = "r_en" })
    RadCore:AddLabel("Rotation"):AddToggle({ Default = false, Callback = function(v) setRadarFlag("Rotation", v) end, Flag = "r_rot" })
    RadCore:AddLabel("Cardinal"):AddToggle({ Default = true, Callback = function(v) setRadarFlag("CardinalDisplay", v) end, Flag = "r_card" })
    
    RadStyle:AddLabel("Radius"):AddSlider({ Min = 50, Max = 400, Default = 120, Callback = function(v) setRadarNumber("Radius", v) end, Flag = "r_rad" })
    RadStyle:AddLabel("Range"):AddSlider({ Min = 50, Max = 1000, Default = 300, Callback = function(v) setRadarNumber("Range", v) end, Flag = "r_rng" })

    -- GADGETS TAB
    local GadMain = GadgetsTab:AddSection({ Name = "OBJECT ESP", Position = 'left' })
    GadMain:AddLabel("Names"):AddToggle({ Default = false, Callback = setEspObjectNamesEnabled, Flag = "g_names" })
    
    local gadgetKeys = {
        { key = "Drones", label = "Drones", fn = setEspDroneEnabled },
        { key = "Claymores", label = "Claymores", fn = setEspClaymoreEnabled },
    }
    for _, g in ipairs(gadgetKeys) do
        local l = GadMain:AddLabel(g.label)
        l:AddToggle({ Default = false, Callback = g.fn, Flag = "g_" .. g.key })
    end

        -- LOCAL TAB
    local SkinS = LocalTab:AddSection({ Name = "SKIN CHANGER", Position = 'left' })
    SkinS:AddLabel("Weapon Skin"):AddDropdown({ Values = { "Default","TidalWaveAK","CherryBlossom","RoyalCAL12","RedLineAW50" }, Default = "Default", Callback = function(v) setAttachmentEditorOption("skin", v) end, Flag = "lc_skin" })
    
    local applyLabel = SkinS:AddLabel("Apply Settings")
    applyLabel:AddToggle({ 
        Default = false, 
        Callback = function(v) 
            if v then 
                pcall(applyAttachmentEditor) 
                Notification.new({ Title = "Skin Changer", Content = "Applied successfully!", Duration = 3 })
            end 
        end, 
        Flag = "lc_apply" 
    })

    -- SETTINGS TAB
    window.UserSettings:AddLabel("Menu Keybind"):AddKeybind({ Default = 'RightShift', Callback = function(v) window.Keybind = v end })
    
    local unloadLabel = window.UserSettings:AddLabel("Exit Script")
    unloadLabel:AddToggle({
        Default = false,
        Callback = function(v)
            if v then
                -- Manual cleanup logic since this lib might not have a direct Unload method
                setSilentAim(false)
                setAutoShoot(false)
                setEspEnabled(false)
                window:ToggleInterface()
                Notification.new({ Title = "ASTRO.WTF", Content = "Unloaded", Duration = 3 })
            end
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
