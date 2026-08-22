local Module = {
    _initialized      = false,
    _enabled          = false,
    _hooked           = false,
    shared            = nil,
    _gunModule        = nil,
    _rawInputShoot    = nil,
    _rawInputRender   = nil,
    _savedConstants   = {},
    config = {
        recoil_reduction = 0,
        horizontal_recoil = 0,
        no_spread        = false,
        force_auto       = false,
        fire_rate_multiplier = 1,
        reload_speed_value = 1,
        zoom_override_enabled = false,
        zoom_override = 1,
        ads_time_ms = 0,
    },
}

local _forceAutoShootOrig  = nil
local _forceAutoRenderOrig = nil
local _stateFunctionOriginals = {}

local GUN_PATH = { "Modules", "Items", "Item", "Gun" }
local function getGunModule()
    if Module._gunModule then
        return Module._gunModule
    end

    local RS   = game:GetService("ReplicatedStorage")
    local node = RS

    for _, childName in ipairs(GUN_PATH) do
        node = node:WaitForChild(childName)
    end

    local ok, gunModule = pcall(require, node)
    if not ok then
        return nil, gunModule
    end

    Module._gunModule = gunModule

    if type(gunModule.input_shoot) == "function" then
        Module._rawInputShoot = gunModule.input_shoot
    end
    if type(gunModule.input_render) == "function" then
        Module._rawInputRender = gunModule.input_render
    end

    return gunModule
end


local function getConstantsApi()
    if type(getconstants) ~= "function" or type(setconstant) ~= "function" then
        return nil
    end
    return getconstants, setconstant
end

local function savePatch(self, fn, key, index, oldValue)
    local fnState = self._savedConstants[fn]
    if not fnState then
        fnState = {}
        self._savedConstants[fn] = fnState
    end
    if not fnState[key] then
        fnState[key] = { index = index, old = oldValue }
    end
end

local function restoreSavedPatches(self)
    local _, setconstantFn = getConstantsApi()
    if not setconstantFn then return end

    for fn, fnState in pairs(self._savedConstants) do
        if type(fn) == "function" and type(fnState) == "table" then
            for _, patch in pairs(fnState) do
                if type(patch) == "table" and patch.index and patch.old ~= nil then
                    pcall(setconstantFn, fn, patch.index, patch.old)
                end
            end
        end
    end
end

local function patchConstantByValue(self, fn, key, oldValue, newValue)
    local getconstantsFn, setconstantFn = getConstantsApi()
    if not getconstantsFn then
        return false, "C APIs unavailable"
    end

    local constants = getconstantsFn(fn)
    if type(constants) ~= "table" then
        return false, "C unavailable"
    end

    for index = 1, #constants do
        if constants[index] == oldValue then
            savePatch(self, fn, key, index, oldValue)
            local ok = pcall(setconstantFn, fn, index, newValue)
            if not ok then
                return false, "SC failed"
            end
            return true
        end
    end

    return false, "C not found"
end

local function patchRecoilFunction(self, fn, vertical, horizontal)
    local getconstantsFn, setconstantFn = getConstantsApi()
    if not getconstantsFn then
        return false, "C APIs unavailable"
    end

    local constants = getconstantsFn(fn)
    if type(constants) ~= "table" then
        return false, "C unavailable"
    end

    local markerIndex = nil
    for index = 1, #constants do
        if constants[index] == "pc" then
            markerIndex = index
            break
        end
    end

    if markerIndex then
        savePatch(self, fn, "recoil_marker", markerIndex, constants[markerIndex])
        pcall(setconstantFn, fn, markerIndex, "tite")

        local verticalIndex = markerIndex + 1
        if type(constants[verticalIndex]) == "number" then
            savePatch(self, fn, "recoil_vertical", verticalIndex, constants[verticalIndex])
            pcall(setconstantFn, fn, verticalIndex, vertical)
        end

        local horizontalIndex = markerIndex + 2
        if type(constants[horizontalIndex]) == "number" then
            savePatch(self, fn, "recoil_horizontal", horizontalIndex, constants[horizontalIndex])
            pcall(setconstantFn, fn, horizontalIndex, horizontal)
        end

        return true
    end

    local patched = 0
    for index = 1, #constants do
        if type(constants[index]) == "number" then
            if patched == 0 then
                savePatch(self, fn, "recoil_vertical", index, constants[index])
                pcall(setconstantFn, fn, index, vertical)
                patched = patched + 1
            elseif patched == 1 then
                savePatch(self, fn, "recoil_horizontal", index, constants[index])
                pcall(setconstantFn, fn, index, horizontal)
                return true
            end
        end
    end

    return patched > 0
