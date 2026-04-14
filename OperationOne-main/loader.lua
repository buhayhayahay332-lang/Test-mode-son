local FLAG_NAME = "DebugRunParallelLuaOnMainThread"
local MAIN_URL = "https://github.com/buhayhayahay332-lang/Test-mode-son/raw/refs/heads/main/OperationOne-main/main.lua"
local REJOIN_MESSAGE = "Rejoin the game again."

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function isFlagEnabled(value)
    if type(value) == "boolean" then
        return value
    end

    if type(value) == "string" then
        return string.lower(value) == "true"
    end

    return false
end

local function readFlag(name)
    if type(getfflag) ~= "function" then
        return nil
    end

    local ok, value = pcall(getfflag, name)
    if ok then
        return value
    end

    return nil
end

local function writeFlagTrue(name)
    if type(setfflag) ~= "function" then
        return false
    end

    local ok = pcall(setfflag, name, "true")
    return ok == true
end

local function kickForRejoin()
    if LocalPlayer and type(LocalPlayer.Kick) == "function" then
        LocalPlayer:Kick(REJOIN_MESSAGE)
    end
end

local function fetchMainSource(url)
    local ok, source = pcall(function()
        return game:HttpGet(url)
    end)

    if not ok or type(source) ~= "string" or source == "" then
        return nil
    end

    return source
end

local function compileChunk(source)
    local compiler = loadstring 
    if type(compiler) ~= "function" then
        return nil
    end

    local ok, chunk = pcall(compiler, source, "@operationone_main")
    if not ok or type(chunk) ~= "function" then
        return nil
    end

    return chunk
end

local function getFirstActor()
    if type(getactors) ~= "function" then
        return nil
    end

    local ok, actors = pcall(getactors)
    if not ok or type(actors) ~= "table" then
        return nil
    end

    for _, actor in ipairs(actors) do
        if typeof(actor) == "Instance" and actor:IsA("Actor") then
            return actor
        end
    end

    for _, actor in pairs(actors) do
        if typeof(actor) == "Instance" and actor:IsA("Actor") then
            return actor
        end
    end

    return nil
end

local function buildActorLoader(url)
    return string.format([[
local okSource, source = pcall(function()
    return game:HttpGet(%q)
end)
if not okSource or type(source) ~= "string" or source == "" then
    return
end

local compiler = loadstring
if type(compiler) ~= "function" then
    return
end

local okChunk, chunk = pcall(compiler, source, "@operationone_main")
if not okChunk or type(chunk) ~= "function" then
    return
end

pcall(chunk)
]], url)
end

local function runMainOnActor(actor, url)
    if typeof(actor) ~= "Instance" or not actor:IsA("Actor") then
        return false
    end
    if type(run_on_actor) ~= "function" then
        return false
    end

    local actorSource = buildActorLoader(url)
    task.spawn(function()
        pcall(run_on_actor, actor, actorSource)
    end)

    return true
end

local actor = getFirstActor()
if actor and runMainOnActor(actor, MAIN_URL) then
    return
end

if not isFlagEnabled(readFlag(FLAG_NAME)) then
    writeFlagTrue(FLAG_NAME)
    kickForRejoin()
    return
end

local source = fetchMainSource(MAIN_URL)
if not source then
    return
end

local chunk = compileChunk(source)
if not chunk then
    return
end

pcall(chunk)
