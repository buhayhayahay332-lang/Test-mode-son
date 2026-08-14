-- Script Path: game:GetService("ReplicatedStorage").Modules.Items.Item.Gun

local RunService = game:GetService("RunService")
local Parent = require(script.Parent)
local r2 = {}
r2.__index = r2
setmetatable(r2, Parent)
r2.tag = script.Name
r2.holster_offset = CFrame.new(0, 0, 1) * CFrame.Angles(0, 0, 1.5707963267948966)
r2.holster_part = "torso"
r2.magazine_hold_offset = CFrame.new(0.2, -2.225, 0) * CFrame.Angles(-1.5707963267948966, 0, 0)
r2.melee_range = 2.75
if RunService:IsServer() then return r2 end
local Input = require(game.ReplicatedStorage.Modules.Input)
local StateObject = require(game.ReplicatedStorage.Modules.StateObject)
local State = require(game.ReplicatedStorage.Modules.State)
local Event = require(game.ReplicatedStorage.Modules.Event)
local Util = require(game.ReplicatedStorage.Modules.Util)
local UI = require(game.ReplicatedStorage.Modules.UI)
local Globals = require(game.ReplicatedStorage.Modules.Globals)
local Net = require(game.ReplicatedStorage.Modules.Net)
local Data = require(game.ReplicatedStorage.Modules.Data)
local Items = require(game.ReplicatedStorage.Modules.Items)
local FirstPersonInterface = require(game.ReplicatedStorage.Modules.FirstPersonInterface)
local FlagManager = require(game.ReplicatedStorage.Modules.FlagManager)
local Maid = require(game.ReplicatedStorage.Modules.Maid)
local Effects = require(game.ReplicatedStorage.Modules.Effects)
local UserInputService = game:GetService("UserInputService")
local Animations = require(script.Animations)
local Sounds = require(script.Sounds)
r2.anim = setmetatable({}, {
    __index = function(r0, r1_p0) -- Line: 37 | Name: __index | Upvalues: ("Animations" (copy), "Parent" (copy))
        return Animations[r1_p0] or Parent.anim[r1_p0]
    end
})
r2.sound = setmetatable({}, {
    __index = function(r0, r1_p1) -- Line: 42 | Name: __index | Upvalues: ("Sounds" (copy), "Parent" (copy))
        return Sounds[r1_p1] or Parent.sound[r1_p1]
    end
})
function r2.init(r0) -- Line: 47 | Name: init | Upvalues: ("Util" (copy), "State" (copy))
    r0.auto_shoot_dt = os.clock()
    r0.last_shot = os.clock()
    r0.shot = r0:setup_shot(r0.instance:WaitForChild("Root"):FindFirstChild("Shoot", true))
    r0.accuracy = Instance.new("NumberValue")
    r0.reload_thread = Util.ov(r0.reload_begin)
    r0.reload_thread:done(r0.reload_done)
    r0.reload_thread:cancelled(r0.reload_cancel)
    r0.cock_thread = Util.ov(r0.cock_begin)
    r0.cock_thread:done(r0.cock_done)
    r0.cock_thread:cancelled(r0.cock_cancel)
    r0.recoil = Util.ov(r0.recoil_function)
    r0.sights = Util.ov(r0.sights)
    r0.sights:cancelled(function() -- Line: 60 | Upvalues: ("r0" (copy))
        r0.owner.values.cframes:get("arm1"):remove_offset("sights")
        r0.owner.values.cframes:get("arm2"):remove_offset("sights")
        r0.cframes:get(r0.instance.Root):remove_offset("sights")
    end)
    r0.flash = Util.ov(r0.flash)
    r0.safety_function = Util.bf(r0.safety_function)
    r0.safety = State.new(nil)
    r0:load_instance()
end
function r2.flash(r0) -- Line: 76 | Name: flash
    r0.shot.Flash:Emit(3)
    r0.shot.Light.Enabled = true
    task.wait(0.05)
    r0.shot.Light.Enabled = false
end
function r2.set_part_pivots(r0) -- Line: 83 | Name: set_part_pivots | Upvalues: ("Util" (copy))
    r0.slide = r0.instance:FindFirstChild("Slide")
    local r1
    if r0.slide then
        r1 = r0.cframes:get(r0.slide, true)
        local r2 = r0.instance.Root.CFrame:ToObjectSpace(r0.slide:GetPivot())
        r1:set_pivot("general", function() -- Line: 88 | Upvalues: ("r0" (copy), "r2" (copy))
            return r0.instance.Root.CFrame * r2
        end)
        if r0.shoot_slide then r0.cframes:get(r0.slide):set_offset("shoot") end
    end
    r0.load_slide = r0.instance:FindFirstChild("LoadSlide") or r0.instance:FindFirstChild("Pump")
    if r0.load_slide then
        local r1 = r0.cframes:get(r0.load_slide, true)
        local r2 = r0.instance.Root.CFrame:ToObjectSpace(r0.load_slide:GetPivot())
        r1:set_pivot("general", function() -- Line: 100 | Upvalues: ("r0" (copy), "r2" (copy))
            return r0.instance.Root.CFrame * r2
        end)
        if r0.shoot_slide then r0.cframes:get(r0.load_slide):set_offset("shoot") end
    end
    r0.hammer = r0.instance:FindFirstChild("Hammer")
    if r0.hammer then
        local r1 = r0.cframes:get(r0.hammer, true)
        local r2 = r0.instance.Root.CFrame:ToObjectSpace(r0.hammer.CFrame)
        r1:set_pivot("general", function() -- Line: 112 | Upvalues: ("r0" (copy), "r2" (copy))
            return r0.instance.Root.CFrame * r2
        end)
    end
    r0.feed_cover = r0.instance:FindFirstChild("FeedCover")
    if r0.feed_cover then
        local r1 = r0.cframes:get(r0.feed_cover, true)
        local r2 = r0.instance.Root.CFrame:ToObjectSpace(r0.feed_cover:GetPivot())
        r1:set_pivot("general", function() -- Line: 121 | Upvalues: ("r0" (copy), "r2" (copy))
            return r0.instance.Root.CFrame * r2
        end)
        r1:set_offset("reload")
    end
    r0.end_bullet = r0.instance:FindFirstChild("EndBullet")
    if r0.end_bullet then
        local r1 = r0.cframes:get(r0.end_bullet, true)
        local r2 = r0.instance.Root.CFrame:ToObjectSpace(r0.end_bullet:GetPivot())
        r1:set_pivot("general", function() -- Line: 131 | Upvalues: ("r0" (copy), "r2" (copy))
            return r0.instance.Root.CFrame * r2
        end)
        r1:create_pivot("unloaded", function() -- Line: 134 | Upvalues: ("r0" (copy))
            return r0.instance.Magazine.CFrame
        end)
    end
    r0.cylinder = r0.instance:FindFirstChild("Cylinder")
    if r0.cylinder then
        local r1 = r0.cframes:get(r0.cylinder, true)
        local r2 = r0.instance.Root.CFrame:ToObjectSpace(r0.cylinder:GetPivot())
        r1:set_pivot("general", function() -- Line: 143 | Upvalues: ("r0" (copy), "r2" (copy))
            return r0.instance.Root.CFrame * r2
        end)
        r1:set_offset("reload")
        if r0.cylinder_loader then
            r0.loader = r0.cylinder_loader:Clone()
            r0.cframes:get(r0.loader.Case):set_pivot("general", function(r0_p12) -- Line: 150 | Upvalues: ("r0" (copy))
                return r0.owner.values.viewmodels.arm2.CFrame * CFrame.new(0.2, -0.7, -0.4) * CFrame.Angles(-1.5707963267948966, 0.5235987755982988, 0) * CFrame.Angles(0, 0, -0.5235987755982988)
            end)
            r0.cframes:get(r0.loader.Case):create_pivot("reload", function(r0_p13) -- Line: 153 | Upvalues: ("r0" (copy))
                return r0.instance.Cylinder:GetPivot() * CFrame.new(0, 0, 0.2)
            end)
        end
    end
    Util.weld_c(r0.instance.Trigger, r0.instance.Root)
    r0.magazine = r0.instance:FindFirstChild("Magazine")
    if r0.magazine then
        local r1 = r0.cframes:get(r0.magazine)
        local r2 = r0.instance.Root.CFrame:ToObjectSpace(r0.magazine:GetPivot())
        r1:set_pivot("general", function() -- Line: 170 | Upvalues: ("r0" (copy), "r2" (copy))
            return r0.instance.Root.CFrame * r2
        end)
        r1:create_pivot("reload", function(r0_p15) -- Line: 173 | Upvalues: ("r0" (copy))
            return r0.owner.values.viewmodels.arm2:GetPivot() * r0.magazine_hold_offset
        end)
    end
