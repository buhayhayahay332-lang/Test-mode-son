pcall(function() setthreadidentity(8) end)

local UILIB_LOCAL_PATH = "v_ui.lua"
local UILIB_URL = "https://github.com/buhayhayahay332-lang/Test-mode-son/raw/refs/heads/main/OperationOne-main/v_ui.lua"
local UILIB_LOCAL_PATHS = {
    UILIB_LOCAL_PATH,
    "OperationOne-main/v_ui.lua",
    "OperationOne-main\\v_ui.lua",
}
local SHARED_RUNTIME_SOURCE = { local_path = "shared_runtime.lua", url = "https://github.com/buhayhayahay332-lang/Test-mode-son/raw/refs/heads/main/OperationOne-main/shared_runtime.lua" }

local MODULE_SOURCES = {
    fullbright = {
        local_path = "fullbright.lua",
        url = "https://github.com/buhayhayahay332-lang/Test-mode-son/raw/refs/heads/main/OperationOne-main/fullbright.lua",
    },
    gun_modification = {
        local_path = "gun_modification.lua",
        url = "https://github.com/buhayhayahay332-lang/Test-mode-son/raw/refs/heads/main/OperationOne-main/gun_modification.lua",
    },
    player_esp_gadgets = {
        local_path = "player_esp_gadgets.lua",
        url = "https://github.com/buhayhayahay332-lang/Test-mode-son/raw/refs/heads/main/OperationOne-main/player_esp_gadgets.lua",
    },
    silent_aim = {
        local_path = "silent_aim.lua",
        url = "https://github.com/buhayhayahay332-lang/Test-mode-son/raw/refs/heads/main/OperationOne-main/silent_aim.lua",
    },
}

local moduleCache = {}
local sharedRuntimeCache = nil
local HttpService = game:GetService("HttpService")

local FEATURE_CONFIG_FOLDER = "ASTRO WAS GOD"
local FEATURE_CONFIG_PREFIX = "FURRY_KILLER"
local featureState = {
    silent_enabled = false,
    silent_fov = 60,
    silent_smoothness = 1,
    silent_mode = "silent",
    aim_activation = "mb2",
    target_mode = "custom_parts",
    gun_enabled = false,
    gun_recoil_reduction = 0,
    gun_horizontal_recoil = 0,
    esp_enabled = false,
    esp_team_check = false,
    esp_players = false,
    esp_skeleton = false,
    esp_objects = false,
    esp_player_color = Color3.fromRGB(210, 50, 80),
    esp_skeleton_color = Color3.fromRGB(210, 50, 80),
    esp_object_color = Color3.fromRGB(0, 255, 255),
    esp_drone_color = Color3.fromRGB(0, 255, 255),
    esp_claymore_color = Color3.fromRGB(255, 0, 0),
    fullbright_enabled = false,
    fb_brightness = 1,
    fb_clock_time = 12,
    fb_fog_end = 786543,
    fb_global_shadows = false,
    fb_ambient = Color3.fromRGB(178, 178, 178),
}

local function log(msg)
    print("[OP1] " .. tostring(msg))
end

local function compile(source, chunkName)
    local compiler = loadstring or load
    if type(compiler) ~= "function" then
        return nil, "loadstring/load unavailable"
    end

    local okLoad, chunkOrErr = pcall(compiler, source, "@" .. tostring(chunkName))
    if not okLoad or type(chunkOrErr) ~= "function" then
        return nil, "compile error: " .. tostring(chunkOrErr)
    end

    local okRun, resultOrErr = pcall(chunkOrErr)
    if not okRun then
        return nil, "runtime error: " .. tostring(resultOrErr)
    end

    if type(resultOrErr) == "table" then
        return resultOrErr
    end

    return { load = function() return true end }
end

