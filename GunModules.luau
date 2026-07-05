--  Path: game:GetService("ReplicatedStorage").Modules.Items.Item.Gun
--UPDATED GUN MODULES 

local RunService = game:GetService("RunService");
local Parent = require(script.Parent);
local u1 = {};
u1.__index = u1;
setmetatable(u1, Parent);
u1.tag = script.Name;
u1.holster_offset = CFrame.new(0, 0, 1) * CFrame.Angles(0, 0, 1.5707963267948966);
u1.holster_part = "torso";
u1.magazine_hold_offset = CFrame.new(0.2, -2.225, 0) * CFrame.Angles(-1.5707963267948966, 0, 0);
u1.melee_range = 2.75;

if RunService:IsServer() then
    return u1;
end;

local Input = require(game.ReplicatedStorage.Modules.Input);
local StateObject = require(game.ReplicatedStorage.Modules.StateObject);
local State = require(game.ReplicatedStorage.Modules.State);
local Event = require(game.ReplicatedStorage.Modules.Event);
local Util = require(game.ReplicatedStorage.Modules.Util);
local UI = require(game.ReplicatedStorage.Modules.UI);
local Globals = require(game.ReplicatedStorage.Modules.Globals);
require(game.ReplicatedStorage.Modules.Net);
local Data = require(game.ReplicatedStorage.Modules.Data);
local Items = require(game.ReplicatedStorage.Modules.Items);
local FirstPersonInterface = require(game.ReplicatedStorage.Modules.FirstPersonInterface);
local FlagManager = require(game.ReplicatedStorage.Modules.FlagManager);
local Maid = require(game.ReplicatedStorage.Modules.Maid);
local Effects = require(game.ReplicatedStorage.Modules.Effects);
game:GetService("UserInputService");
local Animations = require(script.Animations);
local Sounds = require(script.Sounds);
u1.anim = setmetatable({}, {
    __index = function(p2, p3) -- Line: 37, Name: __index
        -- upvalues: Animations (copy), Parent (copy)
        return Animations[p3] or Parent.anim[p3];
    end
});
u1.sound = setmetatable({}, {
    __index = function(p4, p5) -- Line: 42, Name: __index
        -- upvalues: Sounds (copy), Parent (copy)
        return Sounds[p5] or Parent.sound[p5];
    end
});

function u1.init(u6) -- Line: 47
    -- upvalues: Util (copy), State (copy)
    u6.auto_shoot_dt = os.clock();
    u6.last_shot = os.clock();
    u6.shot = u6:setup_shot(u6.instance:WaitForChild("Root"):FindFirstChild("Shoot", true));
    u6.reload_thread = Util.ov(u6.reload_begin);
    u6.reload_thread:done(u6.reload_done);
    u6.reload_thread:cancelled(u6.reload_cancel);
    u6.cock_thread = Util.ov(u6.cock_begin);
    u6.cock_thread:done(u6.cock_done);
    u6.cock_thread:cancelled(u6.cock_cancel);
    u6.recoil = Util.ov(u6.recoil_function);
    u6.sights = Util.ov(u6.sights);
    u6.sights:cancelled(function() -- Line: 59
        -- upvalues: u6 (copy)
        u6.owner.values.cframes:get("arm1"):remove_offset("sights");
        u6.owner.values.cframes:get("arm2"):remove_offset("sights");
        u6.cframes:get(u6.instance.Root):remove_offset("sights");
    end);
    u6.flash = Util.ov(u6.flash);
    u6.safety_function = Util.bf(u6.safety_function);
    u6.safety = State.new(nil);
    u6:load_instance();
end;

function u1.flash(p7) -- Line: 75
    p7.shot.Flash:Emit(3);
    p7.shot.Light.Enabled = true;
    task.wait(0.05);
    p7.shot.Light.Enabled = false;
end;

function u1.set_part_pivots(u8) -- Line: 82
    -- upvalues: Util (copy)
    u8.slide = u8.instance:FindFirstChild("Slide");

    if u8.slide then
        local v9 = u8.cframes:get(u8.slide, true);
        local u10 = u8.instance.Root.CFrame:ToObjectSpace(u8.slide:GetPivot());
        v9:set_pivot("general", function() -- Line: 87
            -- upvalues: u8 (copy), u10 (copy)
            return u8.instance.Root.CFrame * u10;
        end);

        if u8.shoot_slide then
            u8.cframes:get(u8.slide):set_offset("shoot");
        end;
    end;

    u8.load_slide = u8.instance:FindFirstChild("LoadSlide") or u8.instance:FindFirstChild("Pump");

    if u8.load_slide then
        local v11 = u8.cframes:get(u8.load_slide, true);
        local u12 = u8.instance.Root.CFrame:ToObjectSpace(u8.load_slide:GetPivot());
        v11:set_pivot("general", function() -- Line: 99
            -- upvalues: u8 (copy), u12 (copy)
            return u8.instance.Root.CFrame * u12;
        end);

        if u8.shoot_slide then
            u8.cframes:get(u8.load_slide):set_offset("shoot");
        end;
    end;

    u8.hammer = u8.instance:FindFirstChild("Hammer");

    if u8.hammer then
        local v13 = u8.cframes:get(u8.hammer, true);
        local u14 = u8.instance.Root.CFrame:ToObjectSpace(u8.hammer.CFrame);
        v13:set_pivot("general", function() -- Line: 111
            -- upvalues: u8 (copy), u14 (copy)
            return u8.instance.Root.CFrame * u14;
        end);
    end;

    u8.feed_cover = u8.instance:FindFirstChild("FeedCover");

    if u8.feed_cover then
        local v15 = u8.cframes:get(u8.feed_cover, true);
        local u16 = u8.instance.Root.CFrame:ToObjectSpace(u8.feed_cover:GetPivot());
        v15:set_pivot("general", function() -- Line: 120
            -- upvalues: u8 (copy), u16 (copy)
            return u8.instance.Root.CFrame * u16;
        end);
        v15:set_offset("reload");
    end;

    u8.end_bullet = u8.instance:FindFirstChild("EndBullet");

    if u8.end_bullet then
        local v17 = u8.cframes:get(u8.end_bullet, true);
        local u18 = u8.instance.Root.CFrame:ToObjectSpace(u8.end_bullet:GetPivot());
        v17:set_pivot("general", function() -- Line: 130
            -- upvalues: u8 (copy), u18 (copy)
            return u8.instance.Root.CFrame * u18;
        end);
        v17:create_pivot("unloaded", function() -- Line: 133
            -- upvalues: u8 (copy)
            return u8.instance.Magazine.CFrame;
        end);
    end;

    u8.cylinder = u8.instance:FindFirstChild("Cylinder");

    if u8.cylinder then
        local v19 = u8.cframes:get(u8.cylinder, true);
        local u20 = u8.instance.Root.CFrame:ToObjectSpace(u8.cylinder:GetPivot());
        v19:set_pivot("general", function() -- Line: 142
            -- upvalues: u8 (copy), u20 (copy)
            return u8.instance.Root.CFrame * u20;
        end);
        v19:set_offset("reload");

        if u8.cylinder_loader then
            u8.loader = u8.cylinder_loader:Clone();
            u8.cframes:get(u8.loader.Case):set_pivot("general", function(p21) -- Line: 149
                -- upvalues: u8 (copy)
                return u8.owner.values.viewmodels.arm2.CFrame * CFrame.new(0.2, -0.7, -0.4) * CFrame.Angles(-1.5707963267948966, 0.5235987755982988, 0) * CFrame.Angles(0, 0, -0.5235987755982988);
            end);
            u8.cframes:get(u8.loader.Case):create_pivot("reload", function(p22) -- Line: 152
                -- upvalues: u8 (copy)
                return u8.instance.Cylinder:GetPivot() * CFrame.new(0, 0, 0.2);
            end);
        end;
    end;

    Util.weld_c(u8.instance.Trigger, u8.instance.Root);
    u8.magazine = u8.instance:FindFirstChild("Magazine");

    if u8.magazine then
        local v23 = u8.cframes:get(u8.magazine);
        local u24 = u8.instance.Root.CFrame:ToObjectSpace(u8.magazine:GetPivot());
        v23:set_pivot("general", function() -- Line: 169
            -- upvalues: u8 (copy), u24 (copy)
            return u8.instance.Root.CFrame * u24;
        end);
        v23:create_pivot("reload", function(p25) -- Line: 172
            -- upvalues: u8 (copy)
            return u8.owner.values.viewmodels.arm2:GetPivot() * u8.magazine_hold_offset;
        end);
    end;
end;

