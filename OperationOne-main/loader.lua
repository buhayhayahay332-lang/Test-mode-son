local Players     = cloneref(game:GetService("Players"))
local LocalPlayer = Players.LocalPlayer

local PLACE_ID = 72920620366355
local URL      = "https://gitlab.com/potanginamo373-lang/op1/-/raw/main/main.lua"

local SETFFLAG_EXECUTORS = {
    wave     = true,
    velocity = true,
}

local FurryScript = [[
    local Extras = getrenv().shared.extras
    if not Extras then return end

    local Expected = {
        ["1"]="thread",["3"]="thread",["4"]="thread",["5"]="thread",
        ["6"]="thread",["7"]="thread",["8"]="thread",["9"]="thread",
        ["10"]="thread",["ResetEnv"]="function"
    }

    for k, v in pairs(Expected) do
        if type(Extras[k]) ~= v then return warn("new furry added") end
    end

    for k, v in pairs(Extras) do
        if Expected[tostring(k)] == nil then return warn("new furry kinginamo") end
    end

    for i, v in pairs(Extras) do
        if type(v) ~= "thread" then continue end
        Extras[i] = task.spawn(function() while task.wait(9e9) do end end)
        task.cancel(v)
    end

    Extras.ResetEnv = function() end
    task.wait(1)
    warn("passed")
]]

local function getExecName()
    local fn = identifyexecutor or getexecutorname
    return fn and fn():lower() or "unknown"
end

local function isAllowed(name)
    if name:find("delta")  then return true end
    if name:find("codex")  then return true end
    if name:find("arceus") then return true end
    return false
end

local function runFurry()
    local Extras = getrenv().shared.extras
    if not Extras then return false end

    local Expected = {
        ["1"]="thread",["3"]="thread",["4"]="thread",["5"]="thread",
        ["6"]="thread",["7"]="thread",["8"]="thread",["9"]="thread",
        ["10"]="thread",["ResetEnv"]="function"
    }

    for k, v in pairs(Expected) do
        if type(Extras[k]) ~= v then warn("new furry added") return false end
    end

    for k, v in pairs(Extras) do
        if Expected[tostring(k)] == nil then warn("new furry kinginamo") return false end
    end

    for i, v in pairs(Extras) do
        if type(v) ~= "thread" then continue end
        Extras[i] = task.spawn(function() while task.wait(9e9) do end end)
        task.cancel(v)
    end

    Extras.ResetEnv = function() end
    task.wait(1)
    warn("PASSED")
    return true
end

-- validate game
if game.PlaceId ~= PLACE_ID then
    warn("[Loader] Wrong game")
    LocalPlayer:Kick("Wrong game FN")
    return
end

if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- validate executor
local execName = getExecName()

if not isAllowed(execName) then
    warn("[Loader] Executor not supported: " .. execName)
    GUF_CRASH()
    return
end

-- load
local actors        = getactors()
local flag          = getfflag("DebugRunParallelLuaOnMainThread")
local forceSetfflag = SETFFLAG_EXECUTORS[execName]

if not forceSetfflag and actors and #actors > 0 then
    run_on_actor(actors[1], string.format([[
        %s
        loadstring(game:HttpGet(%q))()
    ]], FurryScript, URL))
else
    if not flag or flag == "false" then
        setfflag("DebugRunParallelLuaOnMainThread", "true")
        LocalPlayer:Kick("REJOIN THE GAM FUCK FURRY")
    else
        task.spawn(function()
            if not runFurry() then
                warn("[Loader] Furry failed")
                return
            end

            local fn, err = loadstring(game:HttpGet(URL))
            if not fn then
                warn("[Loader] Failed to load script")
                return
            end

            local ok, runErr = pcall(fn)
            if not ok then
                warn("[Loader] Failed to run script")
            end
        end)
    end
end