end
function r2.update_sight_lens(r0, r1) -- Line: 179 | Name: update_sight_lens | Upvalues: ("Util" (copy), "UI" (copy))
    local r2 = r0.states.ads:get()
    if r1 then
        local CurrentCamera_2 = workspace.CurrentCamera
        Util.tween(CurrentCamera_2, TweenInfo.new(r2, Enum.EasingStyle.Linear), {FieldOfView = CurrentCamera_2:GetAttribute("OriginalFOV") / r0.states.zoom:get()})
        Util.tween(UI.get("RedDot").UIStroke, TweenInfo.new(0.3), {Transparency = 1})
        local ScopePart_2 = r0.instance:FindFirstChild("ScopePart", true)
        if ScopePart_2 then
            ScopePart_2:SetAttribute("OriginalMaterial", ScopePart_2.Material.Name)
            if ScopePart_2.Material ~= Enum.Material.Neon then ScopePart_2.Material = Enum.Material.Glass end
            ScopePart_2:SetAttribute("PreviousScopeTransparency", ScopePart_2.Transparency)
            ScopePart_2.Transparency = math.max(0.011, ScopePart_2.Transparency)
        end
        local ScopeTint_2 = r0.instance:FindFirstChild("ScopeTint", true)
        if ScopeTint_2 then ScopeTint_2.Transparency = ScopePart_2 ~= nil and 0.3 or 0.8 end
        UI.hook_world_billboards("sights", function(r0) -- Line: 201 | Upvalues: ("Util" (upval))
            Util.tween(r0, TweenInfo.new(0.1), {GroupTransparency = 0.7, Size = UDim2.fromScale(0.9, 0.9)})
        end)
        return
    end
    local CurrentCamera = workspace.CurrentCamera
    Util.tween(CurrentCamera, TweenInfo.new(r2, Enum.EasingStyle.Linear), {FieldOfView = CurrentCamera:GetAttribute("OriginalFOV")})
    Util.tween(UI.get("RedDot").UIStroke, TweenInfo.new(0.3), {Transparency = 0.5})
    local ScopePart = r0.instance:FindFirstChild("ScopePart", true)
    if ScopePart and ScopePart:GetAttribute("OriginalMaterial") then
        ScopePart.Material = Enum.Material[ScopePart:GetAttribute("OriginalMaterial")]
        ScopePart.Transparency = ScopePart:GetAttribute("PreviousScopeTransparency") or 0
    end
    local ScopeTint = r0.instance:FindFirstChild("ScopeTint", true)
    if ScopeTint then ScopeTint.Transparency = 1 end
    UI.unhook_world_billboards("sights")
    for r9, r10 in UI.get_world_billboards() do
        Util.tween(r10, TweenInfo.new(0.1), {GroupTransparency = 0, Size = UDim2.fromScale(1, 1)})
    end
end
function r2.hook_states(r0) -- Line: 227 | Name: hook_states | Upvalues: ("Maid" (copy), "Util" (copy), "UI" (copy))
    r0.offsets = {}
    r0.states.mag:hook(function(r0_p19) -- Line: 230 | Upvalues: ("r0" (copy))
        r0:update_ui()
    end)
    r0.states.bullets:hook(function(r0_p20) -- Line: 234 | Upvalues: ("r0" (copy))
        r0:update_ui()
    end)
    r0.states.sights:hook(function(r0_p21, r1) -- Line: 238 | Upvalues: ("r0" (copy))
        if r0_p21 == r1 then return end
        if r0.owner then r0:sights(r0.owner, r0_p21) end
    end)
    r0.states.sights:hook(function(r0_p22, r1) -- Line: 245 | Upvalues: ("r0" (copy))
        if r0_p22 == r1 then return end
        if r0.owner.values.camera:get() then r0:update_sight_lens(r0_p22) end
    end)
    r0.states.reload:hook_paused(function(r0_p23, r1) -- Line: 252 | Upvalues: ("r0" (copy))
        if r0_p23 == r1 then return end
        if r0.owner then r0:reload(r0.owner, false) end
    end)
    r0.states.reload:hook(function() -- Line: 259 | Upvalues: ("r0" (copy))
        if r0.owner then r0:reload(r0.owner, true) end
    end)
    r0.states.accuracy:hook(function(r0_p25) -- Line: 265 | Upvalues: ("r0" (copy))
        if r0.accuracy then r0.accuracy.Value = r0.states.accuracy:get() - 1 end
    end)
    r0.states.cock:hook(function() -- Line: 271 | Upvalues: ("r0" (copy))
        if r0.owner then r0:cock(r0.owner, true) end
    end)
    r0.states.melee:hook(function() -- Line: 277 | Upvalues: ("r0" (copy))
        if r0.owner then r0:melee(r0.owner) end
    end)
    r0.states.shoot:hook(function(r0_p28, r1) -- Line: 283 | Upvalues: ("r0" (copy))
        if r0.owner then r0:shoot(r0.owner, r0_p28, r1) end
    end)
    r0.states.hit:hook(function(r0_p29, r1) -- Line: 289 | Upvalues: ("r0" (copy))
        if r0.owner then r0:hit(r0.owner, r0_p29, r1) end
    end)
    r0.states.loaded:hook(function(r0_p34, r1) -- Line: 295 | Upvalues: ("r0" (copy))
        if r0_p34 == r1 or not r0.owner then return end
        if r0_p34 and r1 == false and not r0.states.single_load:get() then
            local r2 = math.min(r0.states.mag_size:get(), r0.states.bullets:get())
            r0.states.mag:update(function(r0) -- Line: 299 | Upvalues: ("r2" (copy))
                return r0 + r2
            end)
            r0.states.bullets:update(function(r0) -- Line: 302 | Upvalues: ("r2" (copy))
                return r0 - r2
            end)
            return
        end
        if r1 then
            local r3 = math.max(0, r0.states.mag:get() - (r0.instance:FindFirstChild("BulletEject", true) and 1 or 0))
            r0.states.mag:update(function(r0) -- Line: 308 | Upvalues: ("r3" (copy))
                return r0 - r3
            end)
            r0.states.bullets:update(function(r0) -- Line: 311 | Upvalues: ("r3" (copy))
                return r0 + r3
            end)
        end
    end)
    r0.states.load_bullet:hook(function() -- Line: 317 | Upvalues: ("r0" (copy))
        if r0.owner and r0.states.single_load:get() then
            r0.states.mag:update(function(r0) -- Line: 320
                return r0 + 1
            end)
            r0.states.bullets:update(function(r0) -- Line: 323
                return r0 - 1
            end)
        end
    end)
    r0.states.chambered:hook(function(r0_p38, r1) -- Line: 329 | Upvalues: ("r0" (copy))
        if r0_p38 == r1 then return end
        if r0.owner then r0:chamber(r0.owner, r0_p38) end
    end)
    r0:hook_attachment_states()
    r0.safety:hook(function(r0_p39, r1) -- Line: 338 | Upvalues: ("r0" (copy))
        if r0.owner then r0:safety_function(r0.owner, r0_p39, r1) end
    end)
    local r1 = Maid.new()
    r0.object:destroying(function() -- Line: 346 | Upvalues: ("r1" (copy))
        r1:clean()
    end)
    local r4 = r0.owner.values.camera:hook(function(r0_p41, r1) -- Line: 350 | Upvalues: ("r0" (copy))
        if not r0.states.sights:get() then return end
        if r0_p41 then
            r0:update_sight_lens(true)
            return
        end
        if r1 then r0:update_sight_lens(false) end
    end)
    r4 = r4.unhook
    r1:add(r4)
    r4 = r0.owner.values.camera:hook(function(r0_p42, r1) -- Line: 359 | Upvalues: ("r0" (copy), "Util" (upval), "UI" (upval))
        if not r0.states.sights:get() then return end
        local r2
        if r0_p42 == game.Workspace.CurrentCamera then
            Util.tween(UI.get("RedDot").UIStroke, TweenInfo.new(0), {Transparency = 1})
            r2 = workspace.CurrentCamera
            Util.tween(r2, TweenInfo.new(0, Enum.EasingStyle.Linear), {FieldOfView = r2:GetAttribute("OriginalFOV") / r0.states.zoom:get()})
            return
        end
        if r0_p42 == nil and r1 == game.Workspace.CurrentCamera then
            local CurrentCamera = workspace.CurrentCamera
            Util.tween(CurrentCamera, TweenInfo.new(0, Enum.EasingStyle.Linear), {FieldOfView = CurrentCamera:GetAttribute("OriginalFOV")})
        end
    end)
    r4 = r4.unhook
    r1:add(r4)
end
function r2.running(r0, r1, r2) -- Line: 374 | Name: running
    local r3 = r1.values.cframes:get("arms"):get_offset("run")
    if r2 then
        r0:running_pivots(r1, true)
        r0.states.sights:set(false)
        r0:reload(r1, false)
        r1.values.cframes:get("arms"):set_offset("run")
        r0.anim.Run.run_offset(r3)
        return
    end
    r0:running_pivots(r1, false)
    r0.anim.Run.base(r3).Completed:Wait()
    r1.values.cframes:get("arms"):remove_offset("run")
