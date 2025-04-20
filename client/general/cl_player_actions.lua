-----
-- [ /myrank ]
-----
TriggerEvent('chat:addSuggestion', '/myrank', 'Get your current rank in the server', {})
RegisterCommand('myrank', function(source, args)
  local PlayerDatas = GetPlayerSession(source)
  exports.infinity_core:notification(_InfinitySource, "<b class='text-warning'>Your Rank</b><br>"..PlayerDatas._Rank, '', 'center_left', 'infinitycore', 2500)      
end)

-----
-- [ /hideui ]
-----
hideUI = false
TriggerEvent('chat:addSuggestion', '/hideui', 'Display or Show the UI icons', {})
RegisterCommand('hideui', function(source, args, raw)
    if not hideUI then 
        hideUI = true
        Citizen.InvokeNative(0xC116E6DF68DCE667, 0, 0)          -- Enable Stamina Core Inside
        Citizen.InvokeNative(0xC116E6DF68DCE667, 1, 0)          -- Show Stamina Core Outside
    else
        hideUI = false
        Citizen.InvokeNative(0xC116E6DF68DCE667, 0, 1)          -- Enable Stamina Core Inside
        Citizen.InvokeNative(0xC116E6DF68DCE667, 1, 1)          -- Show Stamina Core Outside
    end
    SendNUIMessage({
        type        = "ui",
        hiddenUi    = hideUI
    })
end, false)

-----
-- [ /rpinfos ]
-----
TriggerEvent('chat:addSuggestion', '/rpinfos', 'Get your current roleplay infos in the server', {})
RegisterCommand('rpinfos', function(source, args)
  local PlayerDatas = GetPlayerSession(source)
  exports.infinity_core:notification(
        _InfinitySource, 
        "<b class='text-info'>Your Roleplay Informations</b>", 
        "CharID: "..PlayerDatas._Charid.." RP: "..PlayerDatas._Firstname.." "..PlayerDatas._Lastname.." "..PlayerDatas._Years.." years from "..PlayerDatas._Nation, 
        'center_left', 
        'infinitycore', 
        2500
    )      
end)

----
-- [[ /getsession ]]
----
TriggerEvent('chat:addSuggestion', '/getsession', 'Show your current session', {})
RegisterCommand("getsession", function(source, args) 
    local PlayerDatas = GetPlayerSession(source)
    print('### ^6Your current Session^0 ###')
    print('-----------------------')
    print('Server ID ^4'..PlayerDatas._InfinitySource..'^0')
    print('Character ID^4 '..PlayerDatas._Charid..'^0')
    print('RankServer ^4'..PlayerDatas._Rank..'^0')
    print('-----------------------')
    print('Lastname ^6'..PlayerDatas._Lastname..'^0')
    print('Firstname ^6'..PlayerDatas._Firstname..'^0')
    print('Sex ^4 '..PlayerDatas._Sex..'^0')
    print('Nation ^6'..PlayerDatas._Nation..'^0')
    print('Years ^6'..PlayerDatas._Years..'^0')
    print('-----------------------')
    print('Bank ^2'..PlayerDatas._Bank..'$^0')
    print('Cash ^2'..PlayerDatas._Cash..'$^0')
    print('Golds ^2'..PlayerDatas._Gold..'kg^0')
    print('XP ^3'..PlayerDatas._Xp..'^0')
    print('-----------------------')
    print('Gang ^6'..PlayerDatas._Gang..'^0')
    print('GangRank ^6'..PlayerDatas._GangRank..'^0')
    print('Job ^6'..PlayerDatas._Job..'^0')
    print('JobGrade ^6'..PlayerDatas._JobGrade..'^0')
    print('-----------------------')
end)

-----
-- [ /viptp 1-13 ]
-----
TriggerEvent('chat:addSuggestion', '/viptp', 'For VIP/ALPHA Only use this for teleport player', 
{{ name="TP_ID", help="Range min: 1 and max: 13" }})
RegisterCommand('viptp', function(source, args)
 local PlayerDatas = GetPlayerSession(source)
  if PlayerDatas._Rank == "vip" then
      if args[1] ~= nil then 
        TP = args[1]
        exports.infinity_core:notification(_InfinitySource, "<b class='text-warning'>VIP</b>", 'Teleport used', 'center_left', 'infinitycore', 2500)      
        local playerPed = PlayerPedId()
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
          end
      end
    else
    exports.infinity_core:notification(_InfinitySource, "<b class='text-danger'>No Access</b>", 'You do not have permission to access this command', 'center_left', 'infinitycore', 2500)      
  end
end)