function u1.update_sight_lens(p26, p27) -- Line: 178
    -- upvalues: Util (copy), UI (copy)
    local v28 = p26.states.ads:get();

    if p27 then
        local CurrentCamera = workspace.CurrentCamera;
        Util.tween(CurrentCamera, TweenInfo.new(v28, Enum.EasingStyle.Linear), {
            FieldOfView = CurrentCamera:GetAttribute("OriginalFOV") / p26.states.zoom:get()
        });
        Util.tween(UI.get("RedDot").UIStroke, TweenInfo.new(0.3), {
            Transparency = 1
        });
        local ScopePart = p26.instance:FindFirstChild("ScopePart", true);

        if ScopePart then
            ScopePart:SetAttribute("OriginalMaterial", ScopePart.Material.Name);

            if ScopePart.Material ~= Enum.Material.Neon then
                ScopePart.Material = Enum.Material.Glass;
            end;

            ScopePart:SetAttribute("PreviousScopeTransparency", ScopePart.Transparency);
            ScopePart.Transparency = math.max(0.011, ScopePart.Transparency);
        end;

        local ScopeTint = p26.instance:FindFirstChild("ScopeTint", true);

        if ScopeTint then
            ScopeTint.Transparency = ScopePart == nil and 0.8 or 0.3;
        end;

        UI.hook_world_billboards("sights", function(p29) -- Line: 200
            -- upvalues: Util (ref)
            Util.tween(p29, TweenInfo.new(0.1), {
                GroupTransparency = 0.7,
                Size = UDim2.fromScale(0.9, 0.9)
            });
        end);

        return;
    end;

    local CurrentCamera = workspace.CurrentCamera;
    Util.tween(CurrentCamera, TweenInfo.new(v28, Enum.EasingStyle.Linear), {
        FieldOfView = CurrentCamera:GetAttribute("OriginalFOV")
    });
    Util.tween(UI.get("RedDot").UIStroke, TweenInfo.new(0.3), {
        Transparency = 0.5
    });
    local ScopePart = p26.instance:FindFirstChild("ScopePart", true);

    if ScopePart and ScopePart:GetAttribute("OriginalMaterial") then
        ScopePart.Material = Enum.Material[ScopePart:GetAttribute("OriginalMaterial")];
        ScopePart.Transparency = ScopePart:GetAttribute("PreviousScopeTransparency") or 0;
    end;

    local ScopeTint = p26.instance:FindFirstChild("ScopeTint", true);

    if ScopeTint then
        ScopeTint.Transparency = 1;
    end;

    UI.unhook_world_billboards("sights");

    for _, v in UI.get_world_billboards() do
        Util.tween(v, TweenInfo.new(0.1), {
            GroupTransparency = 0,
            Size = UDim2.fromScale(1, 1)
        });
    end;
end;

function u1.hook_states(u30) -- Line: 226
    -- upvalues: Globals (copy), Items (copy), Maid (copy), Util (copy), UI (copy)
    u30.offsets = {};
    u30.states.mag:hook(function(p31) -- Line: 229
        -- upvalues: u30 (copy)
        u30:update_ui();
    end);
    u30.states.bullets:hook(function(p32) -- Line: 233
        -- upvalues: u30 (copy)
        u30:update_ui();
    end);
    u30.accuracy = Instance.new("NumberValue");
    u30.states.sights:hook(function(p33, p34) -- Line: 239
        -- upvalues: u30 (copy)
        if p33 == p34 then
            return;
        end;

        if u30.owner then
            u30:sights(u30.owner, p33);
        end;
    end);
    u30.states.sights:hook(function(p35, p36) -- Line: 246
        -- upvalues: u30 (copy)
        if p35 == p36 then
            return;
        end;

        if u30.owner.values.camera:get() then
            u30:update_sight_lens(p35);
        end;
    end);
    u30.states.reload:hook_paused(function(p37, p38) -- Line: 253
        -- upvalues: u30 (copy)
        if p37 == p38 then
            return;
        end;

        if u30.owner then
            u30:reload(u30.owner, false);
        end;
    end);
    u30.states.reload:hook(function() -- Line: 260
        -- upvalues: u30 (copy)
        if u30.owner then
            u30:reload(u30.owner, true);
        end;
    end);
    u30.states.accuracy:hook(function(p39) -- Line: 266
        -- upvalues: u30 (copy)
        if u30.accuracy then
            u30.accuracy.Value = u30.states.accuracy:get() - 1;
        end;
    end);
    u30.states.cock:hook(function() -- Line: 272
        -- upvalues: u30 (copy)
        if u30.owner then
            u30:cock(u30.owner, true);
        end;
    end);
    u30.states.melee:hook(function() -- Line: 278
        -- upvalues: u30 (copy)
        if u30.owner then
            u30:melee(u30.owner);
        end;
    end);
    u30.states.shoot:hook(function(p40, p41) -- Line: 284
        -- upvalues: u30 (copy)
        if u30.owner then
            u30:shoot(u30.owner, p40, p41);
        end;
    end);
    u30.states.hit:hook(function(p42, p43) -- Line: 290
        -- upvalues: u30 (copy)
        if u30.owner then
            u30:hit(u30.owner, p42, p43);
        end;
    end);
    u30.states.loaded:hook(function(p44, p45) -- Line: 296
        -- upvalues: u30 (copy)
        if p44 == p45 or not u30.owner then
            return;
        end;

        if not p44 or (p45 ~= false or u30.states.single_load:get()) then
            if p45 then
                local BulletEject = u30.instance:FindFirstChild("BulletEject", true);
                local v46 = u30.states.mag:get();
                local u47 = math.max(0, v46 - (BulletEject and 1 or 0));
                u30.states.mag:update(function(p48) -- Line: 309
                    -- upvalues: u47 (copy)
                    return p48 - u47;
                end);
                u30.states.bullets:update(function(p49) -- Line: 312
                    -- upvalues: u47 (copy)
                    return p49 + u47;
                end);
            end;

            return;
        end;

        local v50 = u30.states.mag_size:get();
        local u51 = math.min(v50, u30.states.bullets:get());
        u30.states.mag:update(function(p52) -- Line: 300
            -- upvalues: u51 (copy)
            return p52 + u51;
        end);
        u30.states.bullets:update(function(p53) -- Line: 303
            -- upvalues: u51 (copy)
            return p53 - u51;
        end);
    end);
    u30.states.load_bullet:hook(function() -- Line: 318
        -- upvalues: u30 (copy)
        if u30.owner and u30.states.single_load:get() then
            u30.states.mag:update(function(p54) -- Line: 321
                return p54 + 1;
            end);
            u30.states.bullets:update(function(p55) -- Line: 324
                return p55 - 1;
            end);
        end;
    end);
    u30.states.chambered:hook(function(p56, p57) -- Line: 330
        -- upvalues: u30 (copy)
        if p56 == p57 then
            return;
        end;

        if u30.owner then
            u30:chamber(u30.owner, p56);
        end;
    end);

    for _, v in Globals.attachment_types do
        u30.states[v .. "_att"]:hook(function(p58, p59) -- Line: 338
            -- upvalues: Items (ref), u30 (copy)
            if p59 and (p59 ~= "" and p58 ~= p59) then
                Items.get_item_class(p59):remove(u30);
            end;

            if p58 and p58 ~= "" then
                Items.get_item_class(p58):apply(u30);
            end;
        end);
    end;

    u30.safety:hook(function(p60, p61) -- Line: 350
        -- upvalues: u30 (copy)
        if u30.owner then
            u30:safety_function(u30.owner, p60, p61);
        end;
    end);
    local u62 = Maid.new();
    u30.object:destroying(function() -- Line: 358
        -- upvalues: u62 (copy)
        u62:clean();
    end);
    u62:add(u30.owner.values.camera:hook(function(p63, p64) -- Line: 362
        -- upvalues: u30 (copy)
        if not u30.states.sights:get() then
            return;
        end;

        if p63 then
            u30:update_sight_lens(true);

            return;
        end;

        if p64 then
            u30:update_sight_lens(false);
        end;
    end).unhook);
    u62:add(u30.owner.values.camera:hook(function(p65, p66) -- Line: 371
        -- upvalues: u30 (copy), Util (ref), UI (ref)
        if not u30.states.sights:get() then
            return;
        end;

        if p65 ~= game.Workspace.CurrentCamera then
            if p65 == nil and p66 == game.Workspace.CurrentCamera then
                local CurrentCamera = workspace.CurrentCamera;
                Util.tween(CurrentCamera, TweenInfo.new(0, Enum.EasingStyle.Linear), {
                    FieldOfView = CurrentCamera:GetAttribute("OriginalFOV")
                });
            end;

            return;
        end;

        Util.tween(UI.get("RedDot").UIStroke, TweenInfo.new(0), {
            Transparency = 1
        });
        local CurrentCamera = workspace.CurrentCamera;
        Util.tween(CurrentCamera, TweenInfo.new(0, Enum.EasingStyle.Linear), {
            FieldOfView = CurrentCamera:GetAttribute("OriginalFOV") / u30.states.zoom:get()
        });
    end).unhook);
