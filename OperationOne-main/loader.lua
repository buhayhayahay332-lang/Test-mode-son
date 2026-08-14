<<<<<<< HEAD
local Players     = cloneref(game:GetService("Players"))
local LocalPlayer = Players.LocalPlayer

local PLACE_ID = 72920620366355
local URL      = "https://gitlab.com/potanginamo373-lang/op1/-/raw/main/main.lua"
=======
local PCall: (any, ...any) -> (boolean, ...any)        = CloneFunction(pcall);
local ToString: (any) -> string                        = CloneFunction(tostring);
local IPairs                                           = CloneFunction(ipairs);
local Pairs                                            = CloneFunction(pairs);
local Type: (any) -> string                            = CloneFunction(type);
local Warn: (...any) -> ()                             = CloneFunction(warn);
local TaskWait: (number?) -> number                    = CloneFunction(task.wait);
local TaskSpawn: (((...any) -> any), ...any) -> thread = CloneFunction(task.spawn);
local TaskCancel: (thread) -> ()                       = CloneFunction(task.cancel);
local StringFormat: (string, ...any) -> string         = CloneFunction(string.format);
local StringLower: (string) -> string                  = CloneFunction(string.lower);
local StringGsub: (string, string, string) -> (string, number) = CloneFunction(string.gsub);
local StringFind: (string, string, number?, boolean?) -> (number?, number?) = CloneFunction(string.find);
local StringByte: (string, number?) -> number          = CloneFunction(string.byte);
local StringChar: (...number) -> string                = CloneFunction(string.char);
local TableConcat: ({any}, string?) -> string          = CloneFunction(table.concat);
local MathFmod: (number, number) -> number             = CloneFunction(math.fmod);
local Bit32Bxor: (number, number) -> number            = CloneFunction(bit32.bxor);

local _, S = PCall(function(...) string.byte("a", function(...) return; end, 9999, 38); end);
if S and (StringFind(S, "httplog", 1, true) or StringFind(S, "sandbox", 1, true)) then
    while true do end;
end;


local Players = cloneref(game:GetService("Players"));

local XorDecode do
    local KEY    = "astro";
    local KeyLen = #KEY;

    XorDecode = function(Encoded: {number}): string
        local Chars: {string} = {};
        for Index, Byte in IPairs(Encoded) do
            local KeyByte = StringByte(KEY, MathFmod(Index - 1, KeyLen) + 1);
            Chars[Index]  = StringChar(Bit32Bxor(Byte, KeyByte));
        end;
        return TableConcat(Chars);
    end;
end;

local ENCODED_URL: {number} = (function(): {number}
    local Key    = "astro";
    local Url    = "https://raw.githubusercontent.com/buhayhayahay332-lang/Test-mode-son/refs/heads/main/OperationOne-main/main.lua";
    local KeyLen = #Key;
    local Out: {number} = {};
    for Index = 1, #Url do
        local UrlByte = StringByte(Url, Index);
        local KeyByte = StringByte(Key, MathFmod(Index - 1, KeyLen) + 1);
        Out[Index]    = Bit32Bxor(UrlByte, KeyByte);
    end;
    return Out;
end)();

local SCRUB_PATTERNS: {string} = {
    "https?://[%w%-%._~:/%?#%[%]@!%$&'%(%)%*%+,;%%=]+";
    "github%.com";
    "buhayhayahay332-lang";
    "Test-mode-son";
    "OperationOne-main";
    "main%.lua";
};

local PLACE_IDS = {
    Expected = 72920620366355;
};

local MESSAGES = {
    Rejoin     = "REJOIN THE GAM FUCK FURRY";
    WrongGame  = "Wrong game FN";
    LoadFailed = "[Loader] Failed to load script";
    RunFailed  = "[Loader] Failed to run script";
};

local BLOCKLIST = {
    ["xeno"]   = true;
    ["solara"] = true;
};
>>>>>>> d6de9331bd9f82b254c2d0a024c035cfb3e4df5c

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