local function readSource(spec)
    if type(readfile) == "function" and spec.local_path then
        local okLocal, localData = pcall(readfile, spec.local_path)
        if okLocal and type(localData) == "string" and localData ~= "" then
            return localData, "local:" .. spec.local_path
        end
    end

    if spec.url and spec.url ~= "" then
        local okUrl, remoteData = pcall(function()
            return game:HttpGet(spec.url)
        end)
        if okUrl and type(remoteData) == "string" and remoteData ~= "" then
            return remoteData, "url:" .. spec.url
        end
    end

    return nil, "no source available"
end

local function loadSharedRuntime()
    if type(sharedRuntimeCache) == "table" then
        return sharedRuntimeCache
    end

    local source, sourceInfo = readSource(SHARED_RUNTIME_SOURCE)
    if not source then
        log("shared runtime source error -> " .. tostring(sourceInfo))
        return nil
    end

    local sharedObj, sharedErr = compile(source, "shared_runtime")
    if not sharedObj or type(sharedObj) ~= "table" then
        log("shared runtime load error -> " .. tostring(sharedErr))
        return nil
    end

    sharedRuntimeCache = sharedObj
    if type(sharedObj.applyToEnv) == "function" then
        pcall(function()
            sharedObj:applyToEnv()
        end)
    end
    return sharedRuntimeCache
end

local function initModule(name, forceReload)
    local cached = moduleCache[name]
    if cached and cached.initialized and not forceReload then
        return cached.module
    end

    local sharedRuntime = loadSharedRuntime()

    local spec = MODULE_SOURCES[name]
    if not spec then
        log("unknown module: " .. tostring(name))
        return nil
    end

    local source, sourceInfo = readSource(spec)
    if not source then
        log(name .. " source error -> " .. tostring(sourceInfo))
        return nil
    end

    local moduleObj, loadErr = compile(source, name)
    if not moduleObj then
        log(name .. " load error -> " .. tostring(loadErr))
        return nil
    end

    if sharedRuntime then
        if type(moduleObj.setShared) == "function" then
            pcall(function()
                moduleObj:setShared(sharedRuntime)
            end)
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
        log(name .. " init failed -> " .. tostring(initErr))
        return nil
    end

    moduleCache[name] = { initialized = true, module = moduleObj }
    return moduleObj
end

local function withModule(name, callback)
    local moduleObj = initModule(name, false)
    if not moduleObj then
        return false
    end

    local ok, result = pcall(callback, moduleObj)
    if not ok then
        log(name .. " callback error -> " .. tostring(result))
        return false
    end

    return result ~= false
end

local function setSilentAim(state)
    featureState.silent_enabled = state == true
    withModule("silent_aim", function(m)
        if type(m.setEnabled) == "function" then
            m:setEnabled(state)
        end
    end)
end

local function setSilentAimFov(value)
    featureState.silent_fov = tonumber(value) or featureState.silent_fov
    withModule("silent_aim", function(m)
        if type(m.setFov) == "function" then
            m:setFov(value)
        end
    end)
end

local function setSilentAimSmoothness(value)
    featureState.silent_smoothness = tonumber(value) or featureState.silent_smoothness
    withModule("silent_aim", function(m)
        if type(m.setSmoothness) == "function" then
            m:setSmoothness(value)
        end
    end)
end

local function setSilentAimMode(mode)
    if type(mode) == "string" and mode ~= "" then
        featureState.silent_mode = mode
    end
    withModule("silent_aim", function(m)
        if type(m.setMode) == "function" then
            m:setMode(mode)
        end
    end)
end

local function setAimAssistActivation(mode)
    if type(mode) == "string" and mode ~= "" then
        featureState.aim_activation = mode
    end
    withModule("silent_aim", function(m)
        if type(m.setAimAssistActivation) == "function" then
            m:setAimAssistActivation(mode)
        end
    end)
end

local function setSilentAimTargetMode(mode)
    if type(mode) == "string" and mode ~= "" then
        featureState.target_mode = mode
    end
    withModule("silent_aim", function(m)
        if type(m.setTargetMode) == "function" then
            m:setTargetMode(mode)
        end
    end)
end

local function setGunModEnabled(state)
    featureState.gun_enabled = state == true
    withModule("gun_modification", function(m)
        if type(m.setEnabled) == "function" then
            m:setEnabled(state)
        end
    end)
