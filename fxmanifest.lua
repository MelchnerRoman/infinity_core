--[[---------------------------------------------------------------------------------------------------------
	# CORETEAM: Shepard, iiRedDev
	# INFINITY 1.0.0
]]------------------------------------------------------------------------------------------------------------

game 		 		'rdr3'
fx_version 	 		'cerulean'
rdr3_warning 		'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
author 	     		'ALTITUDE-DEV.COM'
description  		'FRAMEWORK INFINITY'
version 	 		'1.0.0'
lua54 'yes'
infinitycore_dev 	 'Shepard & iireddev'


ui_page "html/core.html"

shared_scripts {
    "config_server.lua",
    "shared/api.lua"
}

files {
    'html/core.html',
	'html/parts/*.html',
    'html/*.js',
	'html/*.png',
	'html/items/*.png',
	'html/fonts/*.eot',
	'html/fonts/*.ttf',
	'html/fonts/*.woff',
	'html/fonts/*.woff2',
	'html/vendor/menu/*.js',
	'html/vendor/*.js',
	'html/vendor/*.css',
    'html/*.css',
	'shared/levels.json'
}

client_scripts {
	'config_server.lua',
	'lang/*.lua',
	'config_discord.lua',
	'shared/permissions.lua',
	'shared/dataview.lua',
	'client/general/cl_functions.lua',
	'client/cl_framework.lua',
	'client/cl_callback.lua',
	'client/general/cl_player_core.lua',
	'client/general/cl_notifications.lua',
	'client/general/cl_hud.lua',
	'client/general/cl_respawn.lua',
	'client/general/cl_guarma.lua',
	'client/general/cl_player_actions.lua',
	'client/general/cl_animations.lua',
	'client/general/cl_admin_cmd.lua',
	'client/general/cl_world.lua',
	'communication/chat/cl_chat.lua',
	'client/general/cl_discord.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config_server.lua',
	'config_discord.lua',
	'lang/*.lua',
	'shared/permissions.lua',
	'server/*.lua',
	-- 'server/sv_player_core.lua',
	-- 'server/sv_player_init.lua',
	-- 'server/sv_player_session.lua',
	-- 'server/sv_player_economy.lua',
	-- 'server/sv_admin_cmd.lua',
	-- 'server/sv_triggers.lua',
	-- 'server/sv_callback.lua',
	'communication/discord/sv_*.lua',
	'communication/chat/sv_chat.lua'
}

exports {
	'notification',
	'XpReturn',
	'PlayerArround',
	'GetPlayerSession',
	'getSex',
	'infinityPrint',
	'GetTownPlayer',
	'RandomInt',
    -- Callbacks Infinity
    'RegisterClientCallback',
    'TriggerServerCallback',
    'TriggerSyncServerCallback',
    'TriggerAwaitServerCallback'
}

server_exports {
	'notification',
	'GetPlayerSource',
	'GetPlayerTarget',
	'AddCash',
	'AddXP',
	'AddGold',
	'RemoveCash',
	'RemoveXP',
	'RemoveGold',
	'GetPlayerSession',
	'GetPlayerTargetSession',
	'XpReturn',
	'getRoles',
    'isRolePresent',
	'infinityPrint',
	'RandomInt',
	'roundValue',
    -- Callbacks Infinity
    'RegisterServerCallback',
    'TriggerClientCallback',
    'TriggerSyncClientCallback',
    'TriggerAwaitClientCallback'
}

dependency {'oxmysql', '/onesync'}

-- For Protect the work and get a updates by a team benevol
-- COPYRIGHT https://data.inpi.fr/marques/FR4856753?q=altitude%20dev#FR4856753
-- Only 2 files are locked by CFX for protect the Framework Core API, you dont need this files