end
function r2.sights(r0, r1, r2) -- Line: 391 | Name: sights | Upvalues: ("Data" (copy), "Input" (copy), "Util" (copy), "UI" (copy))
    r0.sound.Handle(r0.instance.Root)
    local r3_p46 = r1.values.cframes:get("arm1"):get_offset("sights")
    local r4 = r1.values.cframes:get("arm2"):get_offset("sights")
    local r5 = r0.cframes:get(r0.instance.Root):get_offset("sights")
    local r6 = r0.states.ads:get()
    if r2 then
        local r7_p46 = false
        if r1.values.holding and r1.values.holding.safety then
            if r1.values.holding.states.ads then r6 += r1.values.holding.states.ads:get() end
            if r1.states.holding:get() == r1.values.holding.instance then
                r1.values.holding.safety:set(true)
                r7_p46 = true
            end
        end
        r0:reload(r1, false)
        r1.values.cframes:get("arm1"):set_offset("sights")
        if not r7_p46 then r1.values.cframes:get("arm2"):set_offset("sights") end
        r0.anim.Equip.arm1_hold(r1.values.cframes:get("arm1"):set_absolute("sights", true), r0, r6)
        r0.cframes:get(r0.instance.Root):set_offset("sights")
        r0.anim.Sight.arm1(r3_p46, r0.instance, r6)
        r0.anim.Sight.arm2(r4, r0.instance, r6)
        r0.anim.Sight.gun(r5, r0.instance, r6)
        if r1.values.camera:get() then
            if not r0.inputs or not r0.inputs.enabled:get() then
                Util.tween(r0.accuracy, TweenInfo.new(r6, Enum.EasingStyle.Linear), {Value = 1})
                return
            end
            local r8_p46 = `camera_sensitivity_{string.gsub(tostring(r0.states.zoom:get()), "[.]", "_")}`
            if Data.settings[r8_p46] then
                Input.mouse_base_sensitivity:set(Util.map_sensitivity(Data.settings[r8_p46]))
                task.spawn(function() -- Line: 444 | Upvalues: ("r0" (copy), "Input" (upval), "Util" (upval), "Data" (upval))
                    while true do
                        if not r0.states.sights:get() then break end
                        r0.states.sights:wait()
                    end
                    Input.mouse_base_sensitivity:set(Util.map_sensitivity(Data.settings.camera_sensitivity))
                end)
            end
            Util.tween(r0.accuracy, TweenInfo.new(r6, Enum.EasingStyle.Linear), {Value = 1})
            return
        end
    else
        r1.values.cframes:get("arm1"):remove_absolute("sights")
        if r1.values.holding and r1.values.holding.safety and not r1.values.equip_debounce:get() then
            r1.values.holding.safety:set(false)
            if r1.values.holding.states.ads then r6 += r1.values.holding.states.ads:get() end
        end
        if r1.values.camera:get() then
            Util.tween(r0.accuracy, TweenInfo.new(r6, Enum.EasingStyle.Linear), {Value = r0.states.accuracy:get() - 1})
        end
        if r0.inputs and r0.inputs.enabled:get() then UI.get("CancelScope").Visible = false end
        r0.anim.Sight.base(r3_p46, r0.instance, r6)
        r0.anim.Sight.base(r4, r0.instance, r6)
        r0.anim.Sight.base(r5, r0.instance, r6).Completed:Wait()
        r1.values.cframes:get("arm1"):remove_offset("sights")
        r1.values.cframes:get("arm2"):remove_offset("sights")
        r0.cframes:get(r0.instance.Root):remove_offset("sights")
    end
end
function r2.reload(r0, r1, r2) -- Line: 500 | Name: reload
    if r2 then
        r0.reload_thread(r0, r1, r2)
        return
    end
    r0.reload_thread:cancel(r0, r1, r2)
end
function r2.cock(r0, r1, r2) -- Line: 508 | Name: cock
    if r2 then
        r0:reload(r1, false)
        r0.cock_thread(r0, r1, r2)
        return
    end
    r0.cock_thread:cancel(r0, r1, r2)
end
function r2.chamber(r0, r1, r2) -- Line: 517 | Name: chamber
    if r0.slide then
        local r3 = r0.cframes:get(r0.slide):get_offset("shoot")
        if r2 then
            r0.anim.Gun.slide_off(r3)
        else
            r0.anim.Gun.slide_on(r3).Completed:Wait()
        end
    end
    if not r0.states.single_load:get() then
        if r2 then
            r0.sound.Reload4(r0.instance.Root)
            return
        end
        r0.sound.Empty(r0.instance.Root)
    end
end
function r2.render(r0, r1, r2) -- Line: 535 | Name: render
    r0.instance.Root:PivotTo(r0.cframes:get(r0.instance.Root):render(r2))
    if r0.hammer then r0.hammer:PivotTo(r0.cframes:get(r0.hammer):render(r2)) end
    if r0.feed_cover then r0.feed_cover:PivotTo(r0.cframes:get(r0.feed_cover):render(r2)) end
    if r0.slide then r0.slide:PivotTo(r0.cframes:get(r0.slide):render(r2)) end
    if r0.load_slide then r0.load_slide:PivotTo(r0.cframes:get(r0.load_slide):render(r2)) end
    if r0.magazine then
        r0.magazine:PivotTo(r0.cframes:get(r0.magazine):render(r2))
    elseif r0.cylinder then
        r0.cylinder:PivotTo(r0.cframes:get(r0.cylinder):render(r2))
        if r0.loader and r0.loader.Parent == r1.values.viewmodels then
            r0.loader.Case:PivotTo(r0.cframes:get(r0.loader.Case):render(r2))
        end
    end
    if r0.end_bullet then r0.end_bullet:PivotTo(r0.cframes:get(r0.end_bullet):render(r2)) end
    if r0.charm_model and r0.charm_model.PrimaryPart then
        r0.charm_model.PrimaryPart:PivotTo(r0.cframes:get(r0.charm_model.PrimaryPart):render(r2))
    end
    if r0.inputs and r0.inputs.enabled:get() then r0:input_render(r2) end
end
function r2.auto_shoot_check(r0, r1) -- Line: 578 | Name: auto_shoot_check | Upvalues: ("UI" (copy), "Util" (copy), "StateObject" (copy))
    local r2 = os.clock()
    if r2 - r0.auto_shoot_dt > 0.25 then
        r0.auto_shoot_dt = r2
        if UI.get("Flash").Frame.BackgroundTransparency == 0 then return end
        local owner = r0.owner
        local r4_p51 = r0:get_shoot_look()
        r4_p51 = CFrame.new(Util.validate_position(game.Workspace.CurrentCamera.CFrame.Position, r4_p51.Position, owner.values.ray_params)) * r4_p51.Rotation
        local r7_p51 = r0:ray_damage(r4_p51.Position, r4_p51.LookVector * 500, {owner.values.viewmodels, owner.instance}, nil, true)
        for r11, r12 in r7_p51 do
            local Instance = r12.Instance
            if r12.HitHum then
                r0:input_shoot(true)
                return
            end
            if not (not Instance or Instance.Transparency >= 1) then
                local r14 = Util.get_breakable_instance(Instance)
                if r14 and Util.ownership(StateObject.get("Breakable", r14).owner:get()) == 0 then
                    r0:input_shoot(true)
                    return
                end
            end
        end
        if not r0.shoot_hold or r0.inputs:get("shoot"):holding() or r0.inputs:get("shoot_joystick"):holding() then
            return
        end
        r0:input_shoot(false)
    end
end
function r2.input_render(r0, r1) -- Line: 617 | Name: input_render | Upvalues: ("Data" (copy))
    local owner = r0.owner
    if owner.values.prone_debounce or owner.values.equip_debounce:get() or owner.states.vault:get() > 0 then
        r0:reload(owner, false)
        r0:cock(owner, false)
    elseif not r0.cock_thread.running and not r0.reload_thread.running and not r0.states.chambered:get() and not owner.values.equip_debounce:get() and not r0.states.reload:get() and owner.states.vault:get() == 0 and r0.states.loaded:get() and r0.states.mag:get() > 0 then
        r0.states.cock:fire_instant()
    end
    if not Data.settings.toggle_aim then
        if r0.ads_hold and not r0.reload_thread.running and not r0.meleeing and not owner.states.running:get() and not owner.values.prone_debounce and not owner.values.equip_debounce:get() then
            r0.states.sights:set(true)
        else
            r0.states.sights:set(false)
        end
    end
    if r0.automatic and (not r0.shoot_hold or r0.burst ~= nil) and (r0.burst_left and r0.burst_left > 0) then
        if r0.safety:get() and r0.accuracy.Value < 1 or owner.values.equip_debounce:get() then
        elseif not owner.states.running:get() then
            local r4 = os.clock()
            local r5 = r0.states.firerate:get()
            if r5 == 0 or 1 / (r5 / 60) < r4 - r0.last_shot then
                if r0.states.mag:get() > 0 and r0.states.chambered:get() then
                    r0.last_shot = r4
                    r0:send_shoot()
                    if r0.burst_left then r0.burst_left -= 1 end
                else
                    r0.burst_left = 0
                end
            end
        end
    end
    if r0.states.reload:get() and owner.values.equip_debounce:get() then r0:reload(owner, false) end
