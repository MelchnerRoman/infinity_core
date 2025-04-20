-----
-- [ TELEPORT ID ]
-----
function teleport(TP)
    local playerPed = PlayerPedId()
    if TP == '14' then 
        Citizen.InvokeNative(0x74E2261D2A66849A , true)
        Citizen.InvokeNative(0xE8770EE02AEE45C2, 1)
        Citizen.InvokeNative(0xA657EC9DBC6CC900, `guarma`)
    else
        Citizen.InvokeNative(0x74E2261D2A66849A , false)
        Citizen.InvokeNative(0xE8770EE02AEE45C2, 0)
        Citizen.InvokeNative(0xA657EC9DBC6CC900, `world`)
    end
    if (TP == '1') then
        SetEntityCoords(playerPed, -3622.04,-2612.9,-13.61) 
    elseif (TP == '2') then
        SetEntityCoords(playerPed, -238.11,744.48,116.68) 
    elseif (TP == '3') then
        SetEntityCoords(playerPed, -908.72,-1366.0,45.41) 
    elseif (TP == '4') then
        SetEntityCoords(playerPed, -1781.67,-378.35,158.14) 
    elseif (TP == '5') then
        SetEntityCoords(playerPed, 2786.52, -1134.05, 46.62)
    elseif (TP == '6') then
        SetEntityCoords(playerPed, 2904.81,1356.38,51.72)
    elseif (TP == '7') then
        SetEntityCoords(playerPed, 2955.93,501.25,45.87)
    elseif (TP == '8') then
        SetEntityCoords(playerPed, -5519.9,-2901.19,-2.5)
    elseif (TP == '9') then
        SetEntityCoords(playerPed, 572.85,1688.11,187.63)
    elseif (TP == '10') then
        SetEntityCoords(playerPed, -1917.85,1333.33,200.86)
    elseif (TP == '11') then
        SetEntityCoords(playerPed, 1299.68,-1330.98,77.5)
    elseif (TP == '12') then
        SetEntityCoords(playerPed, -1351.61, 2437.75, 308.43, 235.79)     
    elseif (TP == '13') then
        SetEntityCoords(playerPed, -2502.09, -2416.38, 60.59, 197.59) 
    elseif (TP == '14') then
        SetEntityCoords(playerPed, 1544.0 , -7160.43 , 62.98, 220.66)
    end
end

-----
-- [ NO CLIP ]
-----
local noclip        = false
local noclip_speed  = 1.0
function admin_no_clip()
  local playerPed = PlayerPedId()
  if not noclip then
    noclip = true
    SetEntityInvincible(playerPed, true)
    SetEntityVisible(playerPed, false, false)
  else
    noclip = false
    SetEntityInvincible(playerPed, false)
    SetEntityVisible(playerPed, true, false)
  end
  Citizen.CreateThread(function()
        while noclip do
            if noclip then
                Wait(0)
            else
                Wait(2500)
            end
            if noclip then
            local playerPed = PlayerPedId()
            local x,y,z     = getPosition()
            local dx,dy,dz  = getCamDirection()
            local speed     = noclip_speed
            SetEntityVelocity(playerPed, 0.0001, 0.0001, 0.0001)
            if IsControlPressed(0, 0x8FD015D8) then -- MOVE UP
                x = x+speed*dx
                y = y+speed*dy
                z = z+speed*dz
            end
            if IsControlPressed(0, 0xD27782E3) then -- MOVE DOWN
                x = x-speed*dx
                y = y-speed*dy
                z = z-speed*dz
            end
            SetEntityCoordsNoOffset(playerPed,x,y,z,true,true,true)
            end
        end
    end)
end
function getPosition()
  local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
  return x,y,z
end
function getCamDirection()
  local heading     = GetGameplayCamRelativeHeading()+GetEntityHeading(PlayerPedId())
  local pitch       = GetGameplayCamRelativePitch()
  local x           = -math.sin(heading*math.pi/180.0)
  local y           = math.cos(heading*math.pi/180.0)
  local z           = math.sin(pitch*math.pi/180.0)
  local len = math.sqrt(x*x+y*y+z*z)
  if len ~= 0 then
    x = x/len
    y = y/len
    z = z/len
  end
  return x,y,z
end

-----
-- [ NOCLIP RETURN ]
-----
RegisterNetEvent('infinity_core:noclip')
AddEventHandler('infinity_core:noclip', function(source)
    admin_no_clip()
end)

-----
-- [ TELEPORT RETURN ]
-----
RegisterNetEvent('infinity_core:teleport')
AddEventHandler('infinity_core:teleport', function(TP)
    teleport(TP)
end)

-----
-- [ KILL ID RETURN ]
-----
RegisterNetEvent('infinity_core:kill')
AddEventHandler('infinity_core:kill', function(source)
    playerPed       = PlayerPedId() 
    ApplyDamageToPed(playerPed, 500000, false, true, true)
end)

-----
-- [ REVIVE ID RETURN ]
-----
RegisterNetEvent('infinity_core:revive')
AddEventHandler('infinity_core:revive', function(source)
    _InfinitySource        = GetPlayerServerId(PlayerId())
    local ply = PlayerPedId()
    ResurrectPed(PlayerPedId(ply))
    Citizen.InvokeNative(0x50C803A4CD5932C5, true)
    health      = 100
    SetEntityHealth(PlayerPedId(), health)
    Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 0, 100)
    Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, 100)
    exports.infinity_core:notification(_InfinitySource, Config.Lang_RevivedbyAdmin, "", "center_right", "infinitycore", 2500)
