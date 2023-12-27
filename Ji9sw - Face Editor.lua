util.require_natives("2944a")
local Root = menu.my_root()
local SliderStepSize = 0.1

for i = 0, 19 do
    PED.SET_PED_MICRO_MORPH(players.user_ped(), i, 0)
end

 --------------------- OPTIONS --------------------- 

Root:slider_float("Nose Width (Thin/Wide)", {}, "", -100, 100, 0, SliderStepSize * 10, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 0, Value)
end)

Root:slider_float("Nose Peak (Up/Down)", {}, "", -100, 100, 0, SliderStepSize * 10, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 1, Value)
end)

Root:slider_float("Nose Length (Long/Short)", {}, "", -100, 100, 0, SliderStepSize * 10, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 2, Value)
end)

Root:slider_float("Nose Bone Curveness (Crooked/Curved)", {}, "", -100, 100, 0, SliderStepSize * 10, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 3, Value)
end)

Root:slider_float("Nose Tip (Up/Down)", {}, "", -100, 100, 0, SliderStepSize * 10, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 4, Value)
end)

Root:slider_float("Nose Bone Twist (Left/Right)", {}, "", -100, 100, 0, SliderStepSize * 10, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 5, Value)
end)

Root:slider_float("Eyebrow (Up/Down)", {}, "", -100, 100, 0, SliderStepSize * 10, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 6, Value)
end)

Root:slider_float("Eyebrow (In/Out)", {}, "", -100, 100, 0, SliderStepSize * 10, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 7, Value)
end)

Root:slider_float("Cheek Bones (Up/Down)", {}, "", -100, 100, 0, SliderStepSize * 10, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 8, Value)
end)

Root:slider_float("Cheek Sideways Bone Size (In/Out)", {}, "", -100, 100, 0, SliderStepSize * 10, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 9, Value)
end)

Root:slider_float("Cheek Bones Width (Puffed/Gaunt)", {}, "", -100, 100, 0, SliderStepSize * 10, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 10, Value)
end)

Root:slider_float("Eye Opening (Both) (Wide/Squinted)", {}, "", -100, 100, 0, SliderStepSize * 100, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 11, Value)
end)

Root:slider_float("Lip Thickness (Both) (Fat/Thin)", {}, "", -100, 100, 0, SliderStepSize * 10, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 12, Value)
end)

Root:slider_float("Jaw Bone Width (Narrow/Wide)", {}, "", -100, 100, 0, SliderStepSize * 10, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 13, Value)
end)

Root:slider_float("Jaw Bone Shape (Round/Square)", {}, "", -100, 100, 0, SliderStepSize * 10, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 14, Value)
end)

Root:slider_float("Chin Bone (Up/Down)", {}, "", -100, 100, 0, SliderStepSize * 10, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 15, Value)
end)

Root:slider_float("Chin Bone Length (In/Out or Backward/Forward)", {}, "", -100, 100, 0, SliderStepSize * 10, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 16, Value)
end)

Root:slider_float("Chin Bone Shape (Pointed/Square)", {}, "", -100, 100, 0, SliderStepSize * 10, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 17, Value)
end)

Root:slider_float("Chin Hole (Chin Bum)", {}, "", -100, 100, 0, SliderStepSize * 10, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 18, Value)
end)

Root:slider_float("Neck Thickness (Thin/Thick)", {}, "", -100, 100, 0, SliderStepSize * 10, function(Value)
    PED.SET_PED_MICRO_MORPH(players.user_ped(), 19, Value)
end)

