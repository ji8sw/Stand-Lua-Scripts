util.require_natives("2944a")
local Root = menu.my_root()

function SetGlobalInt(address, value)
    memory.write_int(memory.script_global(address), value)
end

function GetGlobalInt(address)
    return memory.read_int(memory.script_global(address))
end
 
local SelectedSlot = 0
local GunVanTruckCoords = { {-29.532, 6435.136, 31.162}, {1705.214, 4819.167, 41.75}, {1795.522, 3899.753, 33.869}, {1335.536, 2758.746, 51.099}, {795.583, 1210.78, 338.962}, {-3192.67, 1077.205, 20.594}, {-789.719, 5400.921, 33.915}, {-24.384, 3048.167, 40.703}, {2666.786, 1469.324, 24.237}, {-1454.966, 2667.503, 3.2}, {2340.418, 3054.188, 47.888}, {1509.183, -2146.795, 76.853}, {1137.404, -1358.654, 34.322}, {-57.208, -2658.793, 5.737}, {1905.017, 565.222, 175.558}, {974.484, -1718.798, 30.296}, {779.077, -3266.297, 5.719}, {-587.728, -1637.208, 19.611}, {733.99, -736.803, 26.165}, {-1694.632, -454.082, 40.712}, {-1330.726, -1163.948, 4.313}, {-496.618, 40.231, 52.316}, {275.527, 66.509, 94.108}, {260.928, -763.35, 30.559}, {-478.025, -741.45, 30.299}, {894.94, 3603.911, 32.56}, {-2166.511, 4289.503, 48.733}, {1465.633, 6553.67, 13.771}, {1101.032, -335.172, 66.944}, {149.683, -1655.674, 29.028} }

 --------------------- GUN VAN OPTIONS --------------------- 

 Root:slider("Gun Van Slot", {}, "Choose the gun van slot to modify from 1-10", 1, 10, 1, 1, function(slotID) -- The slot ID needs to have an extra 1, the array is actually 0-9 but GTA is dumb
    SelectedSlot = slotID
 end)

 Root:text_input("Modify Gun Van Slot", {'setGVSlot '}, "Set the gunvan slot to the weapon hash \nFound at: https://wiki.rage.mp/index.php?title=Weapons", function(Input)
    SetGlobalInt(262145 + 34328 + SelectedSlot, util.joaat(Input))
end)

Root:action("Gun Van Discount", {'setGVSlot '}, "Adds a nice 10% discount to all items in the gun van", function() -- 10% is the limit
    SetGlobalInt(262145 + 34339, 10) -- Weapons
    SetGlobalInt(262145 + 34350, 10) -- Throwables 
    SetGlobalInt(262145 + 34358, 10) -- Armour
end)

Root:action("Optimal Gun Van Slots", {}, "Adds a few cool weapons like the navy revolver automatically", function()
    SetGlobalInt(262145 + 34328 + 1, util.joaat("weapon_navyrevolver"))
    SetGlobalInt(262145 + 34328 + 2, util.joaat("weapon_gadgetpistol"))
    SetGlobalInt(262145 + 34328 + 3, util.joaat("weapon_stungun_mp"))
    SetGlobalInt(262145 + 34328 + 4, util.joaat("weapon_doubleaction"))
    SetGlobalInt(262145 + 34328 + 5, util.joaat("weapon_railgunxm3"))
    SetGlobalInt(262145 + 34328 + 6, util.joaat("weapon_minigun"))
    SetGlobalInt(262145 + 34328 + 7, util.joaat("weapon_heavysniper_mk2"))
    SetGlobalInt(262145 + 34328 + 8, util.joaat("weapon_combatmg_mk2"))
    SetGlobalInt(262145 + 34328 + 9, util.joaat("weapon_tacticalrifle"))
    SetGlobalInt(262145 + 34328 + 10, util.joaat("weapon_specialcarbine_mk2"))
end)

Root:action("Teleport To Gun Van", {}, "Teleports you to the gun van", function()
    Position = GetGlobalInt(2652572 + 2650)

    if not GunVanTruckCoords[Position + 1] then
        util.toast("This event is currently innactive")
    else 
        Coord = GunVanTruckCoords[Position + 1]
        players.teleport_3d(players.user(), Coord[1], Coord[2], Coord[3])
    end
end)