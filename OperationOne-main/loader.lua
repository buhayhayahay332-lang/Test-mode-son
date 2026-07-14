local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local m = "REJOIN THE GAM FUCK FURRY"
local url = "https://raw.githubusercontent.com/buhayhayahay332-lang/Test-mode-son/refs/heads/main/OperationOne-main/main.lua"

local PLACE_ID = 72920620366355
local BLOCKLIST = { xeno = true, solara = true }

local SETFFLAG_EXECUTORS = { delta = true, wave = true, real = true, }

if game.PlaceId ~= PLACE_ID then
    warn("[Loader] Wrong game. Expected: " .. PLACE_ID .. " Got: " .. game.PlaceId)
    lp:Kick("Wrong game FN")
    return
end

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local execName = (identifyexecutor or getexecutorname or function() return "unknown" end)()
local execLower = execName:lower()

if BLOCKLIST[execLower] then
    warn("[Loader] Executor not supported: " .. execName)
    lp:Kick("Your executor (" .. execName .. ") is not supported.")
    return
end

local actors = getactors()
local flag = getfflag("DebugRunParallelLuaOnMainThread")
local forceSetfflag = SETFFLAG_EXECUTORS[execLower]

if not forceSetfflag and actors and #actors > 0 then
    run_on_actor(actors[1], string.format([[
        loadstring(game:HttpGet(%q))()
    ]], url))
else
    if not flag or flag == "false" then
        setfflag("DebugRunParallelLuaOnMainThread", "true")
        lp:Kick(m)
    else
        task.spawn(function()
            loadstring(game:HttpGet(url))()
        end)
    end
end