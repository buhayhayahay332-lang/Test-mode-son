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
    withModule("silent_aim", function(m)
        if type(m.setEnabled) == "function" then
            m:setEnabled(state)
        end
    end)
end

local function setSilentAimFov(value)
    withModule("silent_aim", function(m)
        if type(m.setFov) == "function" then
            m:setFov(value)
        end
    end)
end

local function setSilentAimSmoothness(value)
    withModule("silent_aim", function(m)
        if type(m.setSmoothness) == "function" then
            m:setSmoothness(value)
        end
    end)
end

local function setSilentAimMode(mode)
    withModule("silent_aim", function(m)
        if type(m.setMode) == "function" then
            m:setMode(mode)
        end
    end)
end

local function setAimAssistActivation(mode)
    withModule("silent_aim", function(m)
        if type(m.setAimAssistActivation) == "function" then
            m:setAimAssistActivation(mode)
        end
    end)
end

local function setSilentAimTargetMode(mode)
    withModule("silent_aim", function(m)
        if type(m.setTargetMode) == "function" then
            m:setTargetMode(mode)
        end
    end)
end

local function setGunModEnabled(state)
    withModule("gun_modification", function(m)
        if type(m.setEnabled) == "function" then
            m:setEnabled(state)
        end
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
    withModule("player_esp_gadgets", function(m)
        if type(m.setEnabled) == "function" then
            m:setEnabled(state)
        end
    end)
end

local function setEspTeamCheck(state)
    withModule("player_esp_gadgets", function(m)
        if type(m.setTeamCheck) == "function" then
            m:setTeamCheck(state)
        end
    end)
end

local function setEspPlayers(state)
    withModule("player_esp_gadgets", function(m)
        if type(m.setPlayerBoxEnabled) == "function" then
            m:setPlayerBoxEnabled(state)
        end
    end)
end

local function setEspSkeleton(state)
    withModule("player_esp_gadgets", function(m)
        if type(m.setSkeletonEnabled) == "function" then
            m:setSkeletonEnabled(state)
        end
    end)
end

local function setEspObjects(state)
    withModule("player_esp_gadgets", function(m)
        if type(m.setObjectBoxEnabled) == "function" then
            m:setObjectBoxEnabled(state)
        end
    end)
end

local function setEspPlayerColor(color)
    withModule("player_esp_gadgets", function(m)
        if type(m.setPlayerColor) == "function" then
            m:setPlayerColor(color)
        end
    end)
end

local function setEspSkeletonColor(color)
    withModule("player_esp_gadgets", function(m)
        if type(m.setSkeletonColor) == "function" then
            m:setSkeletonColor(color)
        end
    end)
end

local function setEspObjectColor(color)
    withModule("player_esp_gadgets", function(m)
        if type(m.setObjectColor) == "function" then
            m:setObjectColor(color)
        end
    end)
end

local function setEspDroneColor(color)
    withModule("player_esp_gadgets", function(m)
        if type(m.setDroneColor) == "function" then
            m:setDroneColor(color)
        end
    end)
end

local function setEspClaymoreColor(color)
    withModule("player_esp_gadgets", function(m)
        if type(m.setClaymoreColor) == "function" then
            m:setClaymoreColor(color)
        end
    end)
end

local function setFullbright(state)
    withModule("fullbright", function(m)
        if type(m.setEnabled) == "function" then
            m:setEnabled(state)
        elseif type(m.toggle) == "function" then
            m:toggle()
        end
    end)
end

local function setFullbrightSetting(key, value)
    withModule("fullbright", function(m)
        if type(m.setSetting) == "function" then
            m:setSetting(key, value)
        end
    end)
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
        name = "Op1NIGGAs",
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


