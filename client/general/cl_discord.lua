-----
-- [ DISCORD RICH PRESENCE ]
-----
SetDiscordAppId(Config.DiscordAppID)
Citizen.CreateThread(function()
	while true do

		SetDiscordRichPresenceAsset(Config.discordImageName) 
		SetDiscordRichPresenceAssetText(Config.hoverText) 
		SetDiscordRichPresenceAssetSmall(Config.smallDiscordImageName)
		SetDiscordRichPresenceAssetSmallText(Config.smallHoverText)
		SetDiscordRichPresenceAction(0, Config.button1.text, Config.button1.url)
		SetDiscordRichPresenceAction(1, Config.button2.text, Config.button2.url)
		SetDiscordRichPresenceAction(1, Config.button3.text, Config.button3.url)
		
		local TownName 		= GetTownPlayer()
		local PlayerID 		= GetPlayerServerId(PlayerId())

		if TownName == nil then 
			SetRichPresence(Config.richPresenceText) 
		elseif TownName ~= nil and PlayerDatas ~= nil then 
			SetRichPresence("[ID: " .. PlayerID .."] Explore "..TownName) 
		end

		Citizen.Wait(15000)
	end
end)