end;

function u1.running(p67, p68, p69) -- Line: 386
    local v70 = p68.values.cframes:get("arms"):get_offset("run");

    if not p69 then
        p67:running_pivots(p68, false);
        p67.anim.Run.base(v70).Completed:Wait();
        p68.values.cframes:get("arms"):remove_offset("run");

        return;
    end;

    p67:running_pivots(p68, true);
    p67.states.sights:set(false);
    p67:reload(p68, false);
    p68.values.cframes:get("arms"):set_offset("run");
    p67.anim.Run.run_offset(v70);
end;

function u1.sights(u71, p72, p73) -- Line: 403
    -- upvalues: Data (copy), Input (copy), Util (copy), UI (copy)
    u71.sound.Handle(u71.instance.Root);
    local v74 = p72.values.cframes:get("arm1"):get_offset("sights");
    local v75 = p72.values.cframes:get("arm2"):get_offset("sights");
    local v76 = u71.cframes:get(u71.instance.Root):get_offset("sights");
    local v77 = u71.states.ads:get();

    if p73 then
        local v78 = false;

        if p72.values.holding and p72.values.holding.safety then
            if p72.values.holding.states.ads then
                v77 = v77 + p72.values.holding.states.ads:get();
            end;

            if p72.states.holding:get() == p72.values.holding.instance then
                p72.values.holding.safety:set(true);
                v78 = true;
            end;
        end;

        u71:reload(p72, false);
        p72.values.cframes:get("arm1"):set_offset("sights");

        if not v78 then
            p72.values.cframes:get("arm2"):set_offset("sights");
        end;

        u71.anim.Equip.arm1_hold(p72.values.cframes:get("arm1"):set_absolute("sights", true), u71, v77);
        u71.cframes:get(u71.instance.Root):set_offset("sights");
        u71.anim.Sight.arm1(v74, u71.instance, v77);
        u71.anim.Sight.arm2(v75, u71.instance, v77);
        u71.anim.Sight.gun(v76, u71.instance, v77);

        if p72.values.camera:get() then
            if u71.inputs and u71.inputs.enabled:get() then
                local v79 = `camera_sensitivity_{string.gsub(tostring(u71.states.zoom:get()), "[.]", "_")}`;

                if Data.settings[v79] then
                    Input.mouse_base_sensitivity:set(Util.map_sensitivity(Data.settings[v79]));
                    task.spawn(function() -- Line: 456
                        -- upvalues: u71 (copy), Input (ref), Util (ref), Data (ref)
                        while u71.states.sights:get() do
                            u71.states.sights:wait();
                        end;

                        Input.mouse_base_sensitivity:set(Util.map_sensitivity(Data.settings.camera_sensitivity));
                    end);
                end;
            end;

            Util.tween(u71.accuracy, TweenInfo.new(v77, Enum.EasingStyle.Linear), {
                Value = 1
            });
        end;
    else
        p72.values.cframes:get("arm1"):remove_absolute("sights");

        if p72.values.holding and (p72.values.holding.safety and not p72.values.equip_debounce:get()) then
            p72.values.holding.safety:set(false);

            if p72.values.holding.states.ads then
                v77 = v77 + p72.values.holding.states.ads:get();
            end;
        end;

        if p72.values.camera:get() then
            Util.tween(u71.accuracy, TweenInfo.new(v77, Enum.EasingStyle.Linear), {
                Value = u71.states.accuracy:get() - 1
            });
        end;

        if u71.inputs and u71.inputs.enabled:get() then
            UI.get("CancelScope").Visible = false;
        end;

        u71.anim.Sight.base(v74, u71.instance, v77);
        u71.anim.Sight.base(v75, u71.instance, v77);
        u71.anim.Sight.base(v76, u71.instance, v77).Completed:Wait();
        p72.values.cframes:get("arm1"):remove_offset("sights");
        p72.values.cframes:get("arm2"):remove_offset("sights");
        u71.cframes:get(u71.instance.Root):remove_offset("sights");
    end;
end;

function u1.reload(p80, p81, p82) -- Line: 512
    if p82 then
        p80.reload_thread(p80, p81, p82);

        return;
    end;

    p80.reload_thread:cancel(p80, p81, p82);
end;

function u1.cock(p83, p84, p85) -- Line: 520
    if not p85 then
        p83.cock_thread:cancel(p83, p84, p85);

        return;
    end;

    p83:reload(p84, false);
    p83.cock_thread(p83, p84, p85);
end;

function u1.chamber(p86, p87, p88) -- Line: 529
    if p86.slide then
        local v89 = p86.cframes:get(p86.slide):get_offset("shoot");

        if p88 then
            p86.anim.Gun.slide_off(v89);
        else
            p86.anim.Gun.slide_on(v89).Completed:Wait();
        end;
    end;

    if not p86.states.single_load:get() then
        if p88 then
            p86.sound.Reload4(p86.instance.Root);

            return;
        end;

        p86.sound.Empty(p86.instance.Root);
    end;
end;

function u1.render(p90, p91, p92) -- Line: 547
    p90.instance.Root:PivotTo(p90.cframes:get(p90.instance.Root):render(p92));

    if p90.hammer then
        p90.hammer:PivotTo(p90.cframes:get(p90.hammer):render(p92));
    end;

    if p90.feed_cover then
        p90.feed_cover:PivotTo(p90.cframes:get(p90.feed_cover):render(p92));
    end;

    if p90.slide then
        p90.slide:PivotTo(p90.cframes:get(p90.slide):render(p92));
    end;

    if p90.load_slide then
        p90.load_slide:PivotTo(p90.cframes:get(p90.load_slide):render(p92));
    end;

    if p90.magazine then
        p90.magazine:PivotTo(p90.cframes:get(p90.magazine):render(p92));
    elseif p90.cylinder then
        p90.cylinder:PivotTo(p90.cframes:get(p90.cylinder):render(p92));

        if p90.loader and p90.loader.Parent == p91.values.viewmodels then
            p90.loader.Case:PivotTo(p90.cframes:get(p90.loader.Case):render(p92));
        end;
    end;

    if p90.end_bullet then
        p90.end_bullet:PivotTo(p90.cframes:get(p90.end_bullet):render(p92));
    end;

    if p90.charm_model and p90.charm_model.PrimaryPart then
        p90.charm_model.PrimaryPart:PivotTo(p90.cframes:get(p90.charm_model.PrimaryPart):render(p92));
    end;

    if p90.inputs and p90.inputs.enabled:get() then
        p90:input_render(p92);
    end;
end;

function u1.auto_shoot_check(p93, p94) -- Line: 590
    -- upvalues: UI (copy), Util (copy), StateObject (copy)
    local v95 = os.clock();

    if v95 - p93.auto_shoot_dt > 0.25 then
        p93.auto_shoot_dt = v95;

        if UI.get("Flash").Frame.BackgroundTransparency == 0 then
            return;
        end;

        local owner = p93.owner;
        local v96 = p93:get_shoot_look();
        local v97 = CFrame.new(Util.validate_position(game.Workspace.CurrentCamera.CFrame.Position, v96.Position, owner.values.ray_params)) * v96.Rotation;

        for _, v in p93:ray_damage(v97.Position, v97.LookVector * 500, { owner.values.viewmodels, owner.instance }, nil, true) do
            local Instance2 = v.Instance;

            if v.HitHum then
                p93:input_shoot(true);

                return;
            end;

            if Instance2 and Instance2.Transparency < 1 then
                local v98 = Util.get_breakable_instance(Instance2);

                if v98 and Util.ownership(StateObject.get("Breakable", v98).owner:get()) == 0 then
                    p93:input_shoot(true);

                    return;
                end;
            end;
        end;

        if p93.shoot_hold and not (p93.inputs:get("shoot"):holding() or p93.inputs:get("shoot_joystick"):holding()) then
            p93:input_shoot(false);
        end;
    end;
end;

