-----
-- [ ANIM GOLDCOIN ]
-----
RegisterNetEvent('infinity_core:goldanim')
AddEventHandler('infinity_core:goldanim', function(source)
    Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),3,2,GetHashKey("KIT_EMOTE_ACTION_BITING_GOLD_COIN_1"),0,0,0,0,0) -- GOLD COIN   
end)

-----
-- [ ANIM SATCHEL ]
-----
function animationSatchel()
    local playerped = PlayerPedId()
    local anim      = "mech_inspection@newspaper@satchel"
    local anim02    = "enter"
    RequestAnimDict(anim)
    while not HasAnimDictLoaded(anim) do
        Wait(100)
    end
    TaskPlayAnim(playerped, anim, anim02, 8.0, -8.0, 1500, 0, 0, true, 0, false, 0, false)
	Wait(1650)
end

-----
-- [ ANIM EAT ]
-----
function antimationSuicide()
    local playerped = PlayerPedId()
    local anim      = "mech_pickup@plant@berries"
    local anim02    = "exit_eat"
    RequestAnimDict(anim)
    while not HasAnimDictLoaded(anim) do
        Wait(100)
    end
    TaskPlayAnim(playerped, anim, anim02, 8.0, -8.0, 1500, 0, 0, true, 0, false, 0, false)
end

----
-- [[ PROGRESS UI DRAW CIRCLE ]]
----
local TextureDicts = {"rpg_meter", "rpg_meter_track", "generic_textures"}
function RequestDict(dicts)
    for k, v in pairs(dicts) do
        while not HasStreamedTextureDictLoaded(v) do
            Wait(0)
            RequestStreamedTextureDict(v, true)
        end
    end
end

function DisplayProgressBar(time, desciption, cb)
    RequestDict(TextureDicts)
    local timer = (time / 100)
    local DisplayElemet = 0
    Citizen.CreateThread(function()
        while DisplayElemet < 99 do
            Wait(1)
            DrawSprite("generic_textures", "counter_bg_1b", 0.5, 0.9, 0.023, 0.04, 0.0, 0, 0, 0, 255)
            DrawSprite("rpg_meter_track", "rpg_meter_track_9", 0.5, 0.9, 0.03, 0.05, 0.0, 176, 176, 176, 120)
            DrawSprite("rpg_meter", "rpg_meter_" .. DisplayElemet, 0.5, 0.9, 0.03, 0.05, 0.0, 225, 225, 225, 255)
            Text(0.5001, 0.89, 0.28, tostring(DisplayElemet + 1), {225, 225, 225}, false, true)
            Text(0.5001, 0.93, 0.28, desciption, {255, 255, 255}, false, true)
        end
    end)
    while DisplayElemet < 100 do
        DisplayElemet = DisplayElemet + 1
        Wait(timer)
    end
end

function Text(x, y, scale, text, colour, align, force, w)
    local colour = colour or Config.GUI.TextColor
    local str = CreateVarString(10, "LITERAL_STRING", text)
    SetTextFontForCurrentCommand(7)
    SetTextScale(scale, scale)
    Citizen.InvokeNative(1758329440 & 0xFFFFFFFF, align)
    SetTextColor(colour[1], colour[2], colour[3], 255)
    if w then Citizen.InvokeNative(1868606292 & 0xFFFFFFFF, w.x, w.y) end
    SetTextDropshadow(3, 0, 0, 0, 255)
    DisplayText(str, x, y)
end