end)

-----
-- [ INSPECT ID ]
-----
TriggerEvent('chat:addSuggestion', '/inspect', 'Inspect the player datas', 
{{ name="ID PLAYER", help="Type the id of player" }})
RegisterCommand('inspect', function(source, args)
    local PlayerDatas = GetPlayerSession(source)
    if PlayerDatas._Rank == "superadmin" or PlayerDatas._Rank == "admin" then
        if args[1] ~= nil then 
            TriggerServerEvent('infinity_core:inspect', _InfinitySource, args[1])
        end
    end
end)

-----
-- [ TPM RETURN ]
-----
RegisterNetEvent('infinitycore:gotomarker')
AddEventHandler('infinitycore:gotomarker', function(source)
    local PlayerPed             = PlayerPedId()
    if DoesEntityExist(PlayerPed) then
        local WP = GetWaypointCoords()
        local height = 1
        for height = 1, 1000 do
          SetEntityCoords(PlayerPed, WP.x, WP.y, height + 0.0)
          local foundground, groundZ, normal = GetGroundZAndNormalFor_3dCoord(WP.x, WP.y, height + 0.0)
          if foundground then
            SetEntityCoords(PlayerPed, WP.x, WP.y, height + 0.0)
            break
          end
          Wait(25)
      end
    end
end)

-----
-- [ JAIL RETURN ]
-----
RegisterNetEvent('infinitycore:jail')
AddEventHandler('infinitycore:jail', function(target)
    local PlayerPed             = PlayerPedId(target)
    SetEntityCoords(PlayerPed, 3382.6, -693.99, 42.68)
end)

-----
-- [TP PLAYER TO ME]
-----
RegisterCommand("gotome", function(source, args)
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    if PlayerDatas._Rank == "superadmin" then 
        local PlayerPed  = PlayerPedId()
        local coords     = GetEntityCoords(PlayerPed) 
        local target     = tonumber(args[1])
        TriggerServerEvent('infinitycore:teleportplayer', coords, target)
    end
end)

RegisterNetEvent('infinitycore:teleportplayerReturn')
AddEventHandler('infinitycore:teleportplayerReturn', function(coords)
    local PlayerPed             = PlayerPedId()
    SetEntityCoords(PlayerPed, coords.x, coords.y, coords.z)
end)

-----
-- [FREEZE PLAYER RETURN]
-----
RegisterNetEvent('infinity_core:freeze')
AddEventHandler('infinity_core:freeze', function(Freeze)
	local PlayerPed  = PlayerPedId()
	if Freeze == "true" then 
		FreezeEntityPosition(PlayerPed, true)
	end
	if Freeze == "false" then 
		FreezeEntityPosition(PlayerPed, false)
	end
end)

-----
-- [DELETE VEHICULE RETURN]
-----
RegisterNetEvent('infinity_core:deleteveh')
AddEventHandler('infinity_core:deleteveh', function()
    if IsPedSittingInAnyVehicle(PlayerPedId()) then 
        local currentvehicle = GetVehiclePedIsIn(PlayerPedId(),false)
        SetEntityAsMissionEntity(currentvehicle,true,true)
        DeleteVehicle(currentvehicle)
    end
end)

-----
-- [DELETE HORSE RETURN]
-----
RegisterNetEvent('infinity_core:deletehorse')
AddEventHandler('infinity_core:deletehorse', function()
    local mount     = GetMount(PlayerPedId())
    DeleteEntity(mount)
end)

-----
-- [ GHOSTMOD RETURN ]
-----
RegisterNetEvent('infinity_core:ghostmod')
AddEventHandler('infinity_core:ghostmod', function()
    Citizen.CreateThread(function()
        while true do
            Wait(gosthmodEnabledTimer)
            if ghostmodEnabled then 
                gosthmodEnabledTimer = 1300
            else
                gosthmodEnabledTimer = 2500
            end
            if ghostmodEnabled then
                SetEntityVisible(PlayerPedId(), false)
            end
        end
    end)
    if not ghostmodEnabled then
        ghostmodEnabled = true
        exports.infinity_core:notification(_InfinitySource, Config.Lang_GhostEnabled, "", "center_right", "infinitycore", 2500)
        SetEntityVisible(PlayerPedId(), false)
    else
        ghostmodEnabled = false
        exports.infinity_core:notification(_InfinitySource, Config.Lang_GhostDisabled, "", "center_right", "infinitycore", 2500)
        SetEntityVisible(PlayerPedId(), true)
    end
end)

-----
-- [ GODMOD RETURN ]
-----
RegisterNetEvent('infinity_core:godmod')
AddEventHandler('infinity_core:godmod', function()
    Citizen.CreateThread(function()
        while true do
            Wait(godmodEnabledTimer)
            if godmodEnabled then 
                godmodEnabledTimer = 1000
            else
                godmodEnabledTimer = 2500
            end
            if godmodEnabled then
                SetPlayerInvincible(PlayerPedId(), true)
            end
        end
    end)
    if not godmodEnabled then
        godmodEnabled = true
        exports.infinity_core:notification(_InfinitySource, Config.Lang_GodEnabled, "", "center_right", "infinitycore", 2500)
        SetPlayerInvincible(PlayerPedId(), true)
    else
        godmodEnabled = false
        exports.infinity_core:notification(_InfinitySource, Config.Lang_GodDisabled, "", "center_right", "infinitycore", 2500)
        SetPlayerInvincible(PlayerPedId(), false)
    end
end)