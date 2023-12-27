 --------------------- CREDIT --------------------- 
 --[kryptcat]: [Creater of PhoneFix, of which Phone Animations is skidded from.] --

util.require_natives("2944a")
local Root = menu.my_root()

 --------------------- PHONE MENU --------------------- 

Root:toggle("Phone Animations", {}, "Use your phone in online, first person or not", function (on) 
     if on then util.create_thread(function ()
         while on do
             if PAD.IS_CONTROL_JUST_PRESSED(0, 27) then
                 PED.SET_PED_CONFIG_FLAG(players.user_ped(), 242, false)
                 PED.SET_PED_CONFIG_FLAG(players.user_ped(), 243, false)
                 PED.SET_PED_CONFIG_FLAG(players.user_ped(), 244, false)
             end
             util.yield()
         end
         end)
     else
         PED.SET_PED_CONFIG_FLAG(players.user_ped(), 242, true)
         PED.SET_PED_CONFIG_FLAG(players.user_ped(), 243, true)
         PED.SET_PED_CONFIG_FLAG(players.user_ped(), 244, true)
     end
 end)
 
 Root:toggle('Landscape Mode', {}, 'Turns your phone sideways to read emails and what not', function (on)
     MOBILE.CELL_HORIZONTAL_MODE_TOGGLE(on)
 end)
 
 Root:action('Delete Phone', {}, 'Get rid of your current phone', function ()
     MOBILE.DESTROY_MOBILE_PHONE()
 end)
 
 Root:slider('Create Phone', {'createphone'}, "Get a new phone \n0 - Michael's phone \n1 - Trevor's phone \n2 - Franklin's phone \n3 - Unused police phone \n4 - Prologue phone", 0, 4, 0, 1, function (input)
     MOBILE.DESTROY_MOBILE_PHONE()
     MOBILE.CREATE_MOBILE_PHONE(input)
 end)
 
 local phoneMenuPos =  Root:list('Phone Position', {''}, 'Phone Position Options')
 local phoneMenuRot =  Root:list('Phone Rotation', {''}, 'Phone Rotation Options')
 
 local origPhonePos = v3.new()
 MOBILE.GET_MOBILE_PHONE_POSITION(origPhonePos)
 
 Root.text_input(phoneMenuPos, 'Set X', {'phonepX'}, 'Set the phones X position', function (input)
     local v3 = v3.new()
     MOBILE.GET_MOBILE_PHONE_POSITION(v3)
     MOBILE.SET_MOBILE_PHONE_POSITION(input,v3.y,v3.z)
 end)
 
 Root.text_input(phoneMenuPos, 'Set Y', {'phonepY'}, 'Set the phones Y position', function (input)
     local v3 = v3.new()
     MOBILE.GET_MOBILE_PHONE_POSITION(v3)
     MOBILE.SET_MOBILE_PHONE_POSITION(v3.x,input,v3.z)
 end)
 
 Root.text_input(phoneMenuPos, 'Set Z', {'phonepZ'}, 'Set the phones Z position', function (input)
     local v3 = v3.new()
     MOBILE.GET_MOBILE_PHONE_POSITION(v3)
     MOBILE.SET_MOBILE_PHONE_POSITION(v3.x,v3.y,input)
 end)
 
 Root.action(phoneMenuPos, 'Reset Position', {'phonePR'}, 'Resets the phones position to default', function ()
     MOBILE.SET_MOBILE_PHONE_POSITION(origPhonePos.x,origPhonePos.y,origPhonePos.z)
 end)
 
 local origPhoneRot = v3.new()
 MOBILE.GET_MOBILE_PHONE_ROTATION(origPhoneRot)
 
 Root.text_input(phoneMenuRot, 'Set X', {'phonerX'}, 'Set the phones X rotation', function (input)
     local v3 = v3.new()
     MOBILE.GET_MOBILE_PHONE_ROTATION(v3)
     MOBILE.SET_MOBILE_PHONE_ROTATION(input,v3.y,v3.z)
 end)
 
 Root.text_input(phoneMenuRot, 'Set Y', {'phonepY'}, 'Set the phones Y rotation', function (input)
     local v3 = v3.new()
     MOBILE.GET_MOBILE_PHONE_ROTATION(v3)
     MOBILE.SET_MOBILE_PHONE_ROTATION(v3.x,input,v3.z)
 end)
 
 Root.text_input(phoneMenuRot, 'Set Z', {'phonepZ'}, 'Set the phones Z rotation', function (input)
     local v3 = v3.new()
     MOBILE.GET_MOBILE_PHONE_ROTATION(v3)
     MOBILE.SET_MOBILE_PHONE_ROTATION(v3.x,v3.y,input)
 end)
 
 Root.action(phoneMenuRot, 'Reset Rotation', {'phoneRR'}, 'Resets the phones rotation to default', function ()
     MOBILE.SET_MOBILE_PHONE_ROTATION(origPhoneRot.x,origPhoneRot.y,origPhoneRot.z)
 end)