function u1.input_render(p99, p100) -- Line: 629
    -- upvalues: Data (copy)
    local owner = p99.owner;

    if owner.values.prone_debounce or (owner.values.equip_debounce:get() or owner.states.vault:get() > 0) then
        p99:reload(owner, false);
        p99:cock(owner, false);
    elseif not p99.cock_thread.running and (not p99.reload_thread.running and (not p99.states.chambered:get() and (not owner.values.equip_debounce:get() and (not p99.states.reload:get() and (owner.states.vault:get() == 0 and (p99.states.loaded:get() and p99.states.mag:get() > 0)))))) then
        p99.states.cock:fire_instant();
    end;

    local _ = owner.values.viewmodels.head;

    if not Data.settings.toggle_aim then
        if p99.ads_hold and not (p99.reload_thread.running or (p99.meleeing or (owner.states.running:get() or (owner.values.prone_debounce or owner.values.equip_debounce:get())))) then
            p99.states.sights:set(true);
        else
            p99.states.sights:set(false);
        end;
    end;

    if p99.automatic and (p99.shoot_hold and p99.burst == nil or p99.burst_left and p99.burst_left > 0) and ((not p99.safety:get() or p99.accuracy.Value >= 1) and not (owner.values.equip_debounce:get() or owner.states.running:get())) then
        local v101 = os.clock();
        local v102 = p99.states.firerate:get();

        if v102 == 0 or v101 - p99.last_shot > 1 / (v102 / 60) then
            if p99.states.mag:get() > 0 and p99.states.chambered:get() then
                p99.last_shot = v101;
                p99:send_shoot();

                if p99.burst_left then
                    p99.burst_left = p99.burst_left - 1;
                end;
            else
                p99.burst_left = 0;
            end;
        end;
    end;

    if p99.states.reload:get() and owner.values.equip_debounce:get() then
        p99:reload(owner, false);
    end;
end;

function u1.kickback(p103, p104) -- Line: 678
    local v105 = p104.values.cframes:get("arms"):set_offset("shoot");
    p103.anim.Shoot.key1(v105).Completed:Wait();
    p103.anim.Shoot.key2(v105).Completed:Wait();
    p103.anim.Shoot.key3(v105).Completed:Wait();
    p104.values.cframes:get("arms"):remove_offset("shoot");
end;

function u1.recoil_function(p106, p107) -- Line: 689
    -- upvalues: Input (copy), Util (copy)
    p107.values.cframes:get("camera"):remove_offset("shoot");
    local v108 = p107.values.cframes:get("camera"):set_offset("shoot");
    local Value = v108.Value;

    if p107.values.camera:get() then
        local values = p107.values;
        values.old_cam_render = values.old_cam_render * Value:Inverse();
    end;

    local v109 = p106.states.recoil_up:get();
    local v110 = p106.states.recoil_side:get();

    if Input.current_device:get() ~= "pc" then
        v109 = v109 * 0.7;
        v110 = v110 * 0.7;
    end;

    if p106.prone_recoil and p107.states.walk_state:get() == "prone" then
        v109 = v109 * p106.prone_recoil;
        v110 = v110 * p106.prone_recoil;
    end;

    Util.tween(v108, TweenInfo.new(0), {
        Value = CFrame.new()
    });
    v108.Value = CFrame.new();

    if p107.values.cframes:get("arm2"):current_pivot() == "equipped" then
        v109 = v109 * 0.8;
    else
        v110 = v110 * 1.2;
    end;

    local Angles = CFrame.Angles;
    local v111 = Util.rand(v109 * 1, v109 * 2);
    local v112 = math.rad(v111);
    local v113 = Util.rand(-v110 * 1, v110 * 1);
    local v114 = Angles(v112, math.rad(v113), 0);
    local v115 = math.exp((v109 + v110) / 30);
    local v116 = 60 / p106.states.firerate:get();
    local v117 = math.min(0.1, v116);
    local v118 = math.max(v117, v115 * 0.06);
    Util.tween(v108, TweenInfo.new(v118, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Value = v114
    }).Completed:Wait();
    Util.tween(v108, TweenInfo.new(v115 * 0.24, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Value = CFrame.new()
    }).Completed:Wait();
end;