end

local function setGunModConfig(key, value)
    if key == "recoil_reduction" then
        featureState.gun_recoil_reduction = tonumber(value) or featureState.gun_recoil_reduction
    elseif key == "horizontal_recoil" then
        featureState.gun_horizontal_recoil = tonumber(value) or featureState.gun_horizontal_recoil
    end
    withModule("gun_modification", function(m)
        if type(m.updateConfig) == "function" then
            m:updateConfig({ [key] = value })
        elseif type(m.config) == "table" then
            m.config[key] = value
        end
    end)
end

local function setEspEnabled(state)
    featureState.esp_enabled = state == true
    withModule("player_esp_gadgets", function(m)
        if type(m.setEnabled) == "function" then
            m:setEnabled(state)
        end
    end)
end

local function setEspTeamCheck(state)
    featureState.esp_team_check = state == true
    withModule("player_esp_gadgets", function(m)
        if type(m.setTeamCheck) == "function" then
            m:setTeamCheck(state)
        end
    end)
end

local function setEspPlayers(state)
    featureState.esp_players = state == true
    withModule("player_esp_gadgets", function(m)
        if type(m.setPlayerBoxEnabled) == "function" then
            m:setPlayerBoxEnabled(state)
        end
    end)
end

local function setEspSkeleton(state)
    featureState.esp_skeleton = state == true
    withModule("player_esp_gadgets", function(m)
        if type(m.setSkeletonEnabled) == "function" then
            m:setSkeletonEnabled(state)
        end
    end)
end

local function setEspObjects(state)
    featureState.esp_objects = state == true
    withModule("player_esp_gadgets", function(m)
        if type(m.setObjectBoxEnabled) == "function" then
            m:setObjectBoxEnabled(state)
        end
    end)
end

local function setEspPlayerColor(color)
    if typeof(color) == "Color3" then
        featureState.esp_player_color = color
    end
    withModule("player_esp_gadgets", function(m)
        if type(m.setPlayerColor) == "function" then
            m:setPlayerColor(color)
        end
    end)
end

local function setEspSkeletonColor(color)
    if typeof(color) == "Color3" then
        featureState.esp_skeleton_color = color
    end
    withModule("player_esp_gadgets", function(m)
        if type(m.setSkeletonColor) == "function" then
            m:setSkeletonColor(color)
        end
    end)
end

local function setEspObjectColor(color)
    if typeof(color) == "Color3" then
        featureState.esp_object_color = color
    end
    withModule("player_esp_gadgets", function(m)
        if type(m.setObjectColor) == "function" then
            m:setObjectColor(color)
        end
    end)
end

local function setEspDroneColor(color)
    if typeof(color) == "Color3" then
        featureState.esp_drone_color = color
    end
    withModule("player_esp_gadgets", function(m)
        if type(m.setDroneColor) == "function" then
            m:setDroneColor(color)
        end
    end)
end

local function setEspClaymoreColor(color)
    if typeof(color) == "Color3" then
        featureState.esp_claymore_color = color
    end
    withModule("player_esp_gadgets", function(m)
        if type(m.setClaymoreColor) == "function" then
            m:setClaymoreColor(color)
        end
    end)
end

local function setFullbright(state)
    featureState.fullbright_enabled = state == true
    withModule("fullbright", function(m)
        if type(m.setEnabled) == "function" then
            m:setEnabled(state)
        elseif type(m.toggle) == "function" then
            m:toggle()
        end
    end)
end

local function setFullbrightSetting(key, value)
    if key == "Brightness" then
        featureState.fb_brightness = tonumber(value) or featureState.fb_brightness
    elseif key == "ClockTime" then
        featureState.fb_clock_time = tonumber(value) or featureState.fb_clock_time
    elseif key == "FogEnd" then
        featureState.fb_fog_end = tonumber(value) or featureState.fb_fog_end
    elseif key == "GlobalShadows" then
        featureState.fb_global_shadows = value == true
    elseif key == "Ambient" and typeof(value) == "Color3" then
        featureState.fb_ambient = value
    end
    withModule("fullbright", function(m)
        if type(m.setSetting) == "function" then
            m:setSetting(key, value)
        end
    end)