-----
-- [ /loadmyoutfit ]
-----
TriggerEvent('chat:addSuggestion', '/loadmyoutfit', 'Load your last outfit saved', {})
RegisterCommand("loadmyoutfit", function(source)
    exports.infinity_clothes:LoadOutfit(_InfinitySource)
end)

-----
-- [ /mylvl ]
-----
TriggerEvent('chat:addSuggestion', '/mylvl', 'Check your current level and xp', {})
RegisterCommand('mylvl', function(source)
    local PlayerDatas           = GetPlayerSession(source)
    local PlayerLevel, PlayerXP = XpReturn()
    exports.infinity_core:notification(_InfinitySource, "Level "..PlayerLevel, "<small>With "..PlayerDatas._Xp.." XP</small>", "center_right", "infinitycore", 2500)
end, false)

-----
-- [ /hp ]
-----
TriggerEvent('chat:addSuggestion', '/hp', 'Check your hp in server', {})
RegisterCommand("hp", function(source)
    hp()
end)

-----
-- [ /id ]
-----
TriggerEvent('chat:addSuggestion', '/id', 'Check your ID PLAYER in server', {})
RegisterCommand('id', function()
    id()
end, false)

-----
-- [ /coords ]
-----
TriggerEvent('chat:addSuggestion', '/coords', 'Check your coords in server (Warning FPS Impact)', {})
RegisterCommand('coords', function(source)
    TriggerEvent("infinity_core:coords", _InfinitySource, 25)
end, false)

-----
-- [ /die ]
-----
TriggerEvent('chat:addSuggestion', '/die', 'Kill Yourself and lose 100XP and 25$', {})
RegisterCommand("die", function(source)
    die()
end)

-----
-- [ /pay id amount ]
-----
TriggerEvent('chat:addSuggestion', '/pay', 'Pay Any players in you side', {
    { name="ID", help="ID of player paid" },
    { name="Amount", help="Amount to send" }
})
RegisterCommand("pay", function(source, args, rawCommand)
    local closestPlayer, closestDistance = PlayerArround()
    local id            = tonumber(GetPlayerServerId(closestPlayer))
    local PlayerDatas   = GetPlayerSession(source)
    if id and closestDistance <= 2 then
        if tonumber(_InfinitySource) ~= tonumber(args[1]) then
            if args[1] == nil or args[2] == nil then
                exports.infinity_core:notification(_InfinitySource, Config.ERROR, "Argument #1 or #2 is bad", "center_right", "redm_min", 2500)
            else
                animationSatchel()
                TriggerServerEvent("infinity_core:pay", _InfinitySource, args[1], args[2], PlayerDatas, 
                function(cb)
                end)
            end
        else
            exports.infinity_core:notification(_InfinitySource, Config.ERROR, "Impossible to pay yourself !", "center_right", "infinitycore", 2500)
        end
    else
        exports.infinity_core:notification(_InfinitySource, Config.ERROR, "No player in front of you", "center_left", "infinitycore", 2500)
    end
end, false)

-----
-- [ /actions ]
-----
local displayActions = false
TriggerEvent('chat:addSuggestion', '/actions', 'All Actions', {})

RegisterCommand('actions', function()
    DisplayActions(not displayActions)
end, false)

function DisplayActions(bool)
    displayActions    = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type   		= "actions_ui",
        status 	 	= displayActions,
        ui 	        = nil
    })
end

RegisterNUICallback("inventory", function(data)
    DisplayActions(false)
    source        = GetPlayerServerId(PlayerId())
    local SPlayerDatas           = exports.infinity_core:GetPlayerSession(source)
    TriggerServerEvent('infinity_needs:OpenInventory', source, SPlayerDatas._Inventory)
end)

--- CLOSE FUNCT -----
RegisterNUICallback("close", function(data)
    DisplayActions(false)
end)

RegisterNUICallback("cash", function(data)
    DisplayActions(false)
    cash()
end)

RegisterNUICallback("gold", function(data)
    DisplayActions(false)
    gold()
end)

RegisterNUICallback("id", function(data)
    DisplayActions(false)
    id()
end)

RegisterNUICallback("hp", function(data)
    DisplayActions(false)
    hp()
end)

RegisterNUICallback("handsup", function(data)
    DisplayActions(false)
    ToggleRaiseHands()
end)

