local Module = {
    shared = nil,
    _enabled = false,
    _initialized = false,
    _gunModule = nil,
    _originalInputShoot = nil,
    _originalInputRender = nil,
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

function Module:_installRunningFireHook()
    if self._originalInputShoot and self._originalInputRender then
        return true
    end
    if type(hookfunction) ~= "function" then
        return false, "hookfunction unavailable"
    end

    local gunModule, err = getGunModule()
    if not gunModule or type(gunModule.input_shoot) ~= "function" or type(gunModule.input_render) ~= "function" then
        return false, err or "input_shoot unavailable"
    end

    self._gunModule = gunModule
    local originalInputShoot
    originalInputShoot = hookfunction(gunModule.input_shoot, function(gun, pressed, ...)
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

    self._originalInputShoot = originalInputShoot

    local originalInputRender
    originalInputRender = hookfunction(gunModule.input_render, function(gun, ...)
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

    self._originalInputRender = originalInputRender
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
    self._gunModule = nil
    self._originalInputShoot = nil
    self._originalInputRender = nil
    self._initialized = false
end

return Module