end


local function getRuntimeHelpers(self)
    local runtime = self.shared
    if type(runtime) ~= "table" then
        return nil, "shared runtime unavailable"
    end

    local makeClosure = runtime.newcclosure or runtime.closure
    local hook = runtime.hookfunction or runtime.hook
    local hideStack = runtime.setstackhidden or runtime.sstackhidden

    if type(makeClosure) ~= "function" then
        return nil, "newcclosure unavailable"
    end
    if runtime.hasHookfunction ~= true or type(hook) ~= "function" then
        return nil, "hookfunction unavailable"
    end

    return makeClosure, hook, type(hideStack) == "function" and hideStack or function() end
end

local function callInputWithMods(self, original, gun, ...)
    local useMods = self._enabled == true and gun ~= nil
    local rateState = useMods and gun.states and gun.states.firerate
    local rateMultiplier = tonumber(self.config.fire_rate_multiplier) or 1
    local rateOld
    local automaticOld

    if useMods and self.config.force_auto == true then
        automaticOld = gun.automatic
        gun.automatic = true
    end

    if useMods and rateMultiplier > 1 and type(rateState) == "table"
        and type(rateState.get) == "function" and type(rateState.set) == "function" then
        rateOld = rateState:get()
        rateState:set(rateOld * rateMultiplier)
    end

    local results = table.pack(pcall(original, gun, ...))

    if automaticOld ~= nil then
        gun.automatic = automaticOld
    end

    if rateOld ~= nil then
        rateState:set(rateOld)
    end

    if not results[1] then
        error(results[2], 0)
    end

    return table.unpack(results, 2, results.n)
end

local function callWithStateMod(self, original, gun, mode, ...)
    if self._enabled ~= true or not gun or not gun.states then
        return original(gun, ...)
    end

    local state
    local override

    if mode == "reload" then
        state = gun.states.reload_speed
        local value = tonumber(self.config.reload_speed_value) or 1
        if value < 1 then
            override = math.max(0, math.min(1, value))
        end
    elseif mode == "zoom" then
        state = gun.states.zoom
        local value = tonumber(self.config.zoom_override) or 1
        if self.config.zoom_override_enabled == true then
            override = math.max(1, value)
        end
    elseif mode == "ads" then
        state = gun.states.ads
        local value = tonumber(self.config.ads_time_ms) or 0
        if value > 0 then
            override = value / 1000
        end
    end

    local canSet = state
        and type(state.get) == "function"
        and type(state.set) == "function"
    local oldValue
    local changed = false

    if canSet and override ~= nil then
        oldValue = state:get()
        if oldValue ~= override then
            state:set(override)
            changed = true
        end
    end

    local results = table.pack(pcall(original, gun, ...))

    if changed then
        state:set(oldValue)
    end

    if not results[1] then
        error(results[2], 0)
    end

    return table.unpack(results, 2, results.n)
end

local function applyStateFunctionHooks(self, gunModule)
    local makeClosure, hook, hideStack = getRuntimeHelpers(self)
    if not makeClosure then
        return
    end

    local specs = {
        { name = "reload_begin", mode = "reload" },
        { name = "cock_begin", mode = "reload" },
        { name = "sights", mode = "ads" },
        { name = "update_sight_lens", mode = "zoom" },
    }

    for _, spec in ipairs(specs) do
        if not _stateFunctionOriginals[spec.name] then
            local target = gunModule[spec.name]
            if type(target) == "function" then
                local original
                local wrapper = makeClosure(function(gun, ...)
                    return callWithStateMod(self, original, gun, spec.mode, ...)
                end)
                hideStack(wrapper)
                original = hook(target, wrapper)
                _stateFunctionOriginals[spec.name] = original
            end
        end
    end
