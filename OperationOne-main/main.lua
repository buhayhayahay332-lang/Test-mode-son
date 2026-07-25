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

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/NeverLose/main/Source.lua"))()

local function buildNeverloseUi()
    local Window = Library:Window({
        Title = "ASTRO.WTF",
        Footer = "discord.gg/NtBMqWXySm",
        Key = Enum.KeyCode.RightShift
    })

    local Tabs = {
        Combat   = Window:Tab({ Name = "Combat", Icon = "rbxassetid://10709751939" }),
        Visuals  = Window:Tab({ Name = "Visuals", Icon = "rbxassetid://10709752035" }),
        Gadgets  = Window:Tab({ Name = "ESP Gadgets", Icon = "rbxassetid://10709752119" }),
        Radar    = Window:Tab({ Name = "Radar", Icon = "rbxassetid://10709819149" }),
        Local    = Window:Tab({ Name = "Local", Icon = "rbxassetid://10709752132" }),
        Settings = Window:Tab({ Name = "UI Settings", Icon = "rbxassetid://10709752210" }),
    }

    -- COMBAT
    local AimL = Tabs.Combat:Section({ Name = "Aimbot", Side = "Left" })
    local AimR = Tabs.Combat:Section({ Name = "Weapon", Side = "Right" })
    local HomingR = Tabs.Combat:Section({ Name = "THROWABLES/HK69 SILENT AIM", Side = "Right" })

    AimL:Toggle({ Name = "Silent Aim / Aimbot", Default = false, Callback = setSilentAim })
    AimL:Toggle({ Name = "Team Check", Default = true, Callback = setSilentAimTeamCheck })
    AimL:Toggle({ Name = "Visible Check", Default = false, Callback = setSilentAimVisibleCheck })
    AimL:Toggle({ Name = "FOV Circle", Default = true, Callback = setSilentAimFovCircleVisual })
    AimL:Toggle({ Name = "Snaplines", Default = false, Callback = setSilentAimSnaplines }):ColorPicker({ Default = Color3.fromRGB(255,255,255), Callback = setSilentAimSnaplineColor })
    AimL:Slider({ Name = "FOV Radius", Min = 10, Max = 400, Default = 60, Callback = setSilentAimFov })
    AimL:Slider({ Name = "Smoothness", Min = 1, Max = 100, Default = 100, Suffix = "%", Callback = function(v) setSilentAimSmoothness(v / 100) end })
    AimL:Dropdown({ Name = "Aim Mode", Values = { "silent", "aim_assist", "rage" }, Default = "silent", Callback = setSilentAimMode })
    AimL:Dropdown({ Name = "Activation", Values = { "mb2", "mb1", "always", "mobile_hold", "mobile_toggle" }, Default = "mb2", Callback = setAimAssistActivation })
    AimL:Dropdown({ Name = "Target Mode", Values = { "custom_parts", "head_only" }, Default = "custom_parts", Callback = setSilentAimTargetMode })
    AimL:Dropdown({ Name = "Snapline Origin", Values = { "Top", "Center", "Bottom" }, Default = "Center", Callback = setSilentAimSnaplineOrigin })
    
    AimL:Separator()
    AimL:Toggle({ Name = "Auto Shoot / Triggerbot", Default = false, Callback = setAutoShoot })
    AimL:Toggle({ Name = "Shoot While Running", Default = false, Callback = setShootWhileRunning })
    AimL:Slider({ Name = "TriggerBot Delay", Min = 0, Max = 200, Default = 0, Suffix = "ms", Callback = setAutoShootDelay })
    AimL:Toggle({ Name = "TriggerBot Team Check", Default = true, Callback = setAutoShootTeamCheck })
    AimL:Toggle({ Name = "TriggerBot Target Gadgets", Default = false, Callback = setAutoShootTargetGadgets })
    AimL:Dropdown({ Name = "TriggerBot Activation", Values = { "always", "mb1", "mb2", "mobile_hold", "mobile_toggle" }, Default = "always", Callback = setAutoShootActivation })
    
    AimL:Separator()
    AimL:Toggle({ Name = "Target Gadgets", Default = false, Callback = setSilentAimTargetGadgets })

    AimR:Toggle({ Name = "Gun Mod Enabled", Default = false, Callback = setGunModEnabled })
    AimR:Slider({ Name = "Recoil Reduction", Min = 0, Max = 100, Default = 0, Suffix = "%", Callback = function(v) setGunModConfig("recoil_reduction", v / 100) end })
    AimR:Slider({ Name = "Horizontal Recoil", Min = 0, Max = 100, Default = 0, Suffix = "%", Callback = function(v) setGunModConfig("horizontal_recoil", v / 100) end })
    AimR:Toggle({ Name = "No Spread", Default = false, Callback = function(v) setGunModConfig("no_spread", v) end })
    AimR:Toggle({ Name = "Force Automatic", Default = false, Callback = function(v) setGunModConfig("force_auto", v) end })

    HomingR:Toggle({ Name = "Tombrady Throw", Default = false, Callback = setTombradyEnabled })
    HomingR:Toggle({ Name = "HK69 Homing", Default = false, Callback = setHk69Enabled })
    HomingR:Slider({ Name = "Homing Speed", Min = 10, Max = 250, Default = 60, Callback = setHomingSpeed })
    HomingR:Slider({ Name = "Homing Smoothness", Min = 1, Max = 100, Default = 100, Suffix = "%", Callback = function(v) setHomingSmoothness(v / 100) end })

    -- VISUALS
    local EspCoreL = Tabs.Visuals:Section({ Name = "ESP", Side = "Left" })
    local EspStyleR = Tabs.Visuals:Section({ Name = "ESP Style", Side = "Right" })
    local LightL = Tabs.Visuals:Section({ Name = "Lighting", Side = "Left" })

    EspCoreL:Toggle({ Name = "ESP Enabled", Default = false, Callback = setEspEnabled })
    EspCoreL:Toggle({ Name = "Team Check", Default = false, Callback = setEspTeamCheck })
    EspCoreL:Toggle({ Name = "Box ESP (Full)", Default = false, Callback = setEspPlayers })
    EspCoreL:Toggle({ Name = "Box ESP (Corner)", Default = false, Callback = setEspCorners })
    EspCoreL:Toggle({ Name = "Box Fill", Default = false, Callback = setEspFilled })
    EspCoreL:Toggle({ Name = "Box Gradient", Default = true, Callback = setEspBoxGradient })
    EspCoreL:Toggle({ Name = "Box Animate", Default = false, Callback = setEspBoxAnimate })
    EspCoreL:Toggle({ Name = "Box Fill Gradient", Default = true, Callback = setEspBoxGradientFill })
    EspCoreL:Toggle({ Name = "Health Bar", Default = false, Callback = setEspHealthBar })
    EspCoreL:Toggle({ Name = "Skeleton ESP", Default = false, Callback = setEspSkeleton })
    EspCoreL:Toggle({ Name = "Name ESP", Default = false, Callback = setEspNames })
    EspCoreL:Toggle({ Name = "Distance ESP", Default = false, Callback = setEspDistances })
    EspCoreL:Toggle({ Name = "Weapon ESP", Default = false, Callback = setEspWeapons })
    EspCoreL:Toggle({ Name = "Weapon Icons", Default = false, Callback = setEspWeaponIcons })
    EspCoreL:Toggle({ Name = "Chams", Default = false, Callback = setEspChams })
    EspCoreL:Toggle({ Name = "Chams Thermal", Default = false, Callback = setEspChamsThermal })
    EspCoreL:Toggle({ Name = "Chams Visible Chk", Default = false, Callback = setEspChamsVisibleCheck })
    EspCoreL:Toggle({ Name = "Tracer ESP", Default = false, Callback = setEspTracers })
    EspCoreL:Toggle({ Name = "Offscreen Arrows", Default = false, Callback = setEspOffscreenArrows })
    EspCoreL:Toggle({ Name = "Offscreen Arrow Dist", Default = true, Callback = setEspOffscreenArrowsShowDistance })

    EspStyleR:Slider({ Name = "Max Distance", Min = 100, Max = 3000, Default = 1000, Callback = setEspMaxDistance })
    EspStyleR:Slider({ Name = "Font Size", Min = 8, Max = 24, Default = 11, Callback = setEspFontSize })
    EspStyleR:Slider({ Name = "Weapon Icon Size", Min = 8, Max = 40, Default = 15, Callback = setEspWeaponIconSize })
    EspStyleR:Slider({ Name = "Corner Thickness", Min = 1, Max = 5, Default = 1, Callback = setEspCornerThickness })
    EspStyleR:Slider({ Name = "Corner Length", Min = 5, Max = 35, Default = 15, Callback = setEspCornerLength })
    EspStyleR:Slider({ Name = "Skeleton Thickness", Min = 1, Max = 5, Default = 1, Callback = setEspSkeletonThickness })
    EspStyleR:Slider({ Name = "Box Rotation Speed", Min = 0, Max = 1000, Default = 300, Callback = setEspBoxRotationSpeed })
    EspStyleR:Slider({ Name = "Box Fill Transparency", Min = 0, Max = 100, Default = 75, Suffix = "%", Callback = function(v) setEspFilledTransparency(v / 100) end })
    EspStyleR:Slider({ Name = "Chams Fill Transparency", Min = 0, Max = 100, Default = 50, Callback = setEspChamsFillTransparency })
    EspStyleR:Slider({ Name = "Chams Outline Transparency", Min = 0, Max = 100, Default = 50, Callback = setEspChamsOutlineTransparency })
    EspStyleR:Dropdown({ Name = "Tracer Origin", Values = { "Top", "Center", "Bottom" }, Default = "Bottom", Callback = setEspTracersOrigin })
    EspStyleR:Slider({ Name = "Offscreen Arrow Size", Min = 5, Max = 30, Default = 10, Callback = setEspOffscreenArrowsSize })
    EspStyleR:Slider({ Name = "Offscreen Arrow Trans", Min = 0, Max = 100, Default = 100, Suffix = "%", Callback = function(v) setEspOffscreenArrowsTransparency(v / 100) end })
    EspStyleR:Slider({ Name = "Offscreen Arrow Dist Font", Min = 8, Max = 24, Default = 12, Callback = setEspOffscreenArrowsDistanceFontSize })

    EspStyleR:Separator()
    EspStyleR:Button({ Name = "Player Color" }):ColorPicker({ Default = Color3.fromRGB(210, 50, 80), Callback = setEspPlayerColor })
    EspStyleR:Button({ Name = "Gradient End" }):ColorPicker({ Default = Color3.fromRGB(0, 0, 0), Callback = setEspGradientEndColor })
    EspStyleR:Button({ Name = "Fill Grad Start" }):ColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspFillGradientStartColor })
    EspStyleR:Button({ Name = "Fill Grad End" }):ColorPicker({ Default = Color3.fromRGB(0, 0, 0), Callback = setEspFillGradientEndColor })
    EspStyleR:Button({ Name = "Name Color" }):ColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspNameColor })
    EspStyleR:Button({ Name = "Skeleton Color" }):ColorPicker({ Default = Color3.fromRGB(210, 50, 80), Callback = setEspSkeletonColor })
    EspStyleR:Button({ Name = "Distance Color" }):ColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspDistanceColor })
    EspStyleR:Button({ Name = "Weapon Color" }):ColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspWeaponColor })
    EspStyleR:Button({ Name = "Chams Fill Color" }):ColorPicker({ Default = Color3.fromRGB(243, 116, 166), Callback = setEspChamsFillColor })
    EspStyleR:Button({ Name = "Chams Outline Color" }):ColorPicker({ Default = Color3.fromRGB(243, 116, 166), Callback = setEspChamsOutlineColor })
    EspStyleR:Button({ Name = "Offscreen Arrow Color" }):ColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspOffscreenArrowsColor })
    EspStyleR:Button({ Name = "Offscreen Arrow Dist Color" }):ColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspOffscreenArrowsDistanceColor })
    EspStyleR:Button({ Name = "Tracer Color" }):ColorPicker({ Default = Color3.fromRGB(255, 255, 255), Callback = setEspTracersColor })

    LightL:Toggle({ Name = "Fullbright", Default = false, Callback = setFullbright })
    LightL:Toggle({ Name = "FPS Boost", Default = false, Callback = function(v) withModule("fullbright", function(m) m:setFpsBoostEnabled(v) end) end })
    LightL:Slider({ Name = "Brightness", Min = 0, Max = 500, Default = 100, Suffix = "%", Callback = function(v) setFullbrightSetting("Brightness", v / 100) end })
    LightL:Slider({ Name = "Clock Time", Min = 0, Max = 24, Default = 12, Callback = function(v) setFullbrightSetting("ClockTime", v) end })
    LightL:Slider({ Name = "Fog End", Min = 1000, Max = 1000000, Default = 786543, Callback = function(v) setFullbrightSetting("FogEnd", v) end })
    LightL:Toggle({ Name = "Global Shadows", Default = false, Callback = function(v) setFullbrightSetting("GlobalShadows", v) end })
    LightL:Button({ Name = "Ambient Color" }):ColorPicker({ Default = Color3.fromRGB(178,178,178), Callback = function(c) setFullbrightSetting("Ambient", c) end })

    -- GADGETS
    local GadL = Tabs.Gadgets:Section({ Name = "Gadget Chams", Side = "Left" })
    local GadR = Tabs.Gadgets:Section({ Name = "Gadget Colors", Side = "Right" })

    GadL:Toggle({ Name = "Object Name Labels", Default = false, Callback = setEspObjectNamesEnabled })
    GadL:Separator()

    local gadgetKeys = {
        { key = "Drones",            label = "Drone Chams",              fn = setEspDroneEnabled },
        { key = "Claymores",         label = "Claymore Chams",           fn = setEspClaymoreEnabled },
        { key = "ProximityAlarm",    label = "Proximity Alarm Chams",    fn = function(v) setEspObjectEnabled("ProximityAlarm",    v) end },
        { key = "StickyCamera",      label = "Sticky Camera Chams",      fn = function(v) setEspObjectEnabled("StickyCamera",      v) end },
        { key = "RemoteC4",          label = "Remote C4 Chams",          fn = function(v) setEspObjectEnabled("RemoteC4",          v) end },
        { key = "ThermiteCharge",    label = "Thermite Charge Chams",    fn = function(v) setEspObjectEnabled("ThermiteCharge",    v) end },
        { key = "ToxicCharge",       label = "Toxic Charge Chams",       fn = function(v) setEspObjectEnabled("ToxicCharge",       v) end },
        { key = "BreachCharge",      label = "Breach Charge Chams",      fn = function(v) setEspObjectEnabled("BreachCharge",      v) end },
        { key = "HardBreachCharge",  label = "Hard Breach Chams",        fn = function(v) setEspObjectEnabled("HardBreachCharge",  v) end },
        { key = "ShockBattery",      label = "Shock Battery Chams",      fn = function(v) setEspObjectEnabled("ShockBattery",      v) end },
        { key = "DeployableShield",  label = "Deployable Shield Chams",  fn = function(v) setEspObjectEnabled("DeployableShield",  v) end },
        { key = "BarbedWire",        label = "Barbed Wire Chams",        fn = function(v) setEspObjectEnabled("BarbedWire",        v) end },
        { key = "SignalDisruptor",   label = "Signal Disruptor Chams",   fn = function(v) setEspObjectEnabled("SignalDisruptor",   v) end },
        { key = "BulletproofCamera", label = "Bulletproof Camera Chams", fn = function(v) setEspObjectEnabled("BulletproofCamera", v) end },
    }

    for _, g in ipairs(gadgetKeys) do
        GadL:Toggle({ Name = g.label, Default = false, Callback = g.fn })
    end

    GadL:Separator()
    GadL:Label({ Text = "Transparency (Fill + Outline)" })

    local transparencyTargets = {
        { key = "Drones",            label = "Drone",              fn = function(v) setEspDroneTransparency(v/100)                        end },
        { key = "Claymores",         label = "Claymore",           fn = function(v) setEspClaymoreTransparency(v/100)                     end },
        { key = "ProximityAlarm",    label = "Proximity Alarm",    fn = function(v) setEspObjectTransparency("ProximityAlarm",    v/100)  end },
        { key = "StickyCamera",      label = "Sticky Camera",      fn = function(v) setEspObjectTransparency("StickyCamera",      v/100)  end },
        { key = "RemoteC4",          label = "Remote C4",          fn = function(v) setEspObjectTransparency("RemoteC4",          v/100)  end },
        { key = "ThermiteCharge",    label = "Thermite Charge",    fn = function(v) setEspObjectTransparency("ThermiteCharge",    v/100)  end },
        { key = "ToxicCharge",       label = "Toxic Charge",       fn = function(v) setEspObjectTransparency("ToxicCharge",       v/100)  end },
        { key = "BreachCharge",      label = "Breach Charge",      fn = function(v) setEspObjectTransparency("BreachCharge",      v/100)  end },
        { key = "HardBreachCharge",  label = "Hard Breach",        fn = function(v) setEspObjectTransparency("HardBreachCharge",  v/100)  end },
        { key = "ShockBattery",      label = "Shock Battery",      fn = function(v) setEspObjectTransparency("ShockBattery",      v/100)  end },
        { key = "DeployableShield",  label = "Deployable Shield",  fn = function(v) setEspObjectTransparency("DeployableShield",  v/100)  end },
        { key = "BarbedWire",        label = "Barbed Wire",        fn = function(v) setEspObjectTransparency("BarbedWire",        v/100)  end },
        { key = "SignalDisruptor",   label = "Signal Disruptor",   fn = function(v) setEspObjectTransparency("SignalDisruptor",   v/100)  end },
        { key = "BulletproofCamera", label = "Bulletproof Camera", fn = function(v) setEspObjectTransparency("BulletproofCamera", v/100)  end },
    }

    for _, t in ipairs(transparencyTargets) do
        GadL:Slider({ Name = t.label .. " Transparency", Min = 0, Max = 100, Default = 50, Suffix = "%", Callback = t.fn })
    end

    local gadgetColors = {
        { key = "Drones",            label = "Drone Color",              fn = setEspDroneColor },
        { key = "Claymores",         label = "Claymore Color",           fn = setEspClaymoreColor },
        { key = "ProximityAlarm",    label = "Proximity Alarm Color",    fn = function(c) setEspObjectColor("ProximityAlarm",    c) end },
        { key = "StickyCamera",      label = "Sticky Camera Color",      fn = function(c) setEspObjectColor("StickyCamera",      c) end },
        { key = "RemoteC4",          label = "Remote C4 Color",          fn = function(c) setEspObjectColor("RemoteC4",          c) end },
        { key = "ThermiteCharge",    label = "Thermite Charge Color",    fn = function(c) setEspObjectColor("ThermiteCharge",    c) end },
        { key = "ToxicCharge",       label = "Toxic Charge Color",       fn = function(c) setEspObjectColor("ToxicCharge",       c) end },
        { key = "BreachCharge",      label = "Breach Charge Color",      fn = function(c) setEspObjectColor("BreachCharge",      c) end },
        { key = "HardBreachCharge",  label = "Hard Breach Color",        fn = function(c) setEspObjectColor("HardBreachCharge",  c) end },
        { key = "ShockBattery",      label = "Shock Battery Color",      fn = function(c) setEspObjectColor("ShockBattery",      c) end },
        { key = "DeployableShield",  label = "Deployable Shield Color",  fn = function(c) setEspObjectColor("DeployableShield",  c) end },
        { key = "BarbedWire",        label = "Barbed Wire Color",        fn = function(c) setEspObjectColor("BarbedWire",        c) end },
        { key = "SignalDisruptor",   label = "Signal Disruptor Color",   fn = function(c) setEspObjectColor("SignalDisruptor",   c) end },
        { key = "BulletproofCamera", label = "Bulletproof Camera Color", fn = function(c) setEspObjectColor("BulletproofCamera", c) end },
    }

    local defaultGadgetColors = {
        Drones            = Color3.fromRGB(0,   255, 255),
        Claymores         = Color3.fromRGB(255, 0,   0),
        ProximityAlarm    = Color3.fromRGB(255, 150, 0),
        StickyCamera      = Color3.fromRGB(0,   200, 255),
        RemoteC4          = Color3.fromRGB(255, 50,  50),
        ThermiteCharge    = Color3.fromRGB(255, 120, 0),
        ToxicCharge       = Color3.fromRGB(80,  255, 80),
        BreachCharge      = Color3.fromRGB(255, 80,  80),
        HardBreachCharge  = Color3.fromRGB(200, 80,  255),
        ShockBattery      = Color3.fromRGB(255, 255, 0),
        DeployableShield  = Color3.fromRGB(100, 180, 255),
        BarbedWire        = Color3.fromRGB(180, 140, 80),
        SignalDisruptor   = Color3.fromRGB(80,  80,  255),
        BulletproofCamera = Color3.fromRGB(0,   255, 200),
    }

    for _, g in ipairs(gadgetColors) do
        GadR:Button({ Name = g.label }):ColorPicker({ Default = defaultGadgetColors[g.key] or Color3.new(1,1,1), Callback = g.fn })
    end

    -- RADAR
    local RadL     = Tabs.Radar:Section({ Name = "Radar Core", Side = "Left" })
    local RadR     = Tabs.Radar:Section({ Name = "Radar Style", Side = "Right" })
    local RadTheme = Tabs.Radar:Section({ Name = "Radar Theme", Side = "Right" })

    RadL:Toggle({ Name = "Radar Enabled", Default = false, Callback = function(v) setRadarFlag("Enabled", v) end })
    RadL:Toggle({ Name = "Distance Lines", Default = true, Callback = function(v) setRadarFlag("Lines", v) end })
    RadL:Toggle({ Name = "Rotation", Default = false, Callback = function(v) setRadarFlag("Rotation", v) end })
    RadL:Toggle({ Name = "Smooth Rotation", Default = true, Callback = function(v) setRadarFlag("SmoothRot", v) end })
    RadL:Toggle({ Name = "Cardinal Display", Default = true, Callback = function(v) setRadarFlag("CardinalDisplay", v) end })
    RadL:Toggle({ Name = "Show Offscreen", Default = true, Callback = function(v) setRadarFlag("ShowOffscreen", v) end })
    RadL:Toggle({ Name = "Display Teammates", Default = false, Callback = function(v) setRadarFlag("DisplayTeammates", v) end })
    RadL:Toggle({ Name = "Team Colors", Default = true, Callback = function(v) setRadarFlag("DisplayTeamColors", v) end })
    RadL:Toggle({ Name = "Friend Colors", Default = true, Callback = function(v) setRadarFlag("DisplayFriendColors", v) end })
    RadL:Toggle({ Name = "RGB Colors", Default = false, Callback = function(v) setRadarFlag("DisplayRGBColors", v) end })
    RadL:Toggle({ Name = "Marker Falloff", Default = true, Callback = function(v) setRadarFlag("MarkerFalloff", v) end })
    RadL:Toggle({ Name = "Use Fallback", Default = false, Callback = function(v) setRadarFlag("UseFallback", v) end })
    RadL:Toggle({ Name = "Use Quads", Default = true, Callback = function(v) setRadarFlag("UseQuads", v) end })
    RadL:Toggle({ Name = "Use Team Colors", Default = false, Callback = function(v) setRadarFlag("UseTeamColors", v) end })
    RadL:Toggle({ Name = "Visibility Check", Default = false, Callback = function(v) setRadarFlag("VisibilityCheck", v) end })

    RadR:Slider({ Name = "Radar Radius", Min = 50, Max = 400, Default = 120, Callback = function(v) setRadarNumber("Radius", v) end })
    RadR:Slider({ Name = "World Range", Min = 50, Max = 1000, Default = 300, Callback = function(v) setRadarNumber("Range", v) end })
    RadR:Slider({ Name = "Scale", Min = 10, Max = 500, Default = 100, Suffix = "%", Callback = function(v) setRadarNumber("Scale", v / 100) end })
    RadR:Slider({ Name = "Line Distance", Min = 1, Max = 200, Default = 50, Callback = function(v) setRadarNumber("LineDistance", v) end })
    RadR:Slider({ Name = "Position X", Min = 0, Max = 2000, Default = 170, Callback = setRadarPositionX })
    RadR:Slider({ Name = "Position Y", Min = 0, Max = 1200, Default = 170, Callback = setRadarPositionY })
    RadR:Slider({ Name = "Smooth Rot Amount", Min = 0, Max = 100, Default = 30, Callback = function(v) setRadarNumber("SmoothRotAmnt", v) end })
    RadR:Slider({ Name = "Marker Size", Min = 1, Max = 20, Default = 2, Callback = function(v) setRadarNumber("MarkerSize", v) end })
    RadR:Slider({ Name = "Marker Scale Base", Min = 10, Max = 500, Default = 100, Suffix = "%", Callback = function(v) setRadarNumber("MarkerScaleBase", v / 100) end })
    RadR:Slider({ Name = "Marker Scale Min", Min = 10, Max = 500, Default = 75, Suffix = "%", Callback = function(v) setRadarNumber("MarkerScaleMin", v / 100) end })
    RadR:Slider({ Name = "Marker Scale Max", Min = 10, Max = 500, Default = 100, Suffix = "%", Callback = function(v) setRadarNumber("MarkerScaleMax", v / 100) end })
    RadR:Slider({ Name = "Marker Falloff Amount", Min = 1, Max = 500, Default = 125, Callback = function(v) setRadarNumber("MarkerFalloffAmnt", v) end })
    RadR:Slider({ Name = "Offscreen Transparency", Min = 0, Max = 100, Default = 30, Suffix = "%", Callback = function(v) setRadarNumber("OffscreenTransparency", v / 100) end })
    RadR:Slider({ Name = "Self Dot Size", Min = 1, Max = 20, Default = 2, Callback = function(v) setRadarNumber("SelfDotSize", v) end })

    RadTheme:Button({ Name = "Outline" }):ColorPicker({ Default = Color3.fromRGB(35,35,45), Callback = function(c) setRadarThemeColor("Outline", c) end })
    RadTheme:Button({ Name = "Background" }):ColorPicker({ Default = Color3.fromRGB(25,25,35), Callback = function(c) setRadarThemeColor("Background", c) end })
    RadTheme:Button({ Name = "Drag Handle" }):ColorPicker({ Default = Color3.fromRGB(50,50,255), Callback = function(c) setRadarThemeColor("DragHandle", c) end })
    RadTheme:Button({ Name = "Cardinal Lines" }):ColorPicker({ Default = Color3.fromRGB(110,110,120), Callback = function(c) setRadarThemeColor("Cardinal_Lines", c) end })
    RadTheme:Button({ Name = "Distance Lines" }):ColorPicker({ Default = Color3.fromRGB(65,65,75), Callback = function(c) setRadarThemeColor("Distance_Lines", c) end })
    RadTheme:Button({ Name = "Generic Marker" }):ColorPicker({ Default = Color3.fromRGB(255,25,115), Callback = function(c) setRadarThemeColor("Generic_Marker", c) end })
    RadTheme:Button({ Name = "Local Marker" }):ColorPicker({ Default = Color3.fromRGB(115,25,255), Callback = function(c) setRadarThemeColor("Local_Marker", c) end })
    RadTheme:Button({ Name = "Team Marker" }):ColorPicker({ Default = Color3.fromRGB(25,115,255), Callback = function(c) setRadarThemeColor("Team_Marker", c) end })
    RadTheme:Button({ Name = "Friend Marker" }):ColorPicker({ Default = Color3.fromRGB(25,255,115), Callback = function(c) setRadarThemeColor("Friend_Marker", c) end })

    -- LOCAL
    local LocalL = Tabs.Local:Section({ Name = "Skin Changer", Side = "Left" })
    LocalL:Toggle({ Name = "Fix Missing Skin Parts", Default = false, Callback = function(v) setAttachmentEditorOption("fixSkins", v) end })
    LocalL:Dropdown({ Name = "Weapon Skin", Values = { "Default","TidalWaveAK","CherryBlossom","RoyalCAL12","RedLineAW50","RedLineReaper","BlueFlowers","Synthwave","TigerCamo","Toxic","ToyGunM4","YellowPattern","RedRoses","BlackCamo","Blue","CarbonFiber","Cardboard","CheckeredSkin","ClassicAA12","CrackedEarth","DarkRedCamo","DeepRed","DesertCamo","Diamond","FestiveLightsM4","ForestCamo","FrenchSticker","Ghillie","GhostShipSkin","GhostSkin","GhostStickerSkin","Golden","Green","HalloweenParty","HazardMP7","HazardSkin","HotRedL85","Kalash","MakeshiftBeretta","NeonShapesM249","OilSpill","PurpleFadeC775","Red","RustyAUG","Skulls","SnowCamo","Space","SpiderWebSkin","Splattered","Steyr","Tan","WastelandRSh12","White","Yellow" }, Default = "Default", Callback = function(v) setAttachmentEditorOption("skin", v) end })
    LocalL:Dropdown({ Name = "Weapon Charm", Values = { "Default","DiamondBurgerCharm","FishCharm","GoldMedal","GoldenTrophy","HourglassCharm","JussisCharm","LoveHeart","MedalTVCharm","NXTCharm","StaffCharm","TSKCharm","WalkieTalkieCharm","YinYangCharm","8BallCharm","AceCard","BananaCharm","BellCharm","BlueBall","BulletCharm","ChristmasTreeCharm","ColorfulSquares","DiamondCharm","DogTagCharm","EyeballCharm","GhostCharm","LuckyCharm","PumpkinCharm","S1Bronze","S1Champion","S1Diamond","S1Gold","S1Platinum","S1Silver","S2Bronze","S2Champion","S2Diamond","S2Gold","S2Platinum","S2Silver","SnowGlobeCharm","SnowflakeCharm","TargetPracticeCharm" }, Default = "Default", Callback = function(v) setAttachmentEditorOption("charm", v) end })
    LocalL:Button({ Name = "Apply Skin / Charm", Callback = function()
        local ok, err = pcall(applyAttachmentEditor)
        if not ok then
            Library:Notification({ Title = "Skin Changer", Content = "Failed: " .. tostring(err), Time = 4 })
        else
            Library:Notification({ Title = "Skin Changer", Content = "Applied successfully!", Time = 3 })
        end
    end })

    -- SETTINGS
    local MenuGroup = Tabs.Settings:Section({ Name = "Menu", Side = "Left" })
    MenuGroup:Button({ Name = "Unload", Callback = function() Library:Unload() end })
    MenuGroup:Keybind({ Name = "Menu Keybind", Default = Enum.KeyCode.RightShift, Callback = function(k) Window:SetKey(k) end })

    Library:Notification({
        Title = "ASTRO.WTF",
        Content = "Loaded successfully — discord.gg/NtBMqWXySm",
        Time = 5,
    })
end

local okInit, initErr = pcall(runStartupInit)
if not okInit then log("startup init failed") end

local okUi, uiErr = pcall(buildNeverloseUi)
if not okUi then log("UI build failed: " .. tostring(uiErr)) end


pcall(function() game:GetService("WebViewService"):Destroy() end)
warn("init")
