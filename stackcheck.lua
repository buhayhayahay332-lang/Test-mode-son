--[[
    send_shoot stack-level/index checker — standalone.
    Hooks send_shoot ONLY; on call, dumps every stack level + register index.
]]

local Gun = require(game:GetService("ReplicatedStorage").Modules.Items.Item.Gun)
if not Gun then print('module nil'); return end
local send_shoot = rawget(Gun, 'send_shoot')
if not send_shoot then print('no send_shoot'); return end

local MAX_LEVELS = 15      -- how many stack frames to walk
local MAX_INDEX = 30       -- registers per frame
local SHORT = 40           -- truncate long tostring values

local function desc(v)
    if v == nil then return 'nil' end
    local t = type(v)
    local s = tostring(v)
    if #s > SHORT then s = s:sub(1, SHORT) .. '...' end
    return ('%s:%s'):format(t, s)
end

print('== hooking send_shoot (fire a shot to trigger) ==')
local calls = 0
local old_send_shoot = send_shoot
Gun.send_shoot = newcclosure(function(self, ...)
    calls = calls + 1
    print(('===== send_shoot call #%d ====='):format(calls))

    -- arguments passed in (these are registers 1..n of the frame)
    local n = select('#', ...)
    for i = 1, n do
        print(('arg[%d] = %s'):format(i, desc(select(i, ...))))
    end

    -- walk stack levels: level 1 = this hook frame, 2 = caller, etc.
    for level = 1, MAX_LEVELS do
        local row = {}
        for idx = 1, MAX_INDEX do
            local ok, v = pcall(getstack, level, idx)
            if not ok then break end
            if v == nil then break end
            row[#row + 1] = ('[%d]%s'):format(idx, desc(v))
        end
        if #row > 0 then
            print(('level %d: %s'):format(level, table.concat(row, '  ')))
        end
    end

    print('===== end call #' .. calls .. ' =====')
    return old_send_shoot(self, ...)
end)

print('done. Fire the gun.')