end
function r2.kickback(r0, r1) -- Line: 666 | Name: kickback
    local r2 = r1.values.cframes:get("arms"):set_offset("shoot")
    r0.anim.Shoot.key1(r2).Completed:Wait()
    r0.anim.Shoot.key2(r2).Completed:Wait()
    r0.anim.Shoot.key3(r2).Completed:Wait()
    r1.values.cframes:get("arms"):remove_offset("shoot")
end
function r2.recoil_function(r0, r1) -- Line: 677 | Name: recoil_function | Upvalues: ("Input" (copy), "Util" (copy))
    r1.values.cframes:get("camera"):remove_offset("shoot")
    local r2 = r1.values.cframes:get("camera"):set_offset("shoot")
    if r1.values.camera:get() then
        r1.values.old_cam_render = r1.values.old_cam_render * r2.Value:Inverse()
    end
    local r4 = r0.states.recoil_up:get()
    local r5 = r0.states.recoil_side:get()
    if Input.current_device:get() ~= "pc" then
        r4 *= 0.7
        r5 *= 0.7
    end
    if r0.prone_recoil and r1.states.walk_state:get() == "prone" then
        r4 *= r0.prone_recoil
        r5 *= r0.prone_recoil
    end
    Util.tween(r2, TweenInfo.new(0), {Value = CFrame.new()})
    r2.Value = CFrame.new()
    if r1.values.cframes:get("arm2"):current_pivot() == "equipped" then
        r4 *= 0.8
    else
        r5 *= 1.2
    end
    local r7_p54, r8 = math.rad(Util.rand(r4 * 1, r4 * 2)), math.rad(Util.rand(-r5 * 1, r5 * 1))
    r7_p54 = math.exp((r4 + r5) / 30)
    r8 = math.max(math.min(0.1, 60 / r0.states.firerate:get()), r7_p54 * 0.06)
    local r9 = r7_p54 * 0.24
    Util.tween(r2, TweenInfo.new(r8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Value = CFrame.Angles(r7_p54, r8, 0)}).Completed:Wait()
    Util.tween(r2, TweenInfo.new(r9, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Value = CFrame.new()}).Completed:Wait()
end
function r2.shoot(r0, r1, r2, r3) -- Line: 716 | Name: shoot
    r0.states.mag:update(function(r0) -- Line: 717
        return math.max(0, r0 - 1)
    end)
    if r0.states.firerate:get() == 0 then
        r0.states.chambered:set(false)
    else
        local BulletEject = r0.instance:FindFirstChild("BulletEject", true)
        if BulletEject then r0:eject_bullet(BulletEject, r0.bullet_type) end
    end
    if r0.supressed then
        r0.sound.SilencedShoot(r0.shot)
    else
        r0.sound.Shoot(r0.shot)
    end
    r0:reload(r1, false)
    if r0.owner.values.camera:get() == nil and r0.states.pellets:get() <= 1 and r3 and #r3 > 0 then
        for r8, r9 in r3 do
            if #r9 > 0 then r0:trail(r0.shot.CFrame.Position, r9[#r9].Position) end
        end
    end
    task.spawn(function() -- Line: 743 | Upvalues: ("r0" (copy), "r1" (copy))
        r0:kickback(r1)
    end)
    if r1.values.camera:get() then r0.recoil(r0, r1) end
    task.spawn(function() -- Line: 749 | Upvalues: ("r0" (copy))
        local Smoke = r0.shot:FindFirstChild("Smoke")
        if Smoke then
            for i_0 = 1, 3 do
                Smoke:Emit(1)
                task.wait(0.1)
            end
        end
    end)
    if r0.shot:FindFirstChild("Flash") then r0:flash() end
    if r0.states.firerate:get() > 0 then task.spawn(r0.slide_shoot, r0) end
    if r0.hammer then
        task.spawn(function() -- Line: 765 | Upvalues: ("r0" (copy))
            local r0_p58 = r0.cframes:get(r0.hammer):set_offset("shoot")
            r0.anim.Gun.hammer_on(r0_p58).Completed:Wait()
            r0.anim.Gun.hammer_off(r0_p58).Completed:Wait()
            r0.cframes:get(r0.hammer):remove_offset("shoot")
        end)
    end
    if r3 then r0:bullet_hit(r1, r3) end
