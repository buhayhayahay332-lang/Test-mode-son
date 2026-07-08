local FLAG_NAME  = "DebugRunParallelLuaOnMainThread"
local MAIN_URL   = "https://github.com/buhayhayahay332-lang/Test-mode-son/raw/refs/heads/main/OperationOne-main/main.lua"
local UI_LIB_URL = "https://github.com/buhayhayahay332-lang/Test-mode-son/raw/refs/heads/main/OperationOne-main/ui_lib.lua"
local REJOIN_MSG = "REJOIN THE GAME FUCK FURRY."

local RETRY_COUNT = 3
local RETRY_DELAY = 1.5 

local UNSUPPORTED = {
    xeno     = true,
    solara   = true,
    wave     = true,
    velocity = true,
}


local LocalPlayer = game:GetService("Players").LocalPlayer


local function fetchSource(url)
    for attempt = 1, RETRY_COUNT do
        local ok, result = pcall(function()
            return game:HttpGet(url, true)
        end)

        if ok and type(result) == "string" and #result > 0 then
            return result
        end

        warn(string.format("[Loader] HttpGet attempt %d/%d failed for: %s", attempt, RETRY_COUNT, url))

        if attempt < RETRY_COUNT then
            task.wait(RETRY_DELAY)
        end
    end

    warn("[Loader] All HttpGet attempts exhausted for: " .. url)
    return nil
end

local function compileChunk(src, label)
    local compile = loadstring or load
    if type(compile) ~= "function" then
        warn("[Loader] No loadstring available")
        return nil
    end

    local ok, result = pcall(compile, src, "@" .. tostring(label))
    if not ok or type(result) ~= "function" then
        warn("[Loader] Compile failed for " .. tostring(label) .. ": " .. tostring(result))
        return nil
    end

    return result
end

local function tryGlobals(names, ...)
    for _, name in ipairs(names) do
        local fn = rawget(_G, name)
        if type(fn) == "function" then
            local ok, val = pcall(fn, ...)
            if ok then return val end
        end
    end
    return nil
end


local function getExecutorName()
    local name = tryGlobals({ "identifyexecutor", "getexecutorname" })
    return (type(name) == "string" and name ~= "") and name or "Unknown"
end


local function readFlag(flag)
    if type(getfflag) ~= "function" then return nil end
    local ok, value = pcall(getfflag, flag)
    return ok and value or nil
end

local function setFlagTrue(flag)
    if type(setfflag) ~= "function" then return false end
    return pcall(setfflag, flag, "true") == true
end

local function isFlagEnabled(v)
    if type(v) == "boolean" then return v end
    if type(v) == "string"  then return v:lower() == "true" end
    return false
end


local function kickRejoin()
    if LocalPlayer and type(LocalPlayer.Kick) == "function" then
        pcall(LocalPlayer.Kick, LocalPlayer, REJOIN_MSG)
    end
end


local function notifyUnsupported(execName)
    local function tryLoadLib(src, label)
        local chunk = compileChunk(src, label)
        if not chunk then return nil end
        local ok, lib = pcall(chunk)
        if ok and type(lib) == "table" and type(lib.notify) == "function" then
            return lib
        end
        return nil
    end

    local lib

    if type(readfile) == "function" then
        local ok, src = pcall(readfile, "ui_lib.lua")
        if ok and type(src) == "string" and src ~= "" then
            lib = tryLoadLib(src, "local:ui_lib")
        end
    end

    if not lib then
        local src = fetchSource(UI_LIB_URL)
        if src then
            lib = tryLoadLib(src, "url:ui_lib")
        end
    end

    if lib then
        pcall(lib.notify, lib, "Loader", tostring(execName) .. " is not supported", nil, false)
    end
end


local function getActor()
    if type(getactors) ~= "function" then return nil end
    local ok, list = pcall(getactors)
    if not ok or type(list) ~= "table" then return nil end

    for _, a in ipairs(list) do
        if typeof(a) == "Instance" and a:IsA("Actor") then
            return a
        end
    end
    return nil
end

local function runOnActor(actor, src)
    if typeof(actor) ~= "Instance" or not actor:IsA("Actor") then return false end
    if type(run_on_actor) ~= "function" then return false end

    local actorCode = string.format([[
        local compile = loadstring or load
        if type(compile) ~= "function" then return end

        local ok, chunk = pcall(compile, %q, "@operationone_main")
        if not ok or type(chunk) ~= "function" then
            warn("[Actor] Compile failed: " .. tostring(chunk))
            return
        end

        local runOk, err = pcall(chunk)
        if not runOk then
            warn("[Actor] Runtime error: " .. tostring(err))
        end
    ]], src)

    local done = false
    task.spawn(function()
        pcall(run_on_actor, actor, actorCode)
        done = true
    end)

    local timeout = 10
    local elapsed = 0
    while not done and elapsed < timeout do
        task.wait(0.1)
        elapsed += 0.1
    end

    if not done then
        warn("[Loader] Actor execution timed out")
        return false
    end

    return true
end


local executorName = getExecutorName()

if UNSUPPORTED[executorName:lower()] then
    notifyUnsupported(executorName)
    return
end

local src = fetchSource(MAIN_URL)
if not src then
    warn("[Loader] Could not fetch main source after all retries. Aborting.")
    return
end

local actor = getActor()
if actor and runOnActor(actor, src) then
    return
end

if not isFlagEnabled(readFlag(FLAG_NAME)) then
    setFlagTrue(FLAG_NAME)
    kickRejoin()
    return
end

local chunk = compileChunk(src, "operationone_main")
if not chunk then return end

local ok, err = pcall(chunk)
if not ok then
    warn("[Loader] Main chunk error: " .. tostring(err))
end