RegisterNUICallback("coords", function(data)
    DisplayActions(false)
    TriggerEvent("infinity_core:coords", _InfinitySource, 25)
end)

RegisterNUICallback("bandana", function(data)
    DisplayActions(false)
    Bandana()
end)

RegisterNUICallback("die", function(data)
    DisplayActions(false)
    die()
end)

function cash()
    animationSatchel()
    local PlayerDatas = GetPlayerSession(source)
    local PlayerCash  = tonumber(roundValue(PlayerDatas._Cash,2))
    exports.infinity_core:notification(source, "Your Cash", PlayerCash.." "..Config.Devise,"center_right","infinitycore",2500)
end

function gold()
    animationSatchel()
    local PlayerDatas    = GetPlayerSession(source)
    local PlayerGolds    = tonumber(roundValue(PlayerDatas._Gold,2))
    exports.infinity_core:notification(source,"Your Golds", PlayerGolds, "center_right", "infinitycore",2500)
end

function id()
    Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),3,2,GetHashKey("KIT_EMOTE_ACTION_CHECK_POCKET_WATCH_1"),0,0,0,0,0)
    Wait(1500)
    ExecuteCommand('getsession')
    source = GetPlayerServerId(PlayerId())
    exports.infinity_core:notification(_InfinitySource, "Your ID", source, "center_right", "infinitycore", 2500)
end

function hp()
    playerPed       = PlayerPedId()
    PlayerHealth    = GetEntityHealth(playerPed)
    animationSatchel()
    exports.infinity_core:notification(_InfinitySource, "Your HP", PlayerHealth, "center_right", "infinitycore", 2500)
end

function die()
    playerPed       = PlayerPedId() 
    antimationSuicide()
    Wait(1600)
    ApplyDamageToPed(playerPed, 500000, false, true, true)
    exports.infinity_core:notification(_InfinitySource, "", "You commit a suicide", "center_right", "infinitycore", 2500)
    TriggerServerEvent("infinity_core:removecash_func", playerPed, 25)
end

-----
-- [BANDANA]
-----
TriggerEvent('chat:addSuggestion', '/bandana', 'Apply a bandana in your face', {})
RegisterCommand("bandana", function(src,args,raw)
    Bandana()
end)
function Bandana()
    if bandana then
        bandana = false
    else
        bandana = true
    end
    if bandana == false then 
        Citizen.InvokeNative(0xAE72E7DF013AAA61,PlayerPedId(),GetHashKey("KIT_BANDANA"), GetHashKey("BANDANA_OFF_RIGHT_HAND"), 1, 0, -1082130432)
        Wait(1500)
        Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(), -972364774)
        Citizen.InvokeNative(0xCC8CA3E88256E58F,PlayerPedId(),0,1,1,1,false)
    else
        Citizen.InvokeNative(0xAE72E7DF013AAA61,PlayerPedId(),GetHashKey("KIT_BANDANA"), GetHashKey("BANDANA_ON_RIGHT_HAND"), 1, 0, -1082130432)
        Wait(100)
        Citizen.InvokeNative(0x1902C4CFCC5BE57C,PlayerPedId(), -1100875244)
        Citizen.InvokeNative(0xCC8CA3E88256E58F,PlayerPedId(),0,1,1,1,false)
    end
end

-----
-- [HANDSUP 0.00ms]
-----
TriggerEvent('chat:addSuggestion', '/handsup', 'Handsup your hands', {})
RegisterCommand('handsup', function(source, args, raw)
	ToggleRaiseHands()
end, false)

local dict = 'script_proc@robberies@homestead@lonnies_shack@deception'
local anim = 'hands_up_loop'
local control = false
local enabled = false
local speed = 2.0

RegisterNetEvent('handsup:toggle')
function IsUsingKeyboard(padIndex)
	return Citizen.InvokeNative(0xA571D46727E2B718, padIndex)
end

function SwitchToUnarmed()
	GiveWeaponToPed_2(PlayerPedId(), `WEAPON_UNARMED`, 0, true, false, 0, false, 0.5, 1.0, 0, false, 0.0, false)
end

function RaiseHands()
	TaskPlayAnim(PlayerPedId(), dict, anim, speed, speed, -1, 25, 0, false, false, false, '', false)
end

function LowerHands()
	StopAnimTask(PlayerPedId(), dict, anim, speed)
end