end

local function sanitizeFeatureConfigName(name)
    local n = tostring(name or ""):gsub("^%s+", ""):gsub("%s+$", "")
    n = n:gsub("[<>:\"/\\|%?%*]", "_")
    n = n:gsub("%s+", "_")
    n = n:gsub("_+", "_")
    n = n:gsub("^_+", ""):gsub("_+$", "")
    if n == "" then
        n = "default"
    end
    return n
end

local function getFeatureConfigPath(name)
    local n = sanitizeFeatureConfigName(name)
    return FEATURE_CONFIG_FOLDER .. "/" .. FEATURE_CONFIG_PREFIX .. "__features__" .. n .. ".json"
end

local function encodeColor(c)
    if typeof(c) ~= "Color3" then
        return nil
    end
    return {
        r = math.floor(c.R * 255 + 0.5),
        g = math.floor(c.G * 255 + 0.5),
        b = math.floor(c.B * 255 + 0.5),
    }
end

local function decodeColor(payload, fallback)
    if type(payload) ~= "table" then
        return fallback
    end
    return Color3.fromRGB(
        math.clamp(tonumber(payload.r) or 0, 0, 255),
        math.clamp(tonumber(payload.g) or 0, 0, 255),
        math.clamp(tonumber(payload.b) or 0, 0, 255)
    )
end

local function ensureFeatureFolder()
    if type(isfolder) == "function" then
        local okExists, exists = pcall(isfolder, FEATURE_CONFIG_FOLDER)
        if okExists and exists then
            return true
        end
    end
    if type(makefolder) ~= "function" then
        return false, "makefolder unavailable"
    end
    local okMake, err = pcall(makefolder, FEATURE_CONFIG_FOLDER)
    if okMake then
        return true
    end
    if type(isfolder) == "function" then
        local okExists, exists = pcall(isfolder, FEATURE_CONFIG_FOLDER)
        if okExists and exists then
            return true
        end
    end
    return false, tostring(err)
end

local function saveFeatureConfig(name)
    if type(writefile) ~= "function" then
        return false, "writefile unavailable"
    end

    local okFolder, folderErr = ensureFeatureFolder()
    if not okFolder then
        return false, folderErr
    end

    local payload = {
        version = 1,
        values = {
            silent_enabled = featureState.silent_enabled == true,
            silent_fov = tonumber(featureState.silent_fov) or 60,
            silent_smoothness = tonumber(featureState.silent_smoothness) or 1,
            silent_mode = tostring(featureState.silent_mode or "silent"),
            aim_activation = tostring(featureState.aim_activation or "mb2"),
            target_mode = tostring(featureState.target_mode or "custom_parts"),
            gun_enabled = featureState.gun_enabled == true,
            gun_recoil_reduction = tonumber(featureState.gun_recoil_reduction) or 0,
            gun_horizontal_recoil = tonumber(featureState.gun_horizontal_recoil) or 0,
            esp_enabled = featureState.esp_enabled == true,
            esp_team_check = featureState.esp_team_check == true,
            esp_players = featureState.esp_players == true,
            esp_skeleton = featureState.esp_skeleton == true,
            esp_objects = featureState.esp_objects == true,
            esp_player_color = encodeColor(featureState.esp_player_color),
            esp_skeleton_color = encodeColor(featureState.esp_skeleton_color),
            esp_object_color = encodeColor(featureState.esp_object_color),
            esp_drone_color = encodeColor(featureState.esp_drone_color),
            esp_claymore_color = encodeColor(featureState.esp_claymore_color),
            fullbright_enabled = featureState.fullbright_enabled == true,
            fb_brightness = tonumber(featureState.fb_brightness) or 1,
            fb_clock_time = tonumber(featureState.fb_clock_time) or 12,
            fb_fog_end = tonumber(featureState.fb_fog_end) or 786543,
            fb_global_shadows = featureState.fb_global_shadows == true,
            fb_ambient = encodeColor(featureState.fb_ambient),
        },
    }

    local okJson, encoded = pcall(function()
        return HttpService:JSONEncode(payload)
    end)
    if not okJson then
        return false, tostring(encoded)
    end

    local okWrite, writeErr = pcall(writefile, getFeatureConfigPath(name), encoded)
    if not okWrite then
        return false, tostring(writeErr)
    end

    return true
