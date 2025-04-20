----
-- [[ infinitycoreFunction SetSession ]]
----
function infinitycore(self)
    Citizen.CreateThread(function()
        while not stop_session do
            if NetworkIsSessionStarted() then
					source = GetPlayerServerId(PlayerId())
                	TriggerEvent('infinitycore:SetSession', source)
					stop_session = true
                break
            end
        end
    end)
end
infinitycore(self)

function roundValue(number, decimals)
    local power = 10 ^ decimals
    return math.floor(number * power) / power
end

----
-- [[ SetSource infinitycore ]]
----
RegisterNetEvent('infinitycore:SetSession')
AddEventHandler('infinitycore:SetSession', function(source)
	_InfinitySource = GetPlayerServerId(PlayerId())
end)

----
-- [[ GetPlayerSession Current ]]
----
RegisterNetEvent('infinityCoreSession')
AddEventHandler('infinityCoreSession', function(lastname, firstname, years, nation, rank)
    PlayerCore = {}
    PlayerCore = {
        lastname    = lastname, 
		firstname   = firstname,
		years		= years,
		nation		= nation,
        rank        = rank
    }
    return PlayerCore
end)

----
-- [[ Gamemode on start ]]
----
AddEventHandler("onClientResourceStart", function()

	-- Reveal map
	if Config.MapReveal then
		Citizen.InvokeNative(0x4B8F743A4A6D2FF8, true)
	end

	-- Show the radar
	if Config.DisplayRadar then 
		DisplayRadar(true)
	end

	-- Enable PVP
	if Config.EnablePVP then
		SetPedRelationshipGroupHash(PlayerPedId(), GetHashKey("PLAYER"))
		SetRelationshipBetweenGroups(3, GetHashKey("PLAYER"), GetHashKey("PLAYER"))
		NetworkSetFriendlyFireOption(true)
		-- SetRelationshipBetweenGroups(5, `PLAYER`, `PLAYER`)
	end

    -- Snow map
	if Config.MapSnow then
		Citizen.CreateThread(function()
			SetRandomWeatherType(false, false)
			Wait(500)
			SetSnowLevel(-1)
			SetSnowCoverageType(3)
			Wait(500)
			SetWeatherType()
		end)
		function SetSnowCoverageType(type)
			return Citizen.InvokeNative(0xF02A9C330BBFC5C7, type)
		end
		function SetSnowLevel(type)
			return Citizen.InvokeNative(0xF6BEE7E80EC5CA40, type)
		end
		function SetWeatherType()
			Citizen.InvokeNative(0x59174F1AFE095B5A, GetHashKey('SNOW'), false, true, true, 60.0, false)
			Citizen.InvokeNative(0xD74ACDF7DB8114AF, true)
		end
	end

end)

----
-- [[ RDO CHALLENGES ]]
----
if Config.DisableRDOnotify then
	Citizen.CreateThread(function()
		while true do
			
			Citizen.Wait(10)

			if IsControlJustReleased(0, 0xC1989F95) then
				_InfinitySource        = GetPlayerServerId(PlayerId())
				local SPlayerDatas   = exports.infinity_core:GetPlayerSession(_InfinitySource)
				TriggerServerEvent('infinity_needs:OpenInventory', _InfinitySource, SPlayerDatas._Inventory)
			end

			local size = GetNumberOfEvents(0)   
			if size > 0 then
				for i = 0, size - 1 do
					local eventRDO = GetEventAtIndex(0, i)
					if eventRDO == GetHashKey("EVENT_CHALLENGE_GOAL_COMPLETE") 
					or eventRDO == GetHashKey("EVENT_CHALLENGE_REWARD") 
					or eventRDO == GetHashKey("EVENT_DAILY_CHALLENGE_STREAK_COMPLETED") then 
						Citizen.InvokeNative(0x6035E8FBCA32AC5E)
					end
				end
			end
		end
	end)
end