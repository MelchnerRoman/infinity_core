----
-- [[ NOTIFICATION CORE ]]
----
RegisterNetEvent('infinity_core:notification')
AddEventHandler('infinity_core:notification', function(title, text, position, design, duration)
    NuiProcess(title, text, position, design, duration)
end)

function notification(target, title, text, position, design, duration)
	TriggerServerEvent('infinity_core:notification', target, title, text, position, design, duration)
end

function NuiProcess(title, text, position, design, duration)
	if not duration then
		duration = 2500
	end
	SendNUIMessage({
		type        = 'SendNotification',
		title       = title,
		text        = text,
		duration    = duration,
		position	= position,
		design		= design
	})
end

exports("notification", notification)
RegisterNetEvent('notification:notification')