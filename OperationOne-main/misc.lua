local Module = {
    shared = nil,
    _enabled = false,
    _initialized = false,
    _gunModule = nil,
    _originalInputShoot = nil,
    _originalInputRender = nil,
    _originalRunning = nil, -- added
}



local function getGunModule()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local node = replicatedStorage

    for _, childName in ipairs({ "Modules", "Items", "Item", "Gun" }) do
        node = node:FindFirstChild(childName)
        if not node then
            return nil, "gun module unavailable"
        end
    end

    local ok, gunModule = pcall(require, node)
    if not ok or type(gunModule) ~= "table" then
        return nil, tostring(gunModule or "gun module failed to load")
    end

    return gunModule
end

function Module:setShared(shared)
    if type(shared) ~= "table" then
        return false, "shared must be table"
    end
    self.shared = shared
    return true
end

function Module:setEnabled(state)
    self._enabled = state == true
    return true
end

function Module:_getRuntimeHelpers()
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

function Module:_installRunningFireHook()
    if self._originalInputShoot and self._originalInputRender then
        return true
    end
    
    local makeClosure, hook, hideStack = self:_getRuntimeHelpers()
    if not makeClosure then
        return false, hook
    end

    local gunModule, err = getGunModule()
    if not gunModule or type(gunModule.input_shoot) ~= "function" or type(gunModule.input_render) ~= "function" then
        return false, err or "input_shoot unavailable"
    end

    self._gunModule = gunModule
    local originalInputShoot
    local inputShootHook = makeClosure(function(gun, pressed, ...)
        if not self._enabled then
            return originalInputShoot(gun, pressed, ...)
        end

        local owner = gun and gun.owner
        local runningState = owner and owner.states and owner.states.running
        local wasRunning = runningState
            and type(runningState.get) == "function"
            and type(runningState.set) == "function"
            and runningState:get() == true

        if wasRunning then
            runningState:set(false)
        end

        local results = table.pack(originalInputShoot(gun, pressed, ...))

        if wasRunning then
            runningState:set(true)
        end

        return table.unpack(results, 1, results.n)
    end)
    hideStack(inputShootHook)
    originalInputShoot = hook(gunModule.input_shoot, inputShootHook)

    self._originalInputShoot = originalInputShoot

    local originalInputRender
    local inputRenderHook = makeClosure(function(gun, ...)
        if not self._enabled then
            return originalInputRender(gun, ...)
        end

        local owner = gun and gun.owner
        local runningState = owner and owner.states and owner.states.running
        local wasRunning = runningState
            and type(runningState.get) == "function"
            and type(runningState.set) == "function"
            and runningState:get() == true

        if wasRunning then
            runningState:set(false)
        end

        local results = table.pack(originalInputRender(gun, ...))

        if wasRunning then
            runningState:set(true)
        end

        return table.unpack(results, 1, results.n)
    end)
    hideStack(inputRenderHook)
    originalInputRender = hook(gunModule.input_render, inputRenderHook)

    self._originalInputRender = originalInputRender

    if type(gunModule.running) == "function" then
        local originalRunning
        local runningHook = makeClosure(function(gun, owner, isRunning, ...)
            if not self._enabled then
                return originalRunning(gun, owner, isRunning, ...)
            end

            if isRunning then
                gun.states.sights:set(false)
                gun:reload(owner, false)
            else
                gun:running_pivots(owner, false)
                owner.values.cframes:get("arms"):remove_offset("run")
            end
        end)
        hideStack(runningHook)
        originalRunning = hook(gunModule.running, runningHook)
        self._originalRunning = originalRunning
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

    local ok, err = pcall(function()
        local installed, installErr = self:_installRunningFireHook()
        if not installed then
            error(installErr)
        end
    end)
    if not ok then
        return false, tostring(err)
    end

    self._initialized = true
    return true
end

function Module:unload()
    if self._gunModule and self._originalInputShoot then
        self._gunModule.input_shoot = self._originalInputShoot
    end
    if self._gunModule and self._originalInputRender then
        self._gunModule.input_render = self._originalInputRender
    end
    if self._gunModule and self._originalRunning then -- added
        self._gunModule.running = self._originalRunning
    end
    self._gunModule = nil
    self._originalInputShoot = nil
    self._originalInputRender = nil
    self._originalRunning = nil -- added
    self._initialized = false
end

return Module