end

local function loadFeatureConfig(name)
    if type(readfile) ~= "function" then
        return nil, "readfile unavailable"
    end

    local path = getFeatureConfigPath(name)
    if type(isfile) == "function" then
        local okExists, exists = pcall(isfile, path)
        if not okExists or not exists then
            return nil, "file not found"
        end
    end

    local okRead, content = pcall(readfile, path)
    if not okRead or type(content) ~= "string" or content == "" then
        return nil, okRead and "empty file" or tostring(content)
    end

    local okDecode, payload = pcall(function()
        return HttpService:JSONDecode(content)
    end)
    if not okDecode or type(payload) ~= "table" then
        return nil, okDecode and "invalid payload" or tostring(payload)
    end

    local values = payload.values or payload
    if type(values) ~= "table" then
        return nil, "missing values"
    end

    return values
end

local function deleteFeatureConfig(name)
    if type(delfile) ~= "function" then
        return false, "delfile unavailable"
    end

    local path = getFeatureConfigPath(name)
    if type(isfile) == "function" then
        local okExists, exists = pcall(isfile, path)
        if not okExists or not exists then
            return false, "file not found"
        end
    end

    local okDelete, err = pcall(delfile, path)
    if not okDelete then
        return false, tostring(err)
    end

    return true
end

local function applyFeatureConfig(values)
    if type(values) ~= "table" then
        return false
    end

    setSilentAim(values.silent_enabled == true)
    setSilentAimFov(tonumber(values.silent_fov) or 60)
    setSilentAimSmoothness(tonumber(values.silent_smoothness) or 1)
    setSilentAimMode(type(values.silent_mode) == "string" and values.silent_mode or "silent")
    setAimAssistActivation(type(values.aim_activation) == "string" and values.aim_activation or "mb2")
    setSilentAimTargetMode(type(values.target_mode) == "string" and values.target_mode or "custom_parts")

    setGunModEnabled(values.gun_enabled == true)
    setGunModConfig("recoil_reduction", tonumber(values.gun_recoil_reduction) or 0)
    setGunModConfig("horizontal_recoil", tonumber(values.gun_horizontal_recoil) or 0)

    setEspEnabled(values.esp_enabled == true)
    setEspTeamCheck(values.esp_team_check == true)
    setEspPlayers(values.esp_players == true)
    setEspSkeleton(values.esp_skeleton == true)
    setEspObjects(values.esp_objects == true)
    setEspPlayerColor(decodeColor(values.esp_player_color, Color3.fromRGB(210, 50, 80)))
    setEspSkeletonColor(decodeColor(values.esp_skeleton_color, Color3.fromRGB(210, 50, 80)))
    setEspObjectColor(decodeColor(values.esp_object_color, Color3.fromRGB(0, 255, 255)))
    setEspDroneColor(decodeColor(values.esp_drone_color, Color3.fromRGB(0, 255, 255)))
    setEspClaymoreColor(decodeColor(values.esp_claymore_color, Color3.fromRGB(255, 0, 0)))

    setFullbright(values.fullbright_enabled == true)
    setFullbrightSetting("Brightness", tonumber(values.fb_brightness) or 1)
    setFullbrightSetting("ClockTime", tonumber(values.fb_clock_time) or 12)
    setFullbrightSetting("FogEnd", tonumber(values.fb_fog_end) or 786543)
    setFullbrightSetting("GlobalShadows", values.fb_global_shadows == true)
    setFullbrightSetting("Ambient", decodeColor(values.fb_ambient, Color3.fromRGB(178, 178, 178)))

    return true