function u1.shoot(u119, u120, p121, p122) -- Line: 728
    u119.states.mag:update(function(p123) -- Line: 729
        return math.max(0, p123 - 1);
    end);

    if u119.states.firerate:get() == 0 then
        u119.states.chambered:set(false);
    else
        local BulletEject = u119.instance:FindFirstChild("BulletEject", true);

        if BulletEject then
            u119:eject_bullet(BulletEject, u119.bullet_type);
        end;
    end;

    if u119.supressed then
        u119.sound.SilencedShoot(u119.shot);
    else
        u119.sound.Shoot(u119.shot);
    end;

    u119:reload(u120, false);
    local v124 = u119.states.pellets:get() > 1;

    if u119.owner.values.camera:get() == nil and (not v124 and (p122 and #p122 > 0)) then
        for _, v in p122 do
            if #v > 0 then
                u119:trail(u119.shot.CFrame.Position, v[#v].Position);
            end;
        end;
    end;

    task.spawn(function() -- Line: 755
        -- upvalues: u119 (copy), u120 (copy)
        u119:kickback(u120);
    end);

    if u120.values.camera:get() then
        u119.recoil(u119, u120);
    end;

    task.spawn(function() -- Line: 761
        -- upvalues: u119 (copy)
        local Smoke = u119.shot:FindFirstChild("Smoke");

        if Smoke then
            for _ = 1, 3 do
                Smoke:Emit(1);
                task.wait(0.1);
            end;
        end;
    end);

    if u119.shot:FindFirstChild("Flash") then
        u119:flash();
    end;

    if u119.states.firerate:get() > 0 then
        task.spawn(u119.slide_shoot, u119);
    end;

    if u119.hammer then
        task.spawn(function() -- Line: 777
            -- upvalues: u119 (copy)
            local v125 = u119.cframes:get(u119.hammer):set_offset("shoot");
            u119.anim.Gun.hammer_on(v125).Completed:Wait();
            u119.anim.Gun.hammer_off(v125).Completed:Wait();
            u119.cframes:get(u119.hammer):remove_offset("shoot");
        end);
    end;

    if p122 then
        u119:bullet_hit(u120, p122);
    end;
end;

function u1.bullet_hit(p126, p127, p128) -- Line: 796
    -- upvalues: Util (copy), Effects (copy), Maid (copy), StateObject (copy)
    for _, v in p128 do
        if #v ~= 0 then
            local v129 = {};

            for _, v2 in v do
                local Instance2 = v2.Instance;

                if Instance2 ~= nil then
                    if Instance2:HasTag("Water") and not Instance2.CanCollide then
                        local Position = v2.Position;
                        local Attachment = Instance.new("Attachment");
                        Util.debris(Attachment, 2);
                        local v130 = math.min(Instance2.Size.X, Instance2.Size.Y, Instance2.Size.Z);
                        Attachment.WorldCFrame = CFrame.new(Position.X, Instance2.CFrame.Y + v130 * 0.5, Position.Z);
                        Attachment.Parent = game.Workspace.Terrain;
                        Effects.Ring(Attachment);
                        Effects.Splash(Attachment, 3, Instance2);
                        Effects.WaterSplash(Attachment);
                    elseif v2.HitHum and (Instance2.Parent and not v129[Instance2.Parent]) then
                        v129[Instance2.Parent] = true;
                        local Attachment = Instance.new("Attachment");
                        Attachment.Parent = game.Workspace.Terrain;
                        Attachment.WorldCFrame = CFrame.new(v2.Position) * CFrame.lookAt(Vector3.new(0, 0, 0), v2.Normal);
                        Util.debris(Attachment, 1);
                        p126:emit_blood(Attachment, Instance2.Color);
                        p126.sound.BulletHit(Attachment);
                    end;
                end;
            end;

            local v131 = v[#v];

            if v131 then
                local Instance2 = v131.Instance;
                local Normal = v131.Normal;
                local Position = v131.Position;

                if not v131.HitHum and (Instance2 and (Instance2.Transparency < 1 and Instance2.Anchored)) then
                    local u132 = Effects.create_point(Position, Normal, math.random(8, 12));
                    local u133 = Util.get_breakable_instance(Instance2);

                    if u133 then
                        local u134 = Maid.new();
                        u134:add(StateObject.get("Breakable", u133).states.destroyed:hook(function(p135) -- Line: 838
                            -- upvalues: u132 (copy)
                            if p135 then
                                task.defer(function() -- Line: 840
                                    -- upvalues: u132 (ref)
                                    u132:Destroy();
                                end);
                            end;
                        end).unhook);
                        u134:add(u133.AncestryChanged:Connect(function() -- Line: 846
                            -- upvalues: u133 (copy), u132 (copy)
                            if u133.Parent == nil or u133.Parent == game.ReplicatedStorage.Garbage then
                                task.defer(function() -- Line: 848
                                    -- upvalues: u132 (ref)
                                    u132:Destroy();
                                end);
                            end;
                        end));
                        u132.Destroying:Connect(function() -- Line: 854
                            -- upvalues: u134 (copy)
                            u134:clean();
                        end);
                    end;

                    local v136 = script.BulletHoles.Normal:Clone();
                    v136.Parent = u132;
                    v136.Color = ColorSequence.new(Instance2.Color);
                    v136:Emit(2);
                end;
            end;
        end;
    end;
end;

function u1.slide_shoot(p137) -- Line: 868
    if p137.slide then
        local v138 = p137.cframes:get(p137.slide):get_offset("shoot");
        p137.anim.Gun.slide_on(v138).Completed:Wait();

        if p137.states.mag:get() > 0 then
            p137.anim.Gun.slide_off(v138).Completed:Wait();
        end;

        if p137.states.mag:get() == 0 then
            p137.states.chambered:set(false);
        end;
    elseif p137.load_slide then
        local v139 = p137.cframes:get(p137.load_slide):get_offset("shoot");
        p137.anim.Gun.slide_on(v139).Completed:Wait();
        p137.anim.Gun.slide_off(v139).Completed:Wait();

        if p137.states.mag:get() == 0 then
            p137.states.chambered:set(false);
        end;
    end;
end;

function u1.melee(p140, p141, p142) -- Line: 888
    p140:reload(p141, false);
    p140:cock(p141, false);
    p140.meleeing = true;
    local v143 = p141.values.cframes:get("arm1"):set_absolute("melee", true);
    local v144 = nil;

    if p140.anim.Melee.arm2_hold then
        local v145 = p141.values.cframes:get("arm2"):set_absolute("melee", true);
        p140.anim.Melee.arm2_hold(v145);
    else
        p141.values.cframes:get("arm2"):set_absolute("melee", CFrame.new());
        p141.values.cframes:get("arm2"):set_pivot("base");
    end;

    if p140.anim.Melee.gun_hold then
        v144 = p140.cframes:get(p140.instance.Root):set_absolute("melee", true);
        p140.anim.Melee.gun_hold(v144);
    end;

    p140.sound.Handle(p140.instance.Root);
    p140.anim.Melee.arm1_hold(v143).Completed:Wait();
    p141.values.cframes:get("arm1"):remove_absolute("melee");
    p141.values.cframes:get("arm2"):remove_absolute("melee");

    if not p140.anim.Melee.arm2_hold then
        p141.values.cframes:get("arm2"):remove_pivot("base");
    end;

    if v144 then
        p140.cframes:get(p140.instance.Root):remove_absolute("melee");
    end;
end;

function u1.hit(p146, p147, p148, p149) -- Line: 917
    local v150 = p147.values.cframes:get("arm1"):set_absolute("melee");
    local v151 = nil;
    local v152;

    if p146.anim.Melee.arm2_hit then
        v152 = p147.values.cframes:get("arm2"):set_absolute("melee");
    else
        v152 = nil;
    end;

    if p146.anim.Melee.gun_hit then
        v151 = p146.cframes:get(p146.instance.Root):set_absolute("melee");
    end;

    if p146:process_hit_results(p148, p149) then
        p146.sound.Swing(p146.instance.Root);

        if v151 then
            p146.anim.Melee.gun_miss(v151);
        end;

        if v152 then
            p146.anim.Melee.arm2_miss(v152);
        end;

        p146.anim.Melee.arm1_miss(v150).Completed:Wait();
    else
        if v151 then
            p146.anim.Melee.gun_hit(v151);
        end;

        if v152 then
            p146.anim.Melee.arm2_hit(v152);
        end;

        p146.anim.Melee.arm1_hit(v150).Completed:Wait();
    end;

    p147.values.cframes:get("arm1"):remove_absolute("melee");

    if v152 then
        p147.values.cframes:get("arm2"):remove_absolute("melee");
    end;

    if v151 then
        p146.cframes:get(p146.instance.Root):remove_absolute("melee");
    end;

    p146.meleeing = false;
end;

function u1.safety_function(p153, p154, p155, p156) -- Line: 958
    local v157 = p154.values.cframes:get("arm1"):get_absolute("equipped");
    local v158 = p154.values.cframes:get("arm2"):get_absolute("equipped");

    if p155 == true then
        p153.anim.Equip.arm1_hold_safety(v157);

        if p156 == false then
            p154.values.cframes:get("arm2"):remove_pivot("equipped");
            p154.values.cframes:get("arm2"):remove_absolute("equipped");
        end;
    elseif p155 == false then
        p154.values.cframes:get("arm2"):set_absolute("equipped", true);
        p154.values.cframes:get("arm2"):set_pivot("equipped");
        p153.anim.Equip.arm2_hold(v158, p153);
        p153.anim.Equip.arm1_hold(v157, p153).Completed:Wait();
    end;
end;

function u1.equip(p159, p160, p161) -- Line: 977
    local v162 = p160.values.cframes:get("arm1"):get_absolute("equipped");
    p160.values.cframes:get("arm2"):get_absolute("equipped");
    local Root = p159.instance:FindFirstChild("Root");

    if Root == nil then
        return;
    end;

    if p161 == true then
        p159:unholster(p160);
        p160.values.cframes:get("arm1"):set_absolute("equipped", true);
        p159.anim.Equip.arm1_grab(v162).Completed:Wait();
        p159.sound.Equip(Root);
        p159.cframes:get(Root):set_pivot("equipped");
        p159.cframes:get(Root).pivot_time = 0.2;
        p160.values.cframes:get("arm1"):set_pivot("equipped");
        local safety = p159.safety;
        local holding = p160.values.holding;

        if holding then
            if p160.states.holding:get() == p160.values.holding.instance then
                holding = p160.values.holding.loadout_type == "primary";
            else
                holding = false;
            end;
        end;

        safety:set_instant(holding);

        return;
    end;

    p159.states.sights:set(false);
    p159:reload(p160, false);
    p159:cock(p160, false);
    p159.sound.Handle(Root);
    p160.values.cframes:get("arm1"):remove_pivot("equipped");

    if p159.safety:get() == false then
        p160.values.cframes:get("arm2"):remove_pivot("equipped");
        p160.values.cframes:get("arm2"):remove_absolute("equipped");
    end;

    p159.safety:set_instant(nil);

    if p160.values.holding and p160.values.holding.safety then
        p160.values.holding.safety:set(false);
    end;

    p159.anim.Equip.arm1_grab(v162).Completed:Wait();
    p159.cframes:get(Root).pivot_time = 0.2;
    p159.cframes:get(Root):remove_pivot("equipped");
    p160.values.cframes:get("arm1"):remove_absolute("equipped");
    p159:holster(p160);
end;

function u1.trail(p163, p164, p165, p166) -- Line: 1029
    -- upvalues: Util (copy)
    local Attachment = Instance.new("Attachment");
    local Attachment2 = Instance.new("Attachment");
    Util.debris(Attachment, 0.5);
    Util.debris(Attachment2, 0.5);
    Attachment.Parent = workspace.Terrain;
    Attachment2.Parent = workspace.Terrain;
    Attachment.Position = p164;
    Attachment2.Position = p165;
    local Beam = Instance.new("Beam", game.Workspace);
    Util.debris(Beam, 0.5);
    Beam.Width0 = p163.states.trail_size:get() or 0.1;
    Beam.Width1 = p163.states.trail_size:get() or 0.1;
    Beam.Attachment0 = Attachment;
    Beam.Attachment1 = Attachment2;

    if p163.supressed then
        Beam.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.95) });
    else
        Beam.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.75) });
    end;

    Util.tween(Beam, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0, false, 0), {
        Width0 = 0,
        Width1 = 0
    });

    if p163.owner.values.camera:get() == nil then
        local Attachment3 = Instance.new("Attachment");
        Util.debris(Attachment3, 0.5);
        Attachment3.Parent = workspace.Terrain;
        Attachment3.WorldCFrame = CFrame.new(Util.closest_point_on_segment(game.Workspace.CurrentCamera.CFrame.Position, Attachment.WorldCFrame.Position, Attachment2.WorldCFrame.Position));
        local Magnitude = (p164 - p165).Magnitude;
        p163.sound.BulletWoosh(Attachment3).Volume = math.min(1, Magnitude / 50) * 0.5;
    end;
end;

local u167 = Util.create_debris_queue("casings", 16, 5);

function u1.eject_bullet(p168, p169, p170, p171) -- Line: 1076
    -- upvalues: Data (copy), u167 (copy), Effects (copy)
    if not Data.settings or Data.settings.debris then
        local v172 = script.Bullets[p170]:Clone();
        v172.Parent = workspace;
        v172.CanCollide = true;
        v172:PivotTo(p169.WorldCFrame);
        v172.AssemblyLinearVelocity = p169.WorldCFrame.RightVector * math.random(8, 12) + p169.WorldCFrame.UpVector * math.random(8, 12);
        v172.CastShadow = false;
        v172.CanQuery = false;
        u167:add_item(v172);
        Effects.mark_for_killcam(v172);

        return v172;
    end;
end;

