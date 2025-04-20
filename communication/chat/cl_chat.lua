----
-- [[ CHAT LOCAL ]]
----
RegisterNetEvent('sendProximityMessage')
AddEventHandler('sendProximityMessage', function(id, message, roleplay_name)
    local myId                = PlayerId()
    local pid                 = GetPlayerFromServerId(id)
    if pid == myId then
        TriggerEvent('chatMessage', "", {128, 128, 128}, "^0IG | ".. roleplay_name .. " say: ^9" .. message )
    elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < Config.ProximityChatDistance then
        TriggerEvent('chatMessage', "", {128, 128, 128}, "^0IG | ".. roleplay_name .. " say: ^9" .. message )
    end
end)

----
-- [[ CHAT /ME ]]
----
RegisterNetEvent('sendProximityMessageMe')
AddEventHandler('sendProximityMessageMe', function(id, roleplay_name, message)
  local myId                = PlayerId()
  local pid                 = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "", {255, 0, 0}, "^6".. roleplay_name .. " " .. message )
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < Config.ProximityChatDistance then
    TriggerEvent('chatMessage', "", {255, 0, 0}, "^6".. roleplay_name .. " " .. message )
  end
end)

----
-- [[ CHAT /DO ]]
----
RegisterNetEvent('sendProximityMessageDo')
AddEventHandler('sendProximityMessageDo', function(id, roleplay_name, message)
    local myId                = PlayerId()
    local pid                 = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "", {255, 0, 0}, "^8*".. roleplay_name .. " " .. message )
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < Config.ProximityChatDistance then
    TriggerEvent('chatMessage', "", {255, 0, 0}, "^8*".. roleplay_name .. " " .. message )
  end
end)

----
-- [[ CHAT /DICE ]]
----
RegisterNetEvent('sendProximityMessageDice')
AddEventHandler('sendProximityMessageDice', function(id, roleplay_name, num)
    local myId                = PlayerId()
    local pid                 = GetPlayerFromServerId(id)
  if pid == myId then
    if num == 1 then
        TriggerEvent('chatMessage', "", {255, 0, 0}, "^5*".. roleplay_name .. " rolls the dice is displayed 1")
    elseif num == 2 then
        TriggerEvent('chatMessage', "", {255, 0, 0}, "^5*".. roleplay_name .. " rolls the dice is displayed 2")
    elseif num == 3 then
        TriggerEvent('chatMessage', "", {255, 0, 0}, "^5*".. roleplay_name .. " rolls the dice is displayed 3")
    elseif num == 4 then
        TriggerEvent('chatMessage', "", {255, 0, 0}, "^5*".. roleplay_name .. " rolls the dice is displayed 4")
    elseif num == 5 then
        TriggerEvent('chatMessage', "", {255, 0, 0}, "^5*".. roleplay_name .. " rolls the dice is displayed 5")
    elseif num == 6 then
        TriggerEvent('chatMessage', "", {255, 0, 0}, "^5*".. roleplay_name .. " rolls the dice is displayed 6")
    end
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < Config.ProximityChatDistance then
    if num == 1 then
        TriggerEvent('chatMessage', "", {255, 0, 0}, "^5*".. roleplay_name .. " rolls the dice is displayed 1")
    elseif num == 2 then
        TriggerEvent('chatMessage', "", {255, 0, 0}, "^5*".. roleplay_name .. " rolls the dice is displayed 2")
    elseif num == 3 then
        TriggerEvent('chatMessage', "", {255, 0, 0}, "^5*".. roleplay_name .. " rolls the dice is displayed 3")
    elseif num == 4 then
        TriggerEvent('chatMessage', "", {255, 0, 0}, "^5*".. roleplay_name .. " rolls the dice is displayed 4")
    elseif num == 5 then
        TriggerEvent('chatMessage', "", {255, 0, 0}, "^5*".. roleplay_name .. " rolls the dice is displayed 5")
    elseif num == 6 then
        TriggerEvent('chatMessage', "", {255, 0, 0}, "^5*".. roleplay_name .. " rolls the dice is displayed 6")
    end
  end
end)