end

local function applyDefaults()
    setSilentAim(false)
    setSilentAimFov(60)
    setSilentAimSmoothness(1)
    setSilentAimMode("silent")
    setAimAssistActivation("mb2")
    setSilentAimTargetMode("custom_parts")

    setGunModEnabled(false)
    setGunModConfig("recoil_reduction", 0)
    setGunModConfig("horizontal_recoil", 0)

    setEspEnabled(false)
    setEspTeamCheck(false)
    setEspPlayers(false)
    setEspSkeleton(false)
    setEspObjects(false)
    setEspPlayerColor(Color3.fromRGB(210, 50, 80))
    setEspSkeletonColor(Color3.fromRGB(210, 50, 80))
    setEspObjectColor(Color3.fromRGB(0, 255, 255))
    setEspDroneColor(Color3.fromRGB(0, 255, 255))
    setEspClaymoreColor(Color3.fromRGB(255, 0, 0))

    setFullbright(false)
    setFullbrightSetting("Brightness", 1)
    setFullbrightSetting("ClockTime", 12)
    setFullbrightSetting("FogEnd", 786543)
    setFullbrightSetting("GlobalShadows", false)
    setFullbrightSetting("Ambient", Color3.fromRGB(178, 178, 178))

end

local function loadUiLibrary()
    local compiler = loadstring or load
    if type(compiler) ~= "function" then
        return nil, "loadstring/load unavailable"
    end

    local function loadUiFromSource(source, sourceLabel)
        local okLib, libOrErr = pcall(function()
            local chunk = compiler(tostring(source), "@vuilib:" .. tostring(sourceLabel))
            if type(chunk) ~= "function" then
                error("ui compile returned non-function")
            end
            return chunk()
        end)
        if okLib and type(libOrErr) == "table" and type(libOrErr.new) == "function" then
            return libOrErr
        end
        return nil, tostring(libOrErr)
    end

    if type(readfile) == "function" then
        for _, localPath in ipairs(UILIB_LOCAL_PATHS) do
            local okRead, source = pcall(readfile, localPath)
            if okRead and type(source) == "string" and source ~= "" then
                local lib, err = loadUiFromSource(source, "local:" .. localPath)
                if lib then
                    log("UI loaded from local file: " .. localPath)
                    return lib
                end
                log("UI local load failed (" .. tostring(localPath) .. ") -> " .. tostring(err))
            end
        end
    end

    local okHttp, httpSource = pcall(function()
        return game:HttpGet(UILIB_URL)
    end)
    if okHttp and type(httpSource) == "string" and httpSource ~= "" then
        local lib, err = loadUiFromSource(httpSource, "url:" .. UILIB_URL)
        if lib then
            log("UI loaded from url: " .. UILIB_URL)
            return lib
        end
        return nil, "ui url compile/runtime error: " .. tostring(err)
    end

    return nil, "local ui file missing (" .. UILIB_LOCAL_PATH .. ") and url fetch failed: " .. UILIB_URL
end