function u1.setup_shot(p173, p174) -- Line: 1096
    -- upvalues: Util (copy)
    local v175 = script.Shot:Clone();
    v175.Flash.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.3), NumberSequenceKeypoint.new(1, 0.3) });
    v175.Parent = p174.Parent;
    v175.CFrame = p174.WorldCFrame;
    Util.weld_c(v175, p174.Parent);

    return v175;
end;

function u1.reload_begin(u176, u177) -- Line: 1108
    -- upvalues: Util (copy)
    u176.sound.Handle(u176.instance.Root);
    u176.safety:set(false);
    local v178 = u177.values.cframes:get("arm1"):set_absolute("reload", true);
    local v179 = u177.values.cframes:get("arm2"):set_absolute("reload", true);
    local v180 = u176.cframes:get(u176.instance.Root):set_absolute("reload", true);
    local v181 = u176.states.reload_speed:get();
    local v182 = false;

    if u176.feed_cover then
        u176.anim.Reload.arm2_empty1(v179, v181);
        u176.anim.Reload.gun_empty1(v180, v181);
        u176.anim.Reload.arm1_empty1(v178, v181).Completed:Wait();
        local v183 = u176.cframes:get(u176.feed_cover):get_offset("reload");
        u176.sound.FeedOpen(u176.instance.Root);
        Util.tween(v183, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            Value = CFrame.Angles(0, -0.5235987755982988, 0)
        });
        u176.anim.Reload.arm2_empty2(v179, v181).Completed:Wait();

        if u176.states.loaded:get() and not u176.states.single_load:get() then
            u176.anim.Reload.arm1_start(v178, v181);
            u176.anim.Reload.gun(v180, v181);
            u176.anim.Reload.arm2_start(v179, v181).Completed:Wait();

            if u176.magazine then
                if u176.end_bullet then
                    u176.cframes:get(u176.end_bullet):set_pivot("unloaded");
                end;

                u176.cframes:get(u176.magazine):set_pivot("reload");
                u176.sound.Reload1(u176.instance.Root);
                u176.states.loaded:set(false);
                v182 = true;
            end;
        else
            u176.anim.Reload.gun(v180, v181);
        end;
    elseif u176.cylinder then
        u176.anim.Reload.arm1_start(v178, v181);
        u176.anim.Reload.gun(v180, v181);
        u176.anim.Reload.arm2_start(v179, v181).Completed:Wait();
        local v184 = u176.cframes:get(u176.cylinder):get_offset("reload");
        u176.sound.Reload1(u176.instance.Root);
        u176.anim.Reload.cylinder_open(v184, v181);

        if u176.states.loaded:get() then
            if u176.anim.Reload.arm1_empty1 then
                u176.anim.Reload.arm2_empty1(v179, v181);
                u176.anim.Reload.arm1_empty1(v178, v181).Completed:Wait();
            end;

            if u176.cylinder:FindFirstChild("Eject") then
                for _ = 1, u176.states.mag_size:get() do
                    u176:eject_bullet(u176.cylinder.Eject, u176.bullet_type, CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966));
                end;

                u176.sound.Cases(u176.instance.Root);
            end;

            u176.states.loaded:set(false);
            v182 = true;

            if u176.anim.Reload.arm1_empty2 then
                u176.anim.Reload.arm2_empty2(v179, v181);
                u176.anim.Reload.arm1_empty2(v178, v181).Completed:Wait();
            end;
        end;
    elseif u176.states.loaded:get() and not u176.states.single_load:get() then
        u176:cock(u177, false);
        u176.anim.Reload.arm1_start(v178, v181);
        u176.anim.Reload.gun(v180, v181);
        u176.anim.Reload.arm2_start(v179, v181).Completed:Wait();

        if u176.magazine then
            if u176.end_bullet then
                u176.cframes:get(u176.end_bullet):set_pivot("unloaded");
            end;

            u176.cframes:get(u176.magazine):set_pivot("reload");
            u176.sound.Reload1(u176.instance.Root);
            u176.states.loaded:set(false);
            v182 = true;
        end;
    else
        u176.anim.Reload.gun(v180, v181);
    end;

    local v185 = u176.states.mag_size:get() - u176.states.mag:get();
    local v186 = u176.states.chambered:get() and not u176.cylinder and 1 or 0;
    local v187 = math.min(v185 + v186, u176.states.bullets:get());

    if v187 > 0 then
        u176:cock(u177, false);
    end;

    for i = 1, v187 do
        u176.anim.Reload.arm1_idle1(v178, v181);

        if v182 and u176.anim.Reload.arm2_start2 then
            u176.anim.Reload.arm2_start2(v179, v181).Completed:Wait();
        end;

        u177.values.cframes:get("arm2"):set_pivot("reload");
        u176.anim.Reload.base(v179, v181);

        if u176.anim.Reload.gun_idle then
            u176.anim.Reload.gun_idle(v180, v181);
        end;

        if u176.states.single_load:get() then
            task.wait(0.15 * v181);
            u176.single_bullet = script.Bullets[u176.bullet_load_type or u176.bullet_type]:Clone();
            u176.single_bullet.Parent = u177.values.viewmodels;
            u176.single_bullet.CanCollide = false;
            u176.single_bullet:PivotTo(u177.values.viewmodels.arm2.CFrame * u176.hold_bullet_offset);
            Util.weld_c(u176.single_bullet, u177.values.viewmodels.arm2);
        else
            task.wait(0.5 * v181);

            if u176.cylinder and u176.loader then
                u176.loader.Bullets.Transparency = 0;
                u176.loader.Parent = u177.values.viewmodels;
                u176.loader.Case:PivotTo(u176.cframes:get(u176.loader.Case):render(0.016666666666666666));
            end;
        end;

        u177.values.cframes:get("arm2"):remove_pivot("reload");
        u176.anim.Reload.arm1_idle2(v178, v181);
        u176.anim.Reload.arm2_idle(v179, v181).Completed:Wait();

        if u176.magazine then
            u176.cframes:get(u176.magazine):remove_pivot("reload");
            u176.magazine.Transparency = 0;
            u176.sound.Reload2(u176.instance.Root);

            if u176.feed_cover then
                u176.anim.Reload.arm2_finish(v179, v181);
                u176.anim.Reload.arm1_finish(v178, v181).Completed:Wait();
                u176.sound.Chains(u176.instance.Root);

                if u176.end_bullet then
                    u176.cframes:get(u176.end_bullet):remove_pivot("unloaded");
                    u176.end_bullet.Transparency = 0;

                    for _, child in u176.end_bullet:GetChildren() do
                        if child:IsA("BasePart") then
                            child.Transparency = 0;
                        end;
                    end;
                end;

                u176.anim.Reload.arm2_empty1_2(v179, v181);
                u176.anim.Reload.arm1_empty1(v178, v181).Completed:Wait();
                u176.states.loaded:set(true);
                u176.anim.Reload.gun_empty1(v180, v181);
                u176.anim.Reload.arm2_empty2(v179, v181).Completed:Wait();
                local v188 = u176.cframes:get(u176.feed_cover):get_offset("reload");
                u176.sound.FeedClose(u176.instance.Root);
                Util.tween(v188, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Value = CFrame.Angles(0, 0, 0)
                });
                u176.anim.Reload.arm2_empty1_3(v179, v181).Completed:Wait();
            else
                u176.states.loaded:set(true);
                u176.anim.Reload.arm2_finish(v179, v181);
                u176.anim.Reload.arm1_finish(v178, v181).Completed:Wait();
            end;
        elseif u176.states.single_load:get() then
            u176.sound.Reload2(u176.instance.Root);
            u176.single_bullet:Destroy();

            if not u176.cylinder then
                u176.states.loaded:set(true);
                u176.states.load_bullet:fire();
            end;

            u176.anim.Reload.arm2_finish(v179, v181);
            u176.anim.Reload.arm1_finish(v178, v181).Completed:Wait();

            if u176.cylinder then
                u176.states.loaded:set(true);
                u176.states.load_bullet:fire();
            end;

            if u176.cylinder and (i == v187 or (u176.states.mag:get() >= u176.states.mag_size:get() or u176.states.bullets:get() <= 0)) then
                if u176.loader then
                    u176.anim.Reload.arm1_start(v178, v181);
                    u176.anim.Reload.gun(v180, v181);
                    u176.anim.Reload.arm2_start(v179, v181).Completed:Wait();
                    u176.sound.Reload1(u176.instance.Root);
                    local v189 = u176.cframes:get(u176.cylinder):get_offset("reload");
                    u176.anim.Reload.cylinder_close(v189, v181);

                    return;
                end;

                u176.anim.Reload.gun(v180, v181);

                if u176.anim.Reload.arm1_empty2 then
                    u176.anim.Reload.arm2_empty2(v179, v181);
                    u176.anim.Reload.arm1_empty2(v178, v181).Completed:Wait();
                end;

                if u176.anim.Reload.arm1_empty1 then
                    u176.anim.Reload.arm2_empty1(v179, v181);
                    u176.anim.Reload.arm1_empty1(v178, v181).Completed:Wait();
                end;

                u176.sound.Reload1(u176.instance.Root);
                local v190 = u176.cframes:get(u176.cylinder):get_offset("reload");
                u176.anim.Reload.cylinder_close(v190, v181);

                return;
            end;
        elseif u176.cylinder and u176.loader then
            u176.sound.Reload2(u176.instance.Root);
            u176.cframes:get(u176.loader.Case):set_pivot("reload");
            u176.anim.Reload.arm2_finish(v179, v181);
            u176.anim.Reload.arm1_finish(v178, v181).Completed:Wait();
            u176.cframes:get(u176.loader.Case):remove_pivot("reload");
            u176.loader.Bullets.Transparency = 1;
            u176.states.loaded:set(true);
            u177.values.cframes:get("arm2"):set_pivot("reload");
            local v191 = u176.anim.Reload.base(v179, v181);
            v191.Completed:Connect(function() -- Line: 1334
                -- upvalues: u176 (copy), u177 (copy)
                if u176.loader then
                    u176.loader.Parent = nil;
                    u176.cframes:get(u176.loader.Case):remove_pivot("reload");
                end;

                u177.values.cframes:get("arm2"):remove_pivot("reload");
            end);

            if u176.anim.Reload.arm1_end1 then
                u176.anim.Reload.gun(v180, v181);
                u176.anim.Reload.arm1_end1(v178, v181).Completed:Wait();
                u176.sound.Reload1(u176.instance.Root);
                local v192 = u176.cframes:get(u176.cylinder):get_offset("reload");
                u176.anim.Reload.cylinder_close(v192, v181);
                u176.anim.Reload.arm1_end2(v178, v181).Completed:Wait();
            else
                u176.anim.Reload.arm1_idle2(v178, v181);
                v191.Completed:Wait();
                u176.anim.Reload.arm1_start(v178, v181);
                u176.anim.Reload.gun(v180, v181);
                u176.anim.Reload.arm2_start(v179, v181).Completed:Wait();
                u176.sound.Reload1(u176.instance.Root);
                local v193 = u176.cframes:get(u176.cylinder):get_offset("reload");
                u176.anim.Reload.cylinder_close(v193, v181);
            end;
        end;

        if u176.states.bullets:get() <= 0 or not u176.states.single_load:get() or u176.states.mag:get() >= u176.states.mag_size:get() + (u176.states.chambered:get() and 1 or 0) then
            break;
        end;
    end;