function ToggleRaiseHands()
	enabled = not enabled
	if not enabled then
		LowerHands()
	end
    if not control then 
        control = true 
    else
        control = false 
    end
    CreateThread(function()
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(1000)
        end
        while control do
            Wait(1000)
            if enabled then
                DisableControlAction(0, 0x07CE1E61, true)
                DisableControlAction(0, 0xB2F377E8, true)
                DisableControlAction(0, 0x018C47CF, true)
                DisableControlAction(0, 0x2277FAE9, true)
                SwitchToUnarmed()
                if not IsEntityPlayingAnim(PlayerPedId(), dict, anim, 25) then
                    RaiseHands()
                end
            end
        end
    end)
end
AddEventHandler('handsup:toggle', ToggleRaiseHands)
AddEventHandler('onResourceStop', function(resource)
	if GetCurrentResourceName() == resource then
		enabled = false
		LowerHands()
	end
end)

----
-- [[ DRAW COORDS IN RIGHT TOP ]]
----
RegisterNetEvent('infinity_core:coords')
AddEventHandler('infinity_core:coords', function(source)
    if coords then
        coords = false
        DisplayRadar(true)
        SetMinimapType(0)
    else
        coords = true
        DisplayRadar(true)
        SetMinimapType(Config.TypeRadarCompass)
        if not IsPedOnMount(PlayerPedId()) then 
            Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),3,2,GetHashKey("KIT_EMOTE_ACTION_CHECK_POCKET_WATCH_1"),0,0,0,0,0)
        end
        exports.infinity_core:notification(_InfinitySource, "Compass and map Watch", "You activate your compass", "center_left", "infinitycore", 2500)
    end
end)

----
-- [[ SHOW PLAYERIDS ]]
----
local ShowPlayerNames   = false
local TagDrawDistance   = 2
local ActivePlayers     = {}
local MyCoords          = vector3(0, 0, 0)
TriggerEvent('chat:addSuggestion', '/playernames', 'Show/hide player names')
RegisterCommand('playernames', function(source, args, raw)
    if ShowPlayerNames then
        ShowPlayerNames = false
    else
        ShowPlayerNames = true
        Citizen.SetTimeout(5000, function()
            ShowPlayerNames = false
        end)
    end
    Citizen.CreateThread(function()
        while ShowPlayerNames do
            if ShowPlayerNames then
                DrawTags()
                Citizen.Wait(0)
            else
                Citizen.Wait(3000)
            end
        end
    end)
    Citizen.CreateThread(function()
        while ShowPlayerNames do
            if ShowPlayerNames then
                ActivePlayers   = GetActivePlayers()
                MyCoords        = GetEntityCoords(PlayerPedId())
                Citizen.Wait(500)
            else
                Citizen.Wait(3000)
            end
        end
    end)
end, false)

local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end
		enum.destructor = nil
		enum.handle = nil
	end
}

function EnumerateEntities(firstFunc, nextFunc, endFunc)
	return coroutine.wrap(function()
		local iter, id = firstFunc()
		if not id or id == 0 then
			endFunc(iter)
			return
		end
		local enum = {handle = iter, destructor = endFunc}
		setmetatable(enum, entityEnumerator)
		local next = true
		repeat
			coroutine.yield(id)
			next, id = nextFunc(iter)
		until not next
		enum.destructor, enum.handle = nil, nil
		endFunc(iter)
	end)
end

function DrawText3D(x, y, z, text)
	local onScreen, screenX, screenY = GetScreenCoordFromWorldCoord(x, y, z)
	SetTextScale(0.35, 0.35)
	SetTextFontForCurrentCommand(1)
	SetTextColor(255, 255, 255, 223)
	SetTextCentre(1)
	DisplayText(CreateVarString(10, "LITERAL_STRING", text), screenX, screenY)
end

function GetPedCrouchMovement(ped)
	return Citizen.InvokeNative(0xD5FE956C70FF370B, ped)
end

function DrawTags()
	if ShowPlayerNames then
		for _, playerId in ipairs(ActivePlayers) do
			local ped = GetPlayerPed(playerId)
			local pedCoords = GetEntityCoords(ped)
			if #(MyCoords - pedCoords) <= TagDrawDistance and not GetPedCrouchMovement(ped) then
				local text = "ID "..GetPlayerServerId(playerId)..""
				DrawText3D(pedCoords.x, pedCoords.y, pedCoords.z + 1, text)
			end
		end
	end
end

TriggerServerEvent( "DiscordAPI:UpdateChatPermissions" )
TriggerEvent( "chat:addSuggestion", "/chattag", "Select the tag that appears beside your name.", {
    { name = "ID", help = "Chat tag ID." }
} )