local function buildVUi(lib)
    if type(lib.new) ~= "function" then
        error("v_ui.lua does not expose :new")
    end

    local window = lib:new({
        name = "FURRY KILLER",
        subtitle = "Operation One",
        toggleKey = Enum.KeyCode.RightShift,
        minimizeKey = Enum.KeyCode.K,
        loadingTime = 0.1,
        accent = Color3.fromRGB(220, 35, 35),
        onClose = function()
            setSilentAim(false)
            setEspEnabled(false)
            setFullbright(false)
            setGunModEnabled(false)
        end,
    })

    local function addColorPicker(tab, name, defaultColor, callback)
        tab:ColorPicker({
            name = name,
            default = defaultColor,
            callback = callback,
        })
    end

    local combatTab = window:CreateTab({
        name = "Combat",
        icon = (lib.Icons and lib.Icons.crosshair) or "*",
    })

    combatTab:Section({ name = "Aimbot" })
    combatTab:Toggle({ name = "Silent/Aimbot", default = false, callback = setSilentAim })
    combatTab:Slider({ name = "Aim FOV", min = 10, max = 400, default = 60, callback = setSilentAimFov })
    combatTab:Slider({
        name = "Aim Assist Smoothness",
        min = 1,
        max = 100,
        default = 100,
        suffix = "%",
        callback = function(v)
            setSilentAimSmoothness(v / 100)
        end,
    })
    combatTab:Dropdown({ name = "Aim Mode", items = { "silent", "aim_assist" }, default = "silent", callback = setSilentAimMode })
    combatTab:Dropdown({ name = "Aim Assist Activation", items = { "mb2", "mb1", "always" }, default = "mb2", callback = setAimAssistActivation })
    combatTab:Dropdown({
        name = "Target Mode",
        items = { "Custom Parts", "Head Only" },
        default = "Custom Parts",
        callback = function(selected)
            if selected == "Head Only" then
                setSilentAimTargetMode("head_only")
            else
                setSilentAimTargetMode("custom_parts")
            end
        end,
    })

    combatTab:Section({ name = "Weapon" })
    combatTab:Toggle({ name = "Gun Mod Enabled", default = false, callback = setGunModEnabled })
    combatTab:Slider({
        name = "Recoil Reduction",
        min = 0,
        max = 1,
        default = 0,
        callback = function(v)
            setGunModConfig("recoil_reduction", v / 10)
        end,
    })
    combatTab:Slider({
        name = "Horizontal Recoil",
        min = 0,
        max = 1,
        default = 0,
        callback = function(v)
            setGunModConfig("horizontal_recoil", v / 10)
        end,
    })

    local visualsTab = window:CreateTab({
        name = "Visuals",
        icon = (lib.Icons and lib.Icons.eye) or "*",
    })

    visualsTab:Section({ name = "ESP" })
    visualsTab:Toggle({ name = "ESP Enabled", default = false, callback = setEspEnabled })
    visualsTab:Toggle({ name = "ESP Team Check", default = false, callback = setEspTeamCheck })
    visualsTab:Toggle({ name = "Box ESP", default = false, callback = setEspPlayers })
    visualsTab:Toggle({ name = "Skeleton ESP", default = false, callback = setEspSkeleton })
    visualsTab:Toggle({ name = "Gadget ESP", default = false, callback = setEspObjects })
    addColorPicker(visualsTab, "Player ESP Color", Color3.fromRGB(210, 50, 80), setEspPlayerColor)
    addColorPicker(visualsTab, "Skeleton Color", Color3.fromRGB(210, 50, 80), setEspSkeletonColor)
    addColorPicker(visualsTab, "Gadget ESP Color", Color3.fromRGB(0, 255, 255), setEspObjectColor)
    addColorPicker(visualsTab, "Drone Color", Color3.fromRGB(0, 255, 255), setEspDroneColor)
    addColorPicker(visualsTab, "Claymore Color", Color3.fromRGB(255, 0, 0), setEspClaymoreColor)

    visualsTab:Section({ name = "Lighting" })
    visualsTab:Toggle({ name = "Fullbright", default = false, callback = setFullbright })
    visualsTab:Slider({
        name = "FB Brightness",
        min = 0,
        max = 500,
        default = 100,
        callback = function(v)
            setFullbrightSetting("Brightness", v / 100)
        end,
    })
    visualsTab:Slider({ name = "FB ClockTime", min = 0, max = 24, default = 12, callback = function(v) setFullbrightSetting("ClockTime", v) end })
    visualsTab:Slider({ name = "FB FogEnd", min = 1000, max = 1000000, default = 786543, callback = function(v) setFullbrightSetting("FogEnd", v) end })
    visualsTab:Toggle({ name = "FB GlobalShadows", default = false, callback = function(v) setFullbrightSetting("GlobalShadows", v) end })
    addColorPicker(visualsTab, "FB Ambient Color", Color3.fromRGB(178, 178, 178), function(c)
        setFullbrightSetting("Ambient", c)
    end)

        local configTab = window:CreateTab({
        name = "Config",
        icon = (lib.Icons and lib.Icons.folder) or "*",
    })

    local activeConfigName = "default"

    local configNameInput = configTab:TextInput({
        name = "Config Name",
        placeholder = "Enter config name",
        default = activeConfigName,
        callback = function(v)
            local n = tostring(v or ""):gsub("^%s+", ""):gsub("%s+$", "")
            if n ~= "" then
                activeConfigName = n
            end
        end,
    })

    local cfgItems = {}
    pcall(function()
        if type(window.ListConfigs) == "function" then
            cfgItems = window:ListConfigs()
        end
    end)
    if #cfgItems == 0 then
        cfgItems = { activeConfigName }
    end

    local configDropdown = configTab:Dropdown({
        name = "Saved Configs",
        items = cfgItems,
        default = cfgItems[1],
        callback = function(v)
            if v and v ~= "" then
                activeConfigName = v
                pcall(function() configNameInput:Set(v) end)
            end
        end,
    })

    local function getConfigName()
        local n = tostring(activeConfigName or ""):gsub("^%s+", ""):gsub("%s+$", "")
        if n == "" then n = "default" end
        activeConfigName = n
        return n
    end

    local function refreshConfigs(preferred)
        local list = {}
        pcall(function()
            if type(window.ListConfigs) == "function" then
                list = window:ListConfigs()
            end
        end)
        if #list == 0 then
            list = { getConfigName() }
        end

        configDropdown:SetItems(list)

        local chosen = tostring(preferred or ""):gsub("^%s+", ""):gsub("%s+$", "")
        if chosen == "" then
            chosen = list[1]
        end
        local found = false
        for _, item in ipairs(list) do
            if item == chosen then
                found = true
                break
            end
        end
        if not found then
            chosen = list[1]
        end

        configDropdown:Set(chosen)
        pcall(function() configNameInput:Set(chosen) end)
        activeConfigName = chosen
    end

    configTab:Button({
        name = "Refresh Configs",
        callback = function()
            refreshConfigs(getConfigName())
            if type(window.notify) == "function" then
                window.notify("Config", "Config list refreshed", 3)
            end
        end,
    })

    configTab:Button({
        name = "Save Config",
        callback = function()
            local name = getConfigName()
            local ok = false
            pcall(function()
                if type(window.SaveConfig) == "function" then
                    ok = window:SaveConfig(name)
                end
            end)
            refreshConfigs(name)
            if type(window.notify) == "function" then
                window.notify("Config", ok and ("Saved " .. name) or ("Save failed: " .. name), 3)
            end
        end,
    })

    configTab:Button({
        name = "Load Config",
        callback = function()
            local name = getConfigName()
            local data = nil
            pcall(function()
                if type(window.LoadConfig) == "function" then
                    data = window:LoadConfig(name)
                end
            end)
            if data then
                pcall(function()
                    window:ApplyConfig(data)
                end)
                if type(window.notify) == "function" then
                    window.notify("Config", "Loaded " .. name, 3)
                end
            else
                if type(window.notify) == "function" then
                    window.notify("Config", "No saved config found: " .. name, 3)
                end
            end
        end,
    })

    configTab:Button({
        name = "Delete Config",
        callback = function()
            local name = getConfigName()
            local ok = false
            pcall(function()
                if type(window.DeleteConfig) == "function" then
                    ok = window:DeleteConfig(name)
                end
            end)
            refreshConfigs("default")
            if type(window.notify) == "function" then
                window.notify("Config", ok and ("Deleted " .. name) or ("Delete failed: " .. name), 3)
            end
        end,
    })

    refreshConfigs(activeConfigName)

    pcall(function()
        window:SelectTab("Combat")
    end)

    applyDefaults()
    log("init")
end

local lib, libErr = loadUiLibrary()
if lib then
    local ok, err = pcall(buildVUi, lib)
    if not ok then
        log("failed -> " .. tostring(err))
    end
else
    log("failed -> " .. tostring(libErr))
end

pcall(function()
    game:GetService("WebViewService"):Destroy()
end)