end;

function u1.reload_done(p194, p195) -- Line: 1372
    p195.values.cframes:get("arm1"):get_absolute("reload");
    p195.values.cframes:get("arm2"):get_absolute("reload");
    p194.cframes:get(p194.instance.Root):get_absolute("reload");
    p194.sound.Handle(p194.instance.Root);
    p195.values.cframes:get("arm1"):remove_all_absolutes("reload");
    p195.values.cframes:get("arm2"):remove_all_absolutes("reload");
    p194.cframes:get(p194.instance.Root):remove_all_absolutes("reload");
    p194.safety:set(p195.values.holding and p195.values.holding.loadout_type == "primary");
end;

function u1.reload_cancel(p196, p197) -- Line: 1383
    -- upvalues: Util (copy)
    if p196 == nil then
        return;
    end;

    p197.values.cframes:get("arm1"):get_absolute("reload");
    p197.values.cframes:get("arm2"):get_absolute("reload");
    p196.cframes:get(p196.instance.Root):get_absolute("reload");

    if p196.single_bullet then
        p196.single_bullet:Destroy();
        p196.single_bullet = nil;
    end;

    if p196.loader then
        p196.loader.Parent = nil;
        p196.cframes:get(p196.loader.Case):remove_pivot("reload");
    end;

    p197.values.cframes:get("arm2"):remove_pivot("reload");

    if p196.end_bullet then
        if p196.states.loaded:get() then
            p196.cframes:get(p196.end_bullet):remove_pivot("unloaded");
        else
            if p196.cframes:get(p196.end_bullet):current_pivot() ~= "unloaded" then
                p196.cframes:get(p196.end_bullet):set_pivot("unloaded");
            end;

            p196.end_bullet.Transparency = 1;

            for _, child in p196.end_bullet:GetChildren() do
                if child:IsA("BasePart") then
                    child.Transparency = 1;
                end;
            end;
        end;
    end;

    if p196.magazine then
        p196.cframes:get(p196.magazine):remove_pivot("reload");

        if not p196.states.loaded:get() then
            p196.magazine.Transparency = 1;
        end;

        if p196.feed_cover then
            local v198 = p196.cframes:get(p196.feed_cover):get_offset("reload");
            Util.tween(v198, TweenInfo.new(0.1), {
                Value = CFrame.new(0, 0, 0)
            });
        end;
    elseif p196.cylinder then
        local v199 = p196.cframes:get(p196.cylinder):get_offset("reload");
        Util.tween(v199, TweenInfo.new(0.1), {
            Value = CFrame.new(0, 0, 0)
        });
    end;

    p196.sound.Handle(p196.instance.Root);
    p197.values.cframes:get("arm1"):remove_all_absolutes("reload");
    p197.values.cframes:get("arm2"):remove_all_absolutes("reload");
    p196.cframes:get(p196.instance.Root):remove_all_absolutes("reload");
    p196.safety:set(p197.values.holding and p197.values.holding.loadout_type == "primary");
end;

function u1.cock_begin(p200, p201) -- Line: 1435
    local v202 = not p200.states.single_load:get();
    p200.sound.Handle(p200.instance.Root);
    local v203 = p200.states.reload_speed:get();

    if p200.right_hand_hold then
        p200.cframes:get(p200.instance.Root).pivot_time = 0.1;
        p200.cframes:get(p200.instance.Root):set_pivot("equipped2");
    end;

    local v204 = p201.values.cframes:get("arm1"):set_absolute("cock", true);
    local v205 = p201.values.cframes:get("arm2"):set_absolute("cock", true);
    local v206;

    if p200.load_slide then
        v206 = p200.cframes:get(p200.load_slide):set_offset("cock");
        p200.anim.Reload.slide_cock(v206, v203);

        if not v202 then
            p200.sound.Reload3(p200.instance.Root);
        end;
    else
        v206 = nil;
    end;

    p200.anim.Reload.arm1_cock(v204, v203, p200);
    p200.anim.Reload.arm2_cock(v205, v203, p200).Completed:Wait();

    if v206 then
        p200.anim.Reload.slide_cocked(v206, v203);

        if v202 then
            p200.sound.Reload3(p200.instance.Root);
        else
            p200.sound.Reload4(p200.instance.Root);
            local BulletEject = p200.instance:FindFirstChild("BulletEject", true);

            if BulletEject then
                p200:eject_bullet(BulletEject, p200.bullet_type);
            end;
        end;
    else
        p200.states.chambered:set(true);
    end;

    p200.anim.Reload.arm1_cocked(v204, v203, p200);
    p200.anim.Reload.arm2_cocked(v205, v203, p200).Completed:Wait();

    if v206 then
        p200.states.chambered:set(true);
    end;
end;

function u1.cock_done(p207, p208) -- Line: 1482
    p208.values.cframes:get("arm1"):get_absolute("cock");
    p208.values.cframes:get("arm2"):get_absolute("cock");
    local v209;

    if p207.load_slide then
        v209 = p207.cframes:get(p207.load_slide):get_offset("cock");
        p207.anim.Reload.base(v209, 1);
    else
        v209 = nil;
    end;

    p207.sound.Handle(p207.instance.Root);

    if v209 then
        p207.cframes:get(v209):remove_offset("cock");
    end;

    p208.values.cframes:get("arm1"):remove_all_absolutes("cock");
    p208.values.cframes:get("arm2"):remove_all_absolutes("cock");

    if p207.right_hand_hold then
        p207.cframes:get(p207.instance.Root):remove_pivot("equipped2");
    end;
end;

function u1.cock_cancel(p210, p211) -- Line: 1501
    if p210 == nil then
        return;
    end;

    p211.values.cframes:get("arm1"):get_absolute("cock");
    p211.values.cframes:get("arm2"):get_absolute("cock");
    local v212;

    if p210.load_slide then
        v212 = p210.cframes:get(p210.load_slide):get_offset("cock");
        p210.anim.Reload.base(v212, 1);
    else
        v212 = nil;
    end;

    p210.sound.Handle(p210.instance.Root);

    if v212 then
        p210.cframes:get(v212):remove_offset("cock");
    end;

    p211.values.cframes:get("arm1"):remove_all_absolutes("cock");
    p211.values.cframes:get("arm2"):remove_all_absolutes("cock");

    if p210.right_hand_hold then
        p210.cframes:get(p210.instance.Root):remove_pivot("equipped2");
    end;
