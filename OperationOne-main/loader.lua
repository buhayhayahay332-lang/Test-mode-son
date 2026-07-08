local FLAG_NAME  = "DebugRunParallelLuaOnMainThread"
local MAIN_URL   = "https://github.com/buhayhayahay332-lang/Test-mode-son/raw/refs/heads/main/OperationOne-main/main.lua"
local UI_LIB_URL = "https://github.com/buhayhayahay332-lang/Test-mode-son/raw/refs/heads/main/OperationOne-main/ui_lib.lua"
local REJOIN_MSG = "REJOIN THE GAME FUCK FURRY."

local UNSUPPORTED = {
    xeno     = true,
    solara   = true,
    wave     = true,
    velocity = true,
}


local LocalPlayer = game:GetService("Players").LocalPlayer


local function compileChunk(src, label)
    local compile = loadstring or load
    if type(compile) ~= "function" then return nil end
    local ok, chunk = pcall(compile, src, "@" .. tostring(label))
    return (ok and type(chunk) == "function") and chunk or nil
end

local function fetchSource(url)
    local ok, result = pcall(function()
        return game:HttpGet(url)
    end)
    return (ok and type(result) == "string" and result ~= "") and result or nil
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

local function runOnActor(actor, url)
    if typeof(actor) ~= "Instance" or not actor:IsA("Actor") then return false end
    if type(run_on_actor) ~= "function" then return false end

    local actorCode = string.format([[
        local ok, src = pcall(function() return game:HttpGet(%q) end)
        if not ok or type(src) ~= "string" or src == "" then return end
        local ok2, chunk = pcall(loadstring, src, "@operationone_main")
        if not ok2 or type(chunk) ~= "function" then return end
        pcall(chunk)
    ]], url)

    task.spawn(function()
        pcall(run_on_actor, actor, actorCode)
    end)

    return true
end


local executorName = getExecutorName()

if UNSUPPORTED[executorName:lower()] then
    notifyUnsupported(executorName)
    return
end

local actor = getActor()
if actor and runOnActor(actor, MAIN_URL) then
    return
end

if not isFlagEnabled(readFlag(FLAG_NAME)) then
    setFlagTrue(FLAG_NAME)
    kickRejoin()
    return
end

local src   = fetchSource(MAIN_URL)
if not src then return end

local chunk = compileChunk(src, "operationone_main")
if not chunk then return end

pcall(chunk)