end
function r2.bullet_hit(r0, r1, r2) -- Line: 784 | Name: bullet_hit | Upvalues: ("Util" (copy), "Effects" (copy), "Maid" (copy), "StateObject" (copy))
    for r6, r7_p65 in r2 do
        if #r7_p65 == 0 then continue end
        local r8 = {}
        for r12, r13 in r7_p65 do
            local Instance_3 = r13.Instance
            if Instance_3 == nil then
            elseif Instance_3:HasTag("Water") and not Instance_3.CanCollide then
                local Position = r13.Position
                local Attachment = Instance.new("Attachment")
                Util.debris(Attachment, 2)
                Attachment.WorldCFrame = CFrame.new(Position.X, Instance_3.CFrame.Y + math.min(Instance_3.Size.X, Instance_3.Size.Y, Instance_3.Size.Z) * 0.5, Position.Z)
                Attachment.Parent = game.Workspace.Terrain
                Effects.Ring(Attachment, Instance_3.Color)
                Effects.Splash(Attachment, 3, Instance_3.Color)
                Effects.WaterSplash(Attachment)
            elseif not r13.HitHum or not Instance_3.Parent or r8[Instance_3.Parent] then
            else
                r8[Instance_3.Parent] = true
                local Attachment = Instance.new("Attachment")
                Attachment.Parent = game.Workspace.Terrain
                Attachment.WorldCFrame = CFrame.new(r13.Position) * CFrame.lookAt(vector.create(0, 0, 0), r13.Normal)
                Util.debris(Attachment, 1)
                r0:emit_blood(Attachment, Instance_3.Color)
                r0.sound.BulletHit(Attachment)
            end
        end
        local r9 = r7_p65[#r7_p65]
        if not r9 then continue end
        local Instance_2 = r9.Instance
        if not (r9.HitHum or not Instance_2 or Instance_2.Transparency >= 1 or not Instance_2.Anchored) then
            local r13 = Effects.create_point(r9.Position, r9.Normal, math.random(8, 12))
            local r14 = Util.get_breakable_instance(Instance_2)
            if r14 then
                local Normal = Maid.new()
                local r18 = StateObject.get("Breakable", r14).states.destroyed:hook(function(r0) -- Line: 826 | Upvalues: ("r13" (copy))
                    if r0 then
                        task.defer(function() -- Line: 828 | Upvalues: ("r13" (upval))
                            r13:Destroy()
                        end)
                    end
                end)
                r18 = r18.unhook
                Normal:add(r18)
                Normal:add(r14.AncestryChanged:Connect(function() -- Line: 834 | Upvalues: ("r14" (copy), "r13" (copy))
                    if r14.Parent == nil or r14.Parent == game.ReplicatedStorage.Garbage then
                        task.defer(function() -- Line: 836 | Upvalues: ("r13" (upval))
                            r13:Destroy()
                        end)
                    end
                end))
                r13.Destroying:Connect(function() -- Line: 842 | Upvalues: ("Normal" (copy))
                    Normal:clean()
                end)
            end
            local Normal = script.BulletHoles.Normal:Clone()
            Normal.Parent = r13
            Normal.Color = ColorSequence.new(Instance_2.Color)
            Normal:Emit(2)
        end
    end
end
function r2.slide_shoot(r0) -- Line: 856 | Name: slide_shoot
    local r1
    if r0.slide then
        r1 = r0.cframes:get(r0.slide):get_offset("shoot")
        r0.anim.Gun.slide_on(r1).Completed:Wait()
        if r0.states.mag:get() > 0 then r0.anim.Gun.slide_off(r1).Completed:Wait() end
        if r0.states.mag:get() == 0 then
            r0.states.chambered:set(false)
            return
        end
    elseif r0.load_slide then
        r1 = r0.cframes:get(r0.load_slide):get_offset("shoot")
        r0.anim.Gun.slide_on(r1).Completed:Wait()
        r0.anim.Gun.slide_off(r1).Completed:Wait()
        if r0.states.mag:get() == 0 then r0.states.chambered:set(false) end
    end
end
function r2.melee(r0, r1, r2) -- Line: 876 | Name: melee
    r0:reload(r1, false)
    r0:cock(r1, false)
    r0.meleeing = true
    local r3 = r1.values.cframes:get("arm1"):set_absolute("melee", true)
    local r4, r5
    if r0.anim.Melee.arm2_hold then
        r4 = r1.values.cframes:get("arm2"):set_absolute("melee", true)
        r0.anim.Melee.arm2_hold(r4)
    else
        r4 = r1.values.cframes:get("arm2"):set_absolute("melee", CFrame.new())
        r1.values.cframes:get("arm2"):set_pivot("base")
    end
    if r0.anim.Melee.gun_hold then
        r5 = r0.cframes:get(r0.instance.Root):set_absolute("melee", true)
        r0.anim.Melee.gun_hold(r5)
    end
    r0.sound.Handle(r0.instance.Root)
    r0.anim.Melee.arm1_hold(r3).Completed:Wait()
    r1.values.cframes:get("arm1"):remove_absolute("melee")
    r1.values.cframes:get("arm2"):remove_absolute("melee")
    if not r0.anim.Melee.arm2_hold then r1.values.cframes:get("arm2"):remove_pivot("base") end
    if r5 then r0.cframes:get(r0.instance.Root):remove_absolute("melee") end
end
function r2.hit(r0, r1, r2, r3) -- Line: 905 | Name: hit
    local r4 = r1.values.cframes:get("arm1"):set_absolute("melee")
    local r5, r6
    if r0.anim.Melee.arm2_hit then r5 = r1.values.cframes:get("arm2"):set_absolute("melee") end
    if r0.anim.Melee.gun_hit then r6 = r0.cframes:get(r0.instance.Root):set_absolute("melee") end
    if not r0:process_hit_results(r2, r3) then
        if r6 then r0.anim.Melee.gun_hit(r6) end
        if r5 then r0.anim.Melee.arm2_hit(r5) end
        r0.anim.Melee.arm1_hit(r4).Completed:Wait()
    else
        r0.sound.Swing(r0.instance.Root)
        if r6 then r0.anim.Melee.gun_miss(r6) end
        if r5 then r0.anim.Melee.arm2_miss(r5) end
        r0.anim.Melee.arm1_miss(r4).Completed:Wait()
    end
    r1.values.cframes:get("arm1"):remove_absolute("melee")
    if r5 then r1.values.cframes:get("arm2"):remove_absolute("melee") end
    if r6 then r0.cframes:get(r0.instance.Root):remove_absolute("melee") end
    r0.meleeing = false
end
function r2.safety_function(r0, r1, r2, r3) -- Line: 946 | Name: safety_function
    local r4 = r1.values.cframes:get("arm1"):get_absolute("equipped")
    if r2 == true then
        r0.anim.Equip.arm1_hold_safety(r4)
        if r3 == false then
            r1.values.cframes:get("arm2"):remove_pivot("equipped")
            r1.values.cframes:get("arm2"):remove_absolute("equipped")
            return
        end
    elseif r2 == false then
        r1.values.cframes:get("arm2"):set_absolute("equipped", true)
        r1.values.cframes:get("arm2"):set_pivot("equipped")
        r0.anim.Equip.arm2_hold(r1.values.cframes:get("arm2"):get_absolute("equipped"), r0)
        r0.anim.Equip.arm1_hold(r4, r0).Completed:Wait()
    end
end
function r2.equip(r0, r1, r2) -- Line: 965 | Name: equip
    local r3 = r1.values.cframes:get("arm1"):get_absolute("equipped")
    local r4 = r1.values.cframes:get("arm2"):get_absolute("equipped")
    local Root = r0.instance:FindFirstChild("Root")
    if Root == nil then return end
    if r2 == true then
        r0:unholster(r1)
        r1.values.cframes:get("arm1"):set_absolute("equipped", true)
        r0.anim.Equip.arm1_grab(r3).Completed:Wait()
        r0.sound.Equip(Root)
        r0.cframes:get(Root):set_pivot("equipped")
        r0.cframes:get(Root).pivot_time = 0.2
        r1.values.cframes:get("arm1"):set_pivot("equipped")
        r0.safety:set_instant(r1.values.holding and r1.states.holding:get() == r1.values.holding.instance and r1.values.holding.loadout_type == "primary")
        return
    end
    r0.states.sights:set(false)
    r0:reload(r1, false)
    r0:cock(r1, false)
    r0.sound.Handle(Root)
    r1.values.cframes:get("arm1"):remove_pivot("equipped")
    if r0.safety:get() == false then
        r1.values.cframes:get("arm2"):remove_pivot("equipped")
        r1.values.cframes:get("arm2"):remove_absolute("equipped")
    end
    r0.safety:set_instant(nil)
    if not r1.values.holding or not r1.values.holding.safety then
        r0.anim.Equip.arm1_grab(r3).Completed:Wait()
        r0.cframes:get(Root).pivot_time = 0.2
        r0.cframes:get(Root):remove_pivot("equipped")
        r1.values.cframes:get("arm1"):remove_absolute("equipped")
        r0:holster(r1)
        return
    end
    r1.values.holding.safety:set(false)
    r0.anim.Equip.arm1_grab(r3).Completed:Wait()
    r0.cframes:get(Root).pivot_time = 0.2
    r0.cframes:get(Root):remove_pivot("equipped")
    r1.values.cframes:get("arm1"):remove_absolute("equipped")
    r0:holster(r1)
end
function r2.trail(r0, r1, r2, r3) -- Line: 1017 | Name: trail | Upvalues: ("Util" (copy))
    local Attachment = Instance.new("Attachment")
    local Attachment_2 = Instance.new("Attachment")
    Util.debris(Attachment, 0.5)
    Util.debris(Attachment_2, 0.5)
    Attachment.Parent = workspace.Terrain
    Attachment_2.Parent = workspace.Terrain
    Attachment.Position = r1
    Attachment_2.Position = r2
    local Beam = Instance.new("Beam", game.Workspace)
    Util.debris(Beam, 0.5)
    Beam.Width0 = r0.states.trail_size:get() or 0.1
    Beam.Width1 = r0.states.trail_size:get() or 0.1
    Beam.Attachment0 = Attachment
    Beam.Attachment1 = Attachment_2
    Beam.Transparency = r0.supressed and NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.95)}) or NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.75)})
    Util.tween(Beam, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0, false, 0), {Width0 = 0, Width1 = 0})
    if r0.owner.values.camera:get() == nil then
        local Attachment_3 = Instance.new("Attachment")
        Util.debris(Attachment_3, 0.5)
        Attachment_3.Parent = workspace.Terrain
        Attachment_3.WorldCFrame = CFrame.new(Util.closest_point_on_segment(game.Workspace.CurrentCamera.CFrame.Position, Attachment.WorldCFrame.Position, Attachment_2.WorldCFrame.Position))
        r0.sound.BulletWoosh(Attachment_3).Volume = math.min(1, (r1 - r2).Magnitude / 50) * 0.5
    end
end
local r20 = Util.create_debris_queue("casings", 16, 5)
function r2.eject_bullet(r0, r1, r2, r3) -- Line: 1064 | Name: eject_bullet | Upvalues: ("Data" (copy), "r20" (copy), "Effects" (copy))
    if Data.settings and not Data.settings.debris then return end
    local r4 = script.Bullets[r2]:Clone()
    r4.Parent = workspace
    r4.CanCollide = true
    r4:PivotTo(r1.WorldCFrame)
    r4.AssemblyLinearVelocity = r1.WorldCFrame.RightVector * math.random(8, 12) + r1.WorldCFrame.UpVector * math.random(8, 12)
    r4.CastShadow = false
    r4.CanQuery = false
    r20:add_item(r4)
    Effects.mark_for_killcam(r4)
    return r4
end
function r2.setup_shot(r0, r1) -- Line: 1084 | Name: setup_shot | Upvalues: ("Util" (copy))
    local Shot = script.Shot:Clone()
    Shot.Flash.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.3), NumberSequenceKeypoint.new(1, 0.3)})
    Shot.Parent = r1.Parent
    Shot.CFrame = r1.WorldCFrame
    Util.weld_c(Shot, r1.Parent)
    return Shot
end
function r2.hide_mag(r0, r1) -- Line: 1096 | Name: hide_mag
    if r1 then
        r0.magazine.Parent = nil
        return
    end
    r0.magazine.Parent = r0.instance