end;

function u1.get_shoot_look(p213) -- Line: 1521
    -- upvalues: FlagManager (copy)
    shared.extras.ResetEnv();

    if FlagManager.FLAG_ADS_CAMERA_BULLETS then
        return p213.shot.CFrame:Lerp((p213.reticule or p213.instance.Root.FrontSight).WorldCFrame, p213.accuracy.Value);
    end;

    return p213.shot.CFrame;
end;

function get_circular_spread(p214, p215)
    local v216 = math.random() * 2 * 3.141592653589793;
    local v217 = math.random() ^ 0.35 * p215;

    return (p214.RightVector * math.cos(v216) + p214.UpVector * math.sin(v216)) * v217;
end;

function u1.send_shoot(p218) -- Line: 1536
    -- upvalues: Util (copy)
    local owner = p218.owner;
    local v219 = p218:get_shoot_look();

    if not p218.client_sided_hitscan then
        p218.states.shoot:fire_instant(v219);

        return;
    end;

    local v220 = p218.states.pellets:get() > 1;
    local v221 = CFrame.new(Util.validate_position(game.Workspace.CurrentCamera.CFrame.Position, v219.Position, owner.values.ray_params)) * v219.Rotation;
    local v222 = p218.states.pellets:get();
    local v223 = {};

    for i = 1, v222 do
        local Position = v221.Position;
        local v224 = v221.LookVector * 1000;
        local v225 = p218.states.spread:get() * 100;
        local v226 = v224 + (1 - p218.accuracy.Value * (p218.red_dot and p218.red_dot.Transparency == 1 and 0.5 or 1) * math.map(i, 1, math.max(2, v222), 1, 0)) * get_circular_spread(v221, v225);

        if v220 then
            v226 = v226 - v226 * 0.75;
        end;

        local v227 = p218:ray_damage(Position, v226, { owner.values.viewmodels, owner.instance }, nil);
        table.insert(v223, v227);
    end;

    p218.states.shoot:fire_instant(v219, v223);
end;

function u1.send_melee(p228) -- Line: 1579
    p228.states.melee:fire_instant();
    local CFrame2 = p228.owner.values.camera:get().CFrame;

    if not p228.client_sided_hitscan then
        p228.states.hit:fire(CFrame2);

        return;
    end;

    local owner = p228.owner;
    local v229 = p228:ray_damage(CFrame2.Position - CFrame2.LookVector * 0.2, CFrame2.LookVector * (p228.melee_range + 0.2), { owner.values.viewmodels, owner.instance }, 0.2);
    p228.states.hit:fire(CFrame2, v229);
end;

function u1.input_ads(p230, p231, p232) -- Line: 1598
    -- upvalues: Data (copy), UI (copy)
    p230.ads_hold = p231;
    local owner = p230.owner;

    if p231 and owner.values.prone_debounce then
        return;
    end;

    if owner and (owner.values.equipped == p230 and not p230.meleeing) then
        p230.owner.states.running:set(false);

        if Data.settings.toggle_aim and not p232 then
            if p231 then
                p230.states.sights:update(function(p233) -- Line: 1606
                    return not p233;
                end);
                UI.get("CancelScope").Visible = p230.states.sights:get();
            end;
        else
            p230.states.sights:set(p231);
        end;
    end;
end;

function u1.input_shoot(p234, p235, p236) -- Line: 1617
    -- upvalues: Data (copy), UI (copy)
    local owner = p234.owner;

    if owner and (owner.values.equipped == p234 and (not p234.safety:get() or p234.accuracy.Value >= 1)) and not (owner.states.running:get() or owner.values.equip_debounce:get()) then
        local v237 = os.clock();
        local v238 = p234.states.firerate:get();

        if (p234.burst_left or 0) <= 0 and (p235 and (not p236 or p234.automatic) or not p235 and (p236 and (not p234.automatic and p234.shoot_hold))) and (v238 == 0 or v237 - p234.last_shot > 1 / (v238 / 60)) then
            if p234.states.mag:get() > 0 and p234.states.chambered:get() then
                p234.last_shot = v237;
                p234:send_shoot();

                if p234.burst then
                    p234.burst_left = p234.burst - 1;
                end;
            else
                p234:reload(owner, false);
            end;
        end;
    end;

    if Data.settings.auto_ads and (p236 or not UI.get("ShootJoystickFrame").Visible) then
        if p235 and not p234.states.sights:get() then
            p234:input_ads(true, not Data.settings.lock_auto_ads);
        elseif not (p235 or (UI.get("CancelScope").Visible or Data.settings.lock_auto_ads)) then
            p234:input_ads(false, true);
        end;
    end;

    p234.shoot_hold = p235;
end;

function u1.hook_inputs(u239) -- Line: 1644
    -- upvalues: UI (copy), FirstPersonInterface (copy)
    local inputs = u239.inputs;
    u239.owner.states.equipped:hook(function(p240) -- Line: 1647
        -- upvalues: u239 (copy), inputs (copy)
        if p240 == u239.instance then
            inputs:enable();

            return;
        end;

        inputs:disable();
    end);
    u239.owner.values.equip_debounce:hook(function(p241) -- Line: 1655
        -- upvalues: u239 (copy)
        if p241 then
            u239.states.sights:set(false);
        end;
    end);
    inputs.enabled:hook(function(p242) -- Line: 1661
        -- upvalues: UI (ref)
        if p242 then
            UI.get("CancelScope").Visible = false;
            UI.get("CancelShoot").Visible = false;
        end;
    end);
    inputs:get("shoot"):press(function(p243) -- Line: 1668
        -- upvalues: UI (ref), u239 (copy)
        if not (p243 and UI.get("CancelShoot").Visible) then
            u239:input_shoot(p243);

            return;
        end;

        u239.shoot_hold = false;
        u239:input_shoot(false);
        UI.get("CancelShoot").Visible = false;
    end);
    inputs:get("shoot_joystick"):press(function(p244) -- Line: 1678
        -- upvalues: u239 (copy), UI (ref)
        u239:input_shoot(p244, true);
        local v245 = UI.get("CancelShoot");
        v245.Visible = not u239.automatic and (p244 and true or false);
    end);
    inputs:get("aim"):press(function(p246) -- Line: 1683
        -- upvalues: u239 (copy)
        u239:input_ads(p246);
    end);
    inputs:get("reload"):press(function(p247) -- Line: 1690
        -- upvalues: u239 (copy)
        local owner = u239.owner;

        if p247 and (owner and (not u239.reload_thread.running and (not owner.values.equip_debounce:get() and (not owner.values.prone_debounce and (owner.values.equipped == u239 and (owner.states.vault:get() == 0 and (not owner.states.running:get() and u239.states.bullets:get() > 0))))))) and u239.states.mag:get() - (u239.cylinder and 0 or 1) < u239.states.mag_size:get() then
            u239.states.sights:set(false);
            u239.ads_hold = false;
            local holding = owner.values.holding;

            if holding and holding.can_reload == false then
                owner.states.holding:set(owner.values.hands, true);

                while owner.values.equip_debounce:get() or owner.values.holding == holding do
                    owner.values.equip_debounce:wait();
                end;
            end;

            u239.states.reload:fire_instant();

            if holding and (holding.can_reload == false and u239.reload_thread.running) then
                u239.reload_thread:wait();
                task.defer(owner.values.requip_items);
            end;
        end;
    end);
    FirstPersonInterface.setup_action(inputs, function() -- Line: 1713
        -- upvalues: u239 (copy)
        local v248 = not (u239.reload_thread.running or u239.cock_thread.running);

        if v248 then
            if u239.states.mag:get() < u239.states.mag_size:get() * 0.2 then
                v248 = u239.states.bullets:get() > 0;
            else
                v248 = false;
            end;
        end;

        return v248;
    end, "Reload", "reload");
end;

function u1.update_ui(p249) -- Line: 1725
    local v250 = p249.states.bullets:get();
    local v251 = `{p249.states.mag:get()}/{v250 >= 1000 and "∞" or v250}`;

    for _, v in p249.hooked_labels do
        v.Text = v251;
    end;
end;

function u1.load() -- Line: 1736
    -- upvalues: StateObject (copy), u1 (copy), State (copy), Event (copy), Globals (copy)
    StateObject.class(u1.tag, function() -- Line: 1737
        -- upvalues: State (ref), Event (ref), Globals (ref)
        local v252 = {
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
        };

        for _, v in Globals.attachment_types do
            v252[v .. "_att"] = State.new("");
        end;

        return v252, {};
    end):hook(function(p253) -- Line: 1776
    end);
end;

return u1;
