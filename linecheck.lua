--[[
    send_shoot index checker — minimal, ONLY send_shoot.
    Paste into executor, run in-game.
]]

local Gun = require(game:GetService("ReplicatedStorage").Modules.Items.Item.Gun)
if not Gun then print('module nil'); return end
local send_shoot = rawget(Gun, 'send_shoot')   -- or Gun.send_shoot

print('== send_shoot ==')

-- 1) shape
local info = debug.getinfo(send_shoot, 'L')
print('source:', info.source, '| what:', info.what, '| params:', info.nparams,
      '| nups:', info.nups, '| lines:', info.linedefined .. '-' .. info.lastlinedefined)

if info.what == 'C' then print('C closure — nothing to index'); return end

-- 2) activelines (is line 1686 / 1544 live in THIS function?)
if info.activelines then
    local around = {}
    for l in pairs(info.activelines) do
        if l >= 1678 and l <= 1694 then table.insert(around, l) end
    end
    table.sort(around)
    print('active lines 1678-1694:', table.concat(around, ', '))
    print(info.activelines[1686] and '>> redirection line 1686 IS active'
                                 or '>> line 1686 NOT active — runtime differs')
end

-- 3) constants inside send_shoot only
if debug.getconstants then
    print('-- constants --')
    local cons = debug.getconstants(send_shoot)
    for i = 1, #cons do
        local c = cons[i]
        if type(c) == 'string' then
            print(('[%3d] %q'):format(i, c))
        elseif type(c) == 'number' then
            print(('[%3d] %s'):format(i, tostring(c)))
        end
    end
end

-- 4) instruction dump (executor-dependent)
if disassemble then
    print('-- disassembly --')
    local ok, out = pcall(disassemble, send_shoot)
    if ok then
        for line in out:gmatch('[^\r\n]+') do print(line) end
    else
        print('disassemble failed:', tostring(out))
    end
end

print('== end ==')