end
function r2.reload_begin(r0, r1) -- Line: 1110 | Name: reload_begin | Upvalues: ("Util" (copy))
    r0.sound.Handle(r0.instance.Root)
    r0.safety:set(false)
    local r2 = r1.values.cframes:get("arm1"):set_absolute("reload", true)
    local r3 = r1.values.cframes:get("arm2"):set_absolute("reload", true)
    local r4 = r0.cframes:get(r0.instance.Root):set_absolute("reload", true)
    local r5 = r0.states.reload_speed:get()
    local r6 = false
    local r7_p76
    if r0.feed_cover then
        r0.anim.Reload.arm2_empty1(r3, r5)
        r0.anim.Reload.gun_empty1(r4, r5)
        r0.anim.Reload.arm1_empty1(r2, r5).Completed:Wait()
        r7_p76 = r0.cframes:get(r0.feed_cover):get_offset("reload")
        r0.sound.FeedOpen(r0.instance.Root)
        Util.tween(r7_p76, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Value = CFrame.Angles(0, -0.5235987755982988, 0)})
        r0.anim.Reload.arm2_empty2(r3, r5).Completed:Wait()
        if r0.states.loaded:get() and not r0.states.single_load:get() then
            r0.anim.Reload.arm1_start(r2, r5)
            r0.anim.Reload.gun(r4, r5)
            r0.anim.Reload.arm2_start(r3, r5).Completed:Wait()
            if r0.magazine then
                if r0.end_bullet then r0.cframes:get(r0.end_bullet):set_pivot("unloaded") end
                r0.cframes:get(r0.magazine):set_pivot("reload")
                r0.sound.Reload1(r0.instance.Root)
                r0.states.loaded:set(false)
                r6 = true
            end
        else
            r0.anim.Reload.gun(r4, r5)
        end
    elseif r0.cylinder then
        r0.anim.Reload.arm1_start(r2, r5)
        r0.anim.Reload.gun(r4, r5)
        r0.anim.Reload.arm2_start(r3, r5).Completed:Wait()
        r7_p76 = r0.cframes:get(r0.cylinder):get_offset("reload")
        r0.sound.Reload1(r0.instance.Root)
        r0.anim.Reload.cylinder_open(r7_p76, r5)
        if r0.states.loaded:get() then
            if r0.anim.Reload.arm1_empty1 then
                r0.anim.Reload.arm2_empty1(r3, r5)
                r0.anim.Reload.arm1_empty1(r2, r5).Completed:Wait()
            end
            if r0.cylinder:FindFirstChild("Eject") then
                for i_0 = 1, r0.states.mag_size:get() do
                    r0:eject_bullet(r0.cylinder.Eject, r0.bullet_type, CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966))
                end
                r0.sound.Cases(r0.instance.Root)
            end
            r0.states.loaded:set(false)
            r6 = true
            if r0.anim.Reload.arm1_empty2 then
                r0.anim.Reload.arm2_empty2(r3, r5)
                r0.anim.Reload.arm1_empty2(r2, r5).Completed:Wait()
            end
        end
    elseif r0.states.loaded:get() and not r0.states.single_load:get() then
        r0:cock(r1, false)
        r0.anim.Reload.arm1_start(r2, r5)
        r0.anim.Reload.gun(r4, r5)
        r0.anim.Reload.arm2_start(r3, r5).Completed:Wait()
        if r0.magazine then
            if r0.end_bullet then r0.cframes:get(r0.end_bullet):set_pivot("unloaded") end
            r0.cframes:get(r0.magazine):set_pivot("reload")
            r0.sound.Reload1(r0.instance.Root)
            r0.states.loaded:set(false)
            r6 = true
        end
    else
        r0.anim.Reload.gun(r4, r5)
        if r0.magazine then
            if r0.end_bullet then r0.cframes:get(r0.end_bullet):set_pivot("unloaded") end
            r0.cframes:get(r0.magazine):set_pivot("reload")
            r6 = true
        end
    end
    r7_p76 = math.min(r0.states.mag_size:get() - r0.states.mag:get() + (r0.states.chambered:get() and not r0.cylinder and 1 or 0), r0.states.bullets:get())
    if r7_p76 > 0 then r0:cock(r1, false) end
    for i_1 = 1, r7_p76 do
        r0.anim.Reload.arm1_idle1(r2, r5)
        if r6 and r0.anim.Reload.arm2_start2 then r0.anim.Reload.arm2_start2(r3, r5).Completed:Wait() end
        r1.values.cframes:get("arm2"):set_pivot("reload")
        r0.anim.Reload.base(r3, r5)
        if r0.anim.Reload.gun_idle then r0.anim.Reload.gun_idle(r4, r5) end
        if r0.states.single_load:get() then
            task.wait(0.15 * r5)
            r0.single_bullet = script.Bullets[r0.bullet_load_type or r0.bullet_type]:Clone()
            r0.single_bullet.Parent = r1.values.viewmodels
            r0.single_bullet.CanCollide = false
            r0.single_bullet:PivotTo(r1.values.viewmodels.arm2.CFrame * r0.hold_bullet_offset)
            Util.weld_c(r0.single_bullet, r1.values.viewmodels.arm2)
        else
            task.wait(0.5 * r5)
            if r0.cylinder and r0.loader then
                r0.loader.Bullets.Transparency = 0
                r0.loader.Parent = r1.values.viewmodels
                r0.loader.Case:PivotTo(r0.cframes:get(r0.loader.Case):render(0.016666666666666666))
            end
        end
        r1.values.cframes:get("arm2"):remove_pivot("reload")
        r0.anim.Reload.arm1_idle2(r2, r5)
        r0.anim.Reload.arm2_idle(r3, r5).Completed:Wait()
        local r11
        local r12
        if r0.magazine then
            r0.cframes:get(r0.magazine):remove_pivot("reload")
            r0:hide_mag(false)
            r0.sound.Reload2(r0.instance.Root)
            if r0.feed_cover then
                r0.anim.Reload.arm2_finish(r3, r5)
                r0.anim.Reload.arm1_finish(r2, r5).Completed:Wait()
                r0.sound.Chains(r0.instance.Root)
                local r11
                if r0.end_bullet then
                    r0.cframes:get(r0.end_bullet):remove_pivot("unloaded")
                    r0.end_bullet.Transparency = 0
                    local Children, r12, r13 = r0.end_bullet:GetChildren()
                    for r14, r15 in Children, r12, r13 do
                        if r15:IsA("BasePart") then r15.Transparency = 0 end
                    end
                end
                r0.anim.Reload.arm2_empty1_2(r3, r5)
                r0.anim.Reload.arm1_empty1(r2, r5).Completed:Wait()
                r0.states.loaded:set(true)
                r0.anim.Reload.gun_empty1(r4, r5)
                r0.anim.Reload.arm2_empty2(r3, r5).Completed:Wait()
                r11 = r0.cframes:get(r0.feed_cover):get_offset("reload")
                r0.sound.FeedClose(r0.instance.Root)
                Util.tween(r11, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Value = CFrame.Angles(0, 0, 0)})
                r0.anim.Reload.arm2_empty1_3(r3, r5).Completed:Wait()
            else
                r0.states.loaded:set(true)
                r0.anim.Reload.arm2_finish(r3, r5)
                r0.anim.Reload.arm1_finish(r2, r5).Completed:Wait()
            end
        elseif r0.states.single_load:get() then
            r0.sound.Reload2(r0.instance.Root)
            r0.single_bullet:Destroy()
            if not r0.cylinder then
                r0.states.loaded:set(true)
                r0.states.load_bullet:fire()
            end
            r0.anim.Reload.arm2_finish(r3, r5)
            r0.anim.Reload.arm1_finish(r2, r5).Completed:Wait()
            if r0.cylinder then
                r0.states.loaded:set(true)
                r0.states.load_bullet:fire()
            end
            if r0.cylinder and (i_1 == r7_p76 or r0.states.mag_size:get() <= r0.states.mag:get() or r0.states.bullets:get() <= 0) then
                if r0.loader then
                    r0.anim.Reload.arm1_start(r2, r5)
                    r0.anim.Reload.gun(r4, r5)
                    r0.anim.Reload.arm2_start(r3, r5).Completed:Wait()
                    r0.sound.Reload1(r0.instance.Root)
                    r11 = r0.cframes:get(r0.cylinder):get_offset("reload")
                    r0.anim.Reload.cylinder_close(r11, r5)
                    return
                end
                r0.anim.Reload.gun(r4, r5)
                if r0.anim.Reload.arm1_empty2 then
                    r0.anim.Reload.arm2_empty2(r3, r5)
                    r0.anim.Reload.arm1_empty2(r2, r5).Completed:Wait()
                end
                if not r0.anim.Reload.arm1_empty1 then
                    r0.sound.Reload1(r0.instance.Root)
                    r11 = r0.cframes:get(r0.cylinder):get_offset("reload")
                    r0.anim.Reload.cylinder_close(r11, r5)
                    return
                end
                r0.anim.Reload.arm2_empty1(r3, r5)
                r0.anim.Reload.arm1_empty1(r2, r5).Completed:Wait()
                r0.sound.Reload1(r0.instance.Root)
                r11 = r0.cframes:get(r0.cylinder):get_offset("reload")
                r0.anim.Reload.cylinder_close(r11, r5)
                return
            end
        elseif r0.cylinder and r0.loader then
            r0.sound.Reload2(r0.instance.Root)
            r0.cframes:get(r0.loader.Case):set_pivot("reload")
            r0.anim.Reload.arm2_finish(r3, r5)
            r0.anim.Reload.arm1_finish(r2, r5).Completed:Wait()
            r0.cframes:get(r0.loader.Case):remove_pivot("reload")
            r0.loader.Bullets.Transparency = 1
            r0.states.loaded:set(true)
            r1.values.cframes:get("arm2"):set_pivot("reload")
            r11 = r0.anim.Reload.base(r3, r5)
            r11.Completed:Connect(function() -- Line: 1343 | Upvalues: ("r0" (copy), "r1" (copy))
                if r0.loader then
                    r0.loader.Parent = nil
                    r0.cframes:get(r0.loader.Case):remove_pivot("reload")
                end
                r1.values.cframes:get("arm2"):remove_pivot("reload")
            end)
            if r0.anim.Reload.arm1_end1 then
                r0.anim.Reload.gun(r4, r5)
                r0.anim.Reload.arm1_end1(r2, r5).Completed:Wait()
                r0.sound.Reload1(r0.instance.Root)
                r12 = r0.cframes:get(r0.cylinder):get_offset("reload")
                r0.anim.Reload.cylinder_close(r12, r5)
                r0.anim.Reload.arm1_end2(r2, r5).Completed:Wait()
            else
                r0.anim.Reload.arm1_idle2(r2, r5)
                r11.Completed:Wait()
                r0.anim.Reload.arm1_start(r2, r5)
                r0.anim.Reload.gun(r4, r5)
                r0.anim.Reload.arm2_start(r3, r5).Completed:Wait()
                r0.sound.Reload1(r0.instance.Root)
                r12 = r0.cframes:get(r0.cylinder):get_offset("reload")
                r0.anim.Reload.cylinder_close(r12, r5)
            end
        end
        r11 = r0.states.bullets:get()
        if r11 <= 0 or not r0.states.single_load:get() then break end
        r11 = r0.states.mag:get()
        if r0.states.mag_size:get() + (r0.states.chambered:get() and 1 or 0) <= r11 then break end
    end
end
function r2.reload_done(r0, r1) -- Line: 1381 | Name: reload_done
    local r2 = r1.values.cframes:get("arm1"):get_absolute("reload")
    local r3 = r1.values.cframes:get("arm2"):get_absolute("reload")
    local r4 = r0.cframes:get(r0.instance.Root):get_absolute("reload")
    r0.sound.Handle(r0.instance.Root)
    r1.values.cframes:get("arm1"):remove_all_absolutes("reload")
    r1.values.cframes:get("arm2"):remove_all_absolutes("reload")
    r0.cframes:get(r0.instance.Root):remove_all_absolutes("reload")
    r0.safety:set(r1.values.holding and r1.values.holding.loadout_type == "primary")
end
function r2.reload_cancel(r0, r1) -- Line: 1392 | Name: reload_cancel | Upvalues: ("Util" (copy))
    if r0 == nil then return end
    local r2 = r1.values.cframes:get("arm1"):get_absolute("reload")
    local r3 = r1.values.cframes:get("arm2"):get_absolute("reload")
    local r4 = r0.cframes:get(r0.instance.Root):get_absolute("reload")
    if r0.single_bullet then
        r0.single_bullet:Destroy()
        r0.single_bullet = nil
    end
    if r0.loader then
        r0.loader.Parent = nil
        r0.cframes:get(r0.loader.Case):remove_pivot("reload")
    end
    r1.values.cframes:get("arm2"):remove_pivot("reload")
    if r0.end_bullet then
        if not r0.states.loaded:get() then
            if r0.cframes:get(r0.end_bullet):current_pivot() ~= "unloaded" then
                r0.cframes:get(r0.end_bullet):set_pivot("unloaded")
            end
            r0.end_bullet.Transparency = 1
            local Children, r6, r7_p78 = r0.end_bullet:GetChildren()
            for r8, r9 in Children, r6, r7_p78 do
                if r9:IsA("BasePart") then r9.Transparency = 1 end
            end
        else
            r0.cframes:get(r0.end_bullet):remove_pivot("unloaded")
        end
    end
    local r5
    if r0.magazine then
        r0.cframes:get(r0.magazine):remove_pivot("reload")
        if not r0.states.loaded:get() then r0:hide_mag(true) end
        if r0.feed_cover then
            r5 = r0.cframes:get(r0.feed_cover):get_offset("reload")
            Util.tween(r5, TweenInfo.new(0.1), {Value = CFrame.new(0, 0, 0)})
        end
    elseif r0.cylinder then
        r5 = r0.cframes:get(r0.cylinder):get_offset("reload")
        Util.tween(r5, TweenInfo.new(0.1), {Value = CFrame.new(0, 0, 0)})
    end
    r0.sound.Handle(r0.instance.Root)
    r1.values.cframes:get("arm1"):remove_all_absolutes("reload")
    r1.values.cframes:get("arm2"):remove_all_absolutes("reload")
    r0.cframes:get(r0.instance.Root):remove_all_absolutes("reload")
    r0.safety:set(r1.values.holding and r1.values.holding.loadout_type == "primary")
end
function r2.cock_begin(r0, r1) -- Line: 1444 | Name: cock_begin
    local r2_0 = not r0.states.single_load:get()
    r0.sound.Handle(r0.instance.Root)
    local r3 = r0.states.reload_speed:get()
    if r0.right_hand_hold then
        r0.cframes:get(r0.instance.Root).pivot_time = 0.1
        r0.cframes:get(r0.instance.Root):set_pivot("equipped2")
    end
    local r4 = r1.values.cframes:get("arm1"):set_absolute("cock", true)
    local r5 = r1.values.cframes:get("arm2"):set_absolute("cock", true)
    local r6
    if r0.load_slide then
        r6 = r0.cframes:get(r0.load_slide):set_offset("cock")
        r0.anim.Reload.slide_cock(r6, r3)
        if not r2_0 then r0.sound.Reload3(r0.instance.Root) end
    end
    r0.anim.Reload.arm1_cock(r4, r3, r0)
    r0.anim.Reload.arm2_cock(r5, r3, r0).Completed:Wait()
    if r6 then
        r0.anim.Reload.slide_cocked(r6, r3)
        if not r2_0 then
            r0.sound.Reload4(r0.instance.Root)
            local BulletEject = r0.instance:FindFirstChild("BulletEject", true)
            if BulletEject then r0:eject_bullet(BulletEject, r0.bullet_type) end
        else
            r0.sound.Reload3(r0.instance.Root)
        end
    else
        r0.states.chambered:set(true)
    end
    r0.anim.Reload.arm1_cocked(r4, r3, r0)
    r0.anim.Reload.arm2_cocked(r5, r3, r0).Completed:Wait()
    if r6 then r0.states.chambered:set(true) end
end
function r2.cock_done(r0, r1) -- Line: 1491 | Name: cock_done
    local r2 = r1.values.cframes:get("arm1"):get_absolute("cock")
    local r3 = r1.values.cframes:get("arm2"):get_absolute("cock")
    local r4
    if r0.load_slide then
        r4 = r0.cframes:get(r0.load_slide):get_offset("cock")
        r0.anim.Reload.base(r4, 1)
    end
    r0.sound.Handle(r0.instance.Root)
    if r4 then r0.cframes:get(r4):remove_offset("cock") end
    r1.values.cframes:get("arm1"):remove_all_absolutes("cock")
    r1.values.cframes:get("arm2"):remove_all_absolutes("cock")
    if r0.right_hand_hold then r0.cframes:get(r0.instance.Root):remove_pivot("equipped2") end
end
function r2.cock_cancel(r0, r1) -- Line: 1510 | Name: cock_cancel
    if r0 == nil then return end
    local r2 = r1.values.cframes:get("arm1"):get_absolute("cock")
    local r3 = r1.values.cframes:get("arm2"):get_absolute("cock")
    local r4
    if r0.load_slide then
        r4 = r0.cframes:get(r0.load_slide):get_offset("cock")
        r0.anim.Reload.base(r4, 1)
    end
    r0.sound.Handle(r0.instance.Root)
    if r4 then r0.cframes:get(r4):remove_offset("cock") end
    r1.values.cframes:get("arm1"):remove_all_absolutes("cock")
    r1.values.cframes:get("arm2"):remove_all_absolutes("cock")
    if r0.right_hand_hold then r0.cframes:get(r0.instance.Root):remove_pivot("equipped2") end
end
function r2.get_shoot_look(r0) -- Line: 1530 | Name: get_shoot_look | Upvalues: ("FlagManager" (copy))
    shared.extras.ResetEnv()
    if FlagManager.FLAG_ADS_CAMERA_BULLETS then
        return r0.shot.CFrame:Lerp((r0.reticule or r0.instance.Root.FrontSight).WorldCFrame, r0.accuracy.Value)
    end
    return r0.shot.CFrame
end
function get_circular_spread(r0, r1) -- Line: 1538 | Name: get_circular_spread
    local r2_0 = math.random() * 2 * 3.141592653589793
    local r3 = math.random() ^ 0.35
    r3 *= r1
    return (r0.RightVector * math.cos(r2_0) + r0.UpVector * math.sin(r2_0)) * r3