end
local function applyForceAutoHook(self, gunModule)
    if _forceAutoShootOrig or _forceAutoRenderOrig then return end

    local shootFn  = self._rawInputShoot  or gunModule.input_shoot
    local renderFn = self._rawInputRender or gunModule.input_render

    local makeClosure, hook, hideStack = getRuntimeHelpers(self)
    if not makeClosure then return end

    if type(shootFn) == "function" then
        local shootHook = makeClosure(function(gun, pressed, fromRender, ...)
            return callInputWithMods(self, _forceAutoShootOrig, gun, pressed, fromRender, ...)
        end)
        hideStack(shootHook)
        _forceAutoShootOrig = hook(shootFn, shootHook)
    end

    if type(renderFn) == "function" then
        local renderHook = makeClosure(function(gun, ...)
            return callInputWithMods(self, _forceAutoRenderOrig, gun, ...)
        end)
        hideStack(renderHook)
        _forceAutoRenderOrig = hook(renderFn, renderHook)
    end
end

local function removeForceAutoHook()
    -- Keep the wrappers installed; they pass through while both features are disabled.
end

function Module:_applyConfig()
    local gunModule, gunErr = getGunModule()
    if not gunModule then
        return false, tostring(gunErr or "gun module unavailable")
    end

    restoreSavedPatches(self)

    local enabled = self._enabled == true

    if enabled then
        local recoilValue    = tonumber(self.config.recoil_reduction) or 0
        local horizontalValue = tonumber(self.config.horizontal_recoil) or 0
        local fireRateMultiplier = tonumber(self.config.fire_rate_multiplier) or 1


        local recoilFn = gunModule.recoil_function
        if type(recoilFn) == "function" then
            patchRecoilFunction(self, recoilFn, recoilValue, horizontalValue)
        end

        if self.config.no_spread == true then
            local sendShootFn = gunModule.send_shoot
            if type(sendShootFn) == "function" then
                patchConstantByValue(self, sendShootFn, "spread", 100, 0)
            end
        end

        applyStateFunctionHooks(self, gunModule)

        if self.config.force_auto == true or fireRateMultiplier > 1 then
            applyForceAutoHook(self, gunModule)
        else
            removeForceAutoHook()
        end
    else
        removeForceAutoHook()
    end

    return true
end


function Module:_installHook()
    if self._hooked then return true end

    local gunModule, gunErr = getGunModule()
    if not gunModule then
        return false, tostring(gunErr or "gun module unavailable")
    end

    self._hooked = true
    return true
end


function Module:setShared(shared)
    if type(shared) ~= "table" then
        return false, "shared must be table"
    end
    self.shared = shared
    if type(shared.applyToEnv) == "function" then
        pcall(function() shared:applyToEnv() end)
    end
    return true
end

function Module:init(force)
    if self._initialized and not force then
        return true
    end
    if self._initialized and force then
        self:unload()
    end

    local okHook, hookErr = pcall(function()
        return self:_installHook()
    end)
    if not okHook then
        return false, tostring(hookErr)
    end

    local okApply, applyErr = pcall(function()
        return self:_applyConfig()
    end)
    if not okApply then
        return false, tostring(applyErr)
    end

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
    self:_applyConfig()
    return true
end

function Module:updateConfig(newConfig)
    if type(newConfig) ~= "table" then
        return false, "config must be table"
    end
    for key, value in pairs(newConfig) do
        if self.config[key] ~= nil then
            self.config[key] = value
        end
    end
    self:_applyConfig()
    return true
end

function Module:getConfig()
    return self.config
end

function Module:unload()
    self._enabled = false
    restoreSavedPatches(self)
    self._savedConstants = {}
    removeForceAutoHook()
    self._hooked      = false
    self._initialized = false
    return true
end

return Module
