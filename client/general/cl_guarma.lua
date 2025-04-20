function SetGuarmaWorldhorizonActive(toggle)
    Citizen.InvokeNative(0x74E2261D2A66849A , toggle)
end
function SetWorldWaterType(waterType)
    Citizen.InvokeNative(0xE8770EE02AEE45C2, waterType)
end
function SetWorldMapType(mapType)
    Citizen.InvokeNative(0xA657EC9DBC6CC900, mapType)
end
function IsInGuarma()
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
    if x >= 0 and y <= -4096 then 
        SetGuarmaWorldhorizonActive(true)
        SetWorldWaterType(1)
        SetWorldMapType(`guarma`)
    else
        SetGuarmaWorldhorizonActive(false)
        SetWorldWaterType(0)
        SetWorldMapType(`world`)
    end
end
---
-- [[ GUARMA TO ST DENIS/ VICE VERSA ]]
---
local HasAlreadyEnteredMarkerGuarma     = false
local TimerGuarma                       = 7000
local notificationSendGuarma            = false
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(TimerGuarma)
		local playerPed   = PlayerPedId()
		local coords      = GetEntityCoords(playerPed)
        local TypeZone    = nil
        local IsInMarkerGuarma  = false
        local GuarmaMode        = false

        if IsInGuarma() then
            if not GuarmaMode then
                GuarmaMode = true
            end
        else
            if GuarmaMode then
                GuarmaMode = false
            end
        end

        if GetDistanceBetweenCoords(coords, 1270.98 , -6854.99 , 43.31, true) <= 10.0 then
            IsInMarkerGuarma  = true
            TimerGuarma       = 655
            if not notificationSendGuarma then
                notificationSendGuarma = true
                SetCinematicModeActive(true)
                FreezeEntityPosition(PlayerPed, true)
                DoScreenFadeOut(3000)
                Wait(3000)
                SetEntityCoords(playerPed, 2780.1 , -1522.73 , 45.9) 
                DoScreenFadeIn(500)
                Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, 'Saint-Denis', 'Transfert', 'Your boat is navigate to Saint-Denis...')
                Citizen.InvokeNative(0x74E2261D2A66849A, 0)
                Citizen.InvokeNative(0xA657EC9DBC6CC900, -1868977180)
                Citizen.InvokeNative(0xE8770EE02AEE45C2, 0)
                Wait(5000)
                FreezeEntityPosition(PlayerPed, false)
                ShutdownLoadingScreen()
                SetCinematicModeActive(false)
            end
        end

        if GetDistanceBetweenCoords(coords, 2782.19 , -1535.7 , 48.55, true) <= 5.0 then
            IsInMarkerGuarma  = true
            TimerGuarma       = 655
            if not notificationSendGuarma then
                notificationSendGuarma = true
                SetCinematicModeActive(true)
                FreezeEntityPosition(PlayerPed, true)
                DoScreenFadeOut(3000)
                Wait(3000)
                SetEntityCoords(playerPed, 1286.51 , -6863.72 , 43.17) 
                DoScreenFadeIn(500)
                Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, 'Guarma', 'Transfert', 'Your boat is navigate to Guarma...')
                Citizen.InvokeNative(0xA657EC9DBC6CC900, 1935063277)
                Citizen.InvokeNative(0xE8770EE02AEE45C2, 1) 
                Citizen.InvokeNative(0x74E2261D2A66849A, true) 
                Wait(5000)
                FreezeEntityPosition(PlayerPed, false)
                ShutdownLoadingScreen()
                SetCinematicModeActive(false)
            end
        end

        if IsInMarkerGuarma and not HasAlreadyEnteredMarkerGuarma then
			HasAlreadyEnteredMarkerGuarma = true
		end

        if not IsInMarkerGuarma and HasAlreadyEnteredMarkerGuarma then
			TimerGuarma                   = 7000
			HasAlreadyEnteredMarkerGuarma = false
            notificationSendGuarma        = false
		end

	end
end)

---
-- [[ BLIP TRAVEL GUARMA ]]
---
Citizen.CreateThread(function()
    BLIP_GUARMA = N_0x554d9d53f696d002(1664425300, 1270.98 , -6854.99 , 43.31)
    SetBlipSprite(BLIP_GUARMA, 2033397166, 1)
    SetBlipScale(BLIP_GUARMA, 1.0)
    Citizen.InvokeNative(0x9CB1A1623062F402, BLIP_GUARMA, "BOAT TRAVEL")
    BLIP_STD = N_0x554d9d53f696d002(1664425300, 2782.19 , -1535.7 , 48.55)
    SetBlipSprite(BLIP_STD, 2033397166, 1)
    SetBlipScale(BLIP_STD, 1.0)
    Citizen.InvokeNative(0x9CB1A1623062F402, BLIP_STD, "BOAT TRAVEL")
end)

---
-- [[ RESTART FUNC ]]
---
AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
    return
    end
    RemoveBlip(BLIP_GUARMA)
    RemoveBlip(BLIP_STD)
end)