end
function r2.send_shoot(r0) -- Line: 1545 | Name: send_shoot | Upvalues: ("Util" (copy))
    local owner = r0.owner
    local r2 = r0:get_shoot_look()
    if r0.client_sided_hitscan then
        local r3 = r0.states.pellets:get() > 1
        local r4 = r2
        r4 = CFrame.new(Util.validate_position(game.Workspace.CurrentCamera.CFrame.Position, r4.Position, owner.values.ray_params)) * r4.Rotation
        local r5 = {}
        local r6 = r0.states.pellets:get()
        for i_0 = 1, r6 do
            local Position = r4.Position
            local r11 = r4.LookVector * 1000 + (1 - r0.accuracy.Value * (r0.red_dot and r0.red_dot.Transparency == 1 and 0.5 or 1) * math.map(i_0, 1, math.max(2, r6), 1, 0)) * get_circular_spread(r4, r0.states.spread:get() * 100)
            if r3 then r11 -= r11 * 0.75 end
            table.insert(r5, r0:ray_damage(Position, r11, {owner.values.viewmodels, owner.instance}, nil))
        end
        r0.states.shoot:fire_instant(r2, r5)
        return
    end
    r0.states.shoot:fire_instant(r2)
end
function r2.send_melee(r0) -- Line: 1588 | Name: send_melee
    r0.states.melee:fire_instant()
    local CFrame = r0.owner.values.camera:get().CFrame
    if r0.client_sided_hitscan then
        local owner = r0.owner
        r0.states.hit:fire(CFrame, r0:ray_damage(CFrame.Position - CFrame.LookVector * 0.2, CFrame.LookVector * (r0.melee_range + 0.2), {owner.values.viewmodels, owner.instance}, 0.2))
        return
    end
    r0.states.hit:fire(CFrame)
end
function r2.input_ads(r0, r1, r2) -- Line: 1607 | Name: input_ads | Upvalues: ("Data" (copy), "UI" (copy))
    r0.ads_hold = r1
    local owner = r0.owner
    if r1 and owner.values.prone_debounce then return end
    if owner and owner.values.equipped == r0 and not r0.meleeing then
        r0.owner.states.running:set(false)
        if Data.settings.toggle_aim and not r2 then
            if r1 then
                r0.states.sights:update(function(r0) -- Line: 1615
                    return not r0
                end)
                UI.get("CancelScope").Visible = r0.states.sights:get()
                return
            end
        else
            r0.states.sights:set(r1)
        end
    end
end
function r2.input_shoot(r0, r1, r2) -- Line: 1626 | Name: input_shoot | Upvalues: ("Data" (copy), "UI" (copy))
    local owner = r0.owner
    if owner and owner.values.equipped == r0 then
        if r0.safety:get() and r0.accuracy.Value < 1 or owner.states.running:get() then
        elseif not owner.values.equip_debounce:get() then
            local r4 = os.clock()
            local r5 = r0.states.firerate:get()
            if (r0.burst_left or 0) <= 0 and (not r1 or r2 and not r0.automatic) and (not r1 and r2 and not r0.automatic and r0.shoot_hold) and (r5 == 0 or 1 / (r5 / 60) < r4 - r0.last_shot) then
                if r0.states.mag:get() > 0 and r0.states.chambered:get() then
                    r0.last_shot = r4
                    r0:send_shoot()
                    if r0.burst then r0.burst_left = r0.burst - 1 end
                else
                    r0:reload(owner, false)
                end
            end
        end
    end
    if not Data.settings.auto_ads or not r2 and UI.get("ShootJoystickFrame").Visible then
        r0.shoot_hold = r1
        return
    end
    if r1 and not r0.states.sights:get() then
        r0:input_ads(true, not Data.settings.lock_auto_ads)
    else
        if r1 or UI.get("CancelScope").Visible or Data.settings.lock_auto_ads then
            r0.shoot_hold = r1
            return
        end
        r0:input_ads(false, true)
    end
    r0.shoot_hold = r1
end
function r2.hook_inputs(r0) -- Line: 1653 | Name: hook_inputs | Upvalues: ("UI" (copy), "FirstPersonInterface" (copy))
    local inputs = r0.inputs
    r0.owner.states.equipped:hook(function(r0_p89) -- Line: 1656 | Upvalues: ("r0" (copy), "inputs" (copy))
        if r0_p89 == r0.instance then
            inputs:enable()
            return
        end
        inputs:disable()
    end)
    r0.owner.values.equip_debounce:hook(function(r0_p90) -- Line: 1664 | Upvalues: ("r0" (copy))
        if r0_p90 then r0.states.sights:set(false) end
    end)
    inputs.enabled:hook(function(r0) -- Line: 1670 | Upvalues: ("UI" (upval))
        if r0 then
            UI.get("CancelScope").Visible = false
            UI.get("CancelShoot").Visible = false
        end
    end)
    inputs:get("shoot"):press(function(r0_p92) -- Line: 1677 | Upvalues: ("UI" (upval), "r0" (copy))
        if r0_p92 and UI.get("CancelShoot").Visible then
            r0.shoot_hold = false
            r0:input_shoot(false)
            UI.get("CancelShoot").Visible = false
            return
        end
        r0:input_shoot(r0_p92)
    end)
    inputs:get("shoot_joystick"):press(function(r0_p93) -- Line: 1687 | Upvalues: ("r0" (copy), "UI" (upval))
        r0:input_shoot(r0_p93, true)
        UI.get("CancelShoot").Visible = not r0.automatic and not not r0_p93
    end)
    inputs:get("aim"):press(function(r0_p94) -- Line: 1692 | Upvalues: ("r0" (copy))
        r0:input_ads(r0_p94)
    end)
    inputs:get("reload"):press(function(r0_p95) -- Line: 1699 | Upvalues: ("r0" (copy))
        local owner = r0.owner
        if r0_p95 and owner and not r0.reload_thread.running and not owner.values.equip_debounce:get() and not owner.values.prone_debounce and owner.values.equipped == r0 and owner.states.vault:get() == 0 and not owner.states.running:get() and r0.states.bullets:get() > 0 then
            local r2 = r0.states.mag:get() - (r0.cylinder and 0 or 1)
            if r2 < r0.states.mag_size:get() then
                r0.states.sights:set(false)
                r0.ads_hold = false
                r2 = owner.values.holding
                if r2 and r2.can_reload == false then
                    owner.states.holding:set(owner.values.hands, true)
                    while true do
                        if not owner.values.equip_debounce:get() and owner.values.holding ~= r2 then break end
                        owner.values.equip_debounce:wait()
                    end
                end
                r0.states.reload:fire_instant()
                if not r2 or r2.can_reload ~= false or not r0.reload_thread.running then return end
                r0.reload_thread:wait()
                task.defer(owner.values.requip_items)
            end
        end
    end)
    local r5_0, r6_0 = "Reload", "reload"
    FirstPersonInterface.setup_action(inputs, function() -- Line: 1722 | Upvalues: ("r0" (copy))
        local r0_p96 = not r0.reload_thread.running
        if r0_p96 then
            r0_p96 = not r0.cock_thread.running
            if r0_p96 then
                r0_p96 = false
                local r1 = r0.states.mag:get()
                if r1 < r0.states.mag_size:get() * 0.2 then
                    r1 = r0.states.bullets:get()
                    r0_p96 = r1 > 0
                end
            end
        end
        return r0_p96
    end, r5_0, r6_0)
end
function r2.update_ui(r0) -- Line: 1734 | Name: update_ui
    local r1 = r0.states.bullets:get()
    if r1 >= 1000 then r1 = "\226\136\158" end
    local r2 = `{r0.states.mag:get()}/{r1}`
    for r6, r7 in r0.hooked_labels do
        r7.Text = r2
    end
end
function r2.load() -- Line: 1745 | Name: load | Upvalues: ("StateObject" (copy), "r2" (copy), "State" (copy), "Event" (copy), "Globals" (copy))
    StateObject.class(r2.tag, function() -- Line: 1746 | Upvalues: ("State" (upval), "Event" (upval), "Globals" (upval))
        local r0_0 = {
            loaded = State.new(true),
            mag_size = State.new(0),
            bullets = State.new(0),
            speed = State.new(1),
            sights = State.new(false),
            reload = Event.new(),
            cock = Event.new(),
            melee = Event.new(),
            firerate = State.new(0),
            ads = State.new(0),
            reload_speed = State.new(1),
            recoil_up = State.new(1),
            recoil_side = State.new(0),
            trail_size = State.new(0),
            single_load = State.new(false),
            zoom = State.new(1),
            load_bullet = Event.new(),
            shoot = Event.new(),
            hit = Event.new(),
            spread = State.new(1),
            pellets = State.new(1),
            accuracy = State.new(1),
            mag = State.new(0),
            chambered = State.new(true)
        }
        for r4, r5_arg1 in Globals.attachment_types do
            r0_0[r5_arg1 .. "_att"] = State.new("")
        end
        return r0_0, {}
    end):hook(function(r0) -- Line: 1785
    end)
end
return r2
