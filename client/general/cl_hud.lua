RegisterNetEvent('infinity_core:stopSession')
AddEventHandler('infinity_core:stopSession', function(source)
    stopped = true
    return stopped
end)

-----
-- [ KILL COUNTER + GUARMA CHECKER ]
-----
local kill = 0
RegisterNetEvent('infinity_core:killcounter')
AddEventHandler('infinity_core:killcounter', function(source, total)
    kill = total
end)
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
    return x >= 0 and y <= -4096
end

-----
-- [ CORE HUD PLAYER ]
-----
RegisterNetEvent('infinity_core:loadDatasPlayer')
AddEventHandler('infinity_core:loadDatasPlayer', function(source)
    Citizen.CreateThread(function()

        --- INITIALIZE ACCOUNT PLAYER IN WORLD ---
        AnimpostfxPlay("skytl_0000_04storm")
        Wait(3500)
        AnimpostfxPlay("skytl_0300_01clear")
        exports.infinity_core:notification(_InfinitySource, Config.Welcome, Config.SubWelcome, 'center_center', 'redm_min', 7000)
        -- PLAYER SPAWN AND SET ATTRIBUTES
        SetEntityCoords(PlayerPedId(), 1624.14 , -7159.11 , 76.98 -1) -- TP INITIAL SECURED
        FreezeEntityPosition(PlayerPedId(), true) -- Freeze
        SetPlayerInvincible(PlayerPedId(), true)  -- Invincible
        -- TELEPORT TO GUARMA FIRST SPAWN
        SetGuarmaWorldhorizonActive(true)
        SetWorldWaterType(1)
        SetWorldMapType(`guarma`)
        --

        -- // Core icons
        if Config.DisplayIconsCore then
            Citizen.InvokeNative(0xC116E6DF68DCE667, 4, 2)          -- Disable HP Core Outside
            Citizen.InvokeNative(0xC116E6DF68DCE667, 5, 2)          -- Disable HP Core Inside
            Citizen.InvokeNative(0xC116E6DF68DCE667, 0, 1)          -- Enable Stamina Core Inside
            Citizen.InvokeNative(0xC116E6DF68DCE667, 1, 1)          -- Show Stamina Core Outside
        end

        local currentBonusStamina   = Config.StaminaIncreaseValue

        while NetworkIsSessionStarted() do

                -- // No regen the life
                if Config.DisableAutoRegen then
                    SetPlayerHealthRechargeMultiplier(PlayerId(), 0)
                end

                -- // Disable cores concern dead eye
                if Config.DisableDeadEyes then
                    Citizen.InvokeNative(0xC116E6DF68DCE667, 2, 2)  -- disable deadeye inside
                    Citizen.InvokeNative(0xC116E6DF68DCE667, 3, 2)  -- disable deadeye outside
                end

                if not spawnedFirst then
                    SetMinimapType(Config.TypeRadar)
                    Firsthealth                     = 100
                    spawnedFirst                    = true
                end

                local temperature           = exports.infinity_needs:Temp_Metabolism()    -- return temperature
                local p_coords              = GetEntityCoords(PlayerPedId())            -- get coords
                local p_heading             = GetEntityHeading(PlayerPedId())           -- get heading
                Gethealth                   = GetEntityHealth(PlayerPedId())

                if not hudAreSet then
                    hudAreSet = true
                    TriggerServerEvent('infinity_core:DatasPlayer', _InfinitySource, temperature, kill) -- (SQL REQUEST X1)
                end

                if hudAreSet and lifeisSet and Playing then
                    TriggerServerEvent("infinity_core:save_pos", _InfinitySource, p_coords.x, p_coords.y, p_coords.z, p_heading, water, eat, Gethealth, CharID)
                end

                -- // Stamina Restore enabled
                if Config.RestoreStamina then
                    local addstamina = GetAttributeCoreValue(PlayerPedId(), 1) + currentBonusStamina
                    Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, addstamina)
                    local a2 = DataView.ArrayBuffer(12* 8)
                    local a3 = DataView.ArrayBuffer(12* 8)
                    Citizen.InvokeNative("0xCB5D11F9508A928D", 1, a2:Buffer(), a3:Buffer(), GetHashKey("UPGRADE_STAMINA_TANK_1"), 1084182731, Config.MaxCoreStamina, 752097756)
                end

                if hudAreSet and not lifeisSet and initialhp and Playing then
                    Wait(655)
                    SetEntityHealth(PlayerPedId(), initialhp)
                    health                   = exports.infinity_needs:Health_Metabolism(initialhp)
                    eat                      = exports.infinity_needs:Eat_Metabolism(initialEat)
                    water                    = exports.infinity_needs:Water_Metabolism(initialWater)
                    lifeisSet                = true
                elseif lifeisSet and hudAreSet and Playing then
                    Gethealth               = exports.infinity_needs:Health_Metabolism(Gethealth)
                    eat                     = exports.infinity_needs:Eat_Metabolism(eat)
                    water                   = exports.infinity_needs:Water_Metabolism(water)
                    TriggerServerEvent('infinity_core:DatasPlayerClient', _InfinitySource, Gethealth, temperature, water, eat, kill)
                end

            Citizen.Wait(1700)
        end
    end)
end)

-----
-- [ LOAD IDENTITY AND SKIN/CLOTHES ]
-----
function LoadIdentity(_InfinitySource, CharSelected)
    TriggerServerEvent("infinity_skin:LoadSkin", CharSelected)
end

-----
-- [ FIRST SPAWN DATAS INIT SESSION PLAY ]
-----
RegisterNetEvent('infinity_core:hudDatas')
AddEventHandler('infinity_core:hudDatas', function(bank, cash, golds, xp, hp, temperature, eat, water, coordinates, CharSelected)

    local playerPed = GetPlayerPed(-1)
    initialhp       = hp
    initialEat      = eat
    initialWater    = water
    MoneyClass      = cash
    GoldClass       = golds
    XPClass         = xp
    CharID          = CharSelected

    -- Enable Hud with current data from DB
    SetDisplayHud(not display, cash, golds, xp, initialhp, temperature, water, eat, kill, CharSelected, _InfinitySource) -- Set Hud

    -- Load Identity and make Session with Clothes and Skin
    LoadIdentity(_InfinitySource, CharSelected)

    -- Disable Immunity
    FreezeEntityPosition(PlayerPedId(), false)
    SetPlayerInvincible(PlayerPedId(), false)

    -- Teleport player to the last position
    SetEntityCoords( PlayerPedId(), tonumber(coordinates.x), tonumber(coordinates.y), tonumber(coordinates.z) )

    -- Animations
    AnimpostfxPlay("Title_Gen_FewHoursLater")
    Playing         = true
    Wait(1500)
    DoScreenFadeIn(6500)
    DisplayHud(true)
    DisplayRadar(true)
end)

function SetDisplayHud(bool, cash, golds, xp, initialhp, temperature, water, eat, kill, CharSelected, _InfinitySource)
    SendNUIMessage({
        type        = "ui",
        status      = bool,
        cash        = cash,
        golds       = golds,
        xp          = xp,
        hp          = initialhp,
        temperature = temperature,
        water       = water,
        eat         = eat,
        kill        = kill,
        CharID      = CharID,
        id          = GetPlayerServerId(PlayerId())
    })
end

-----
-- [ DATAS LOOPED ]
-----
RegisterNetEvent('infinity_core:hudDatasClient')
AddEventHandler('infinity_core:hudDatasClient', function(hp, temperature, water, eat, kill, session)
    SetDisplayHudClient(not display, hp, temperature, water, eat, kill, session)
    HPClass    = hp
    TempClass  = temperature
    WaterClass = water
    EatClass   = eat
    KillClass  = kill
    session    = session
end)

function SetDisplayHudClient(bool, hp, temperature, water, eat, kill, session)
    SendNUIMessage({
        type        = "ui",
        status      = bool,
        cash        = MoneyClass,
        golds       = GoldClass,
        xp          = XPClass,
        hp          = hp,
        temperature = temperature,
        water       = water,
        eat         = eat,
        kill        = kill,
        id          = GetPlayerServerId(PlayerId()),
        hiddenUi    = hideUI,
        session     = session
    })
end

-----
-- [ CORE HUD LOCAL refresh by server ]
-----
RegisterNetEvent('infinity_core:hudDatasFromServer')
AddEventHandler('infinity_core:hudDatasFromServer', function(cash, golds, xp)
    SetDisplayFromServer(not display, cash, golds, xp)
    MoneyClass = cash
    GoldClass  = golds
    XPClass    = xp
    WaterClass = water
    EatClass   = eat
end)

function SetDisplayFromServer(bool, cash, golds, xp)
    SendNUIMessage({
        type        = "ui",
        status      = bool,
        cash        = MoneyClass,
        golds       = GoldClass,
        xp          = XPClass,
        hp          = HPClass,
        temperature = TempClass,
        water       = WaterClass,
        eat         = EatClass,
        kill        = KillClass
    })
end

-----
-- [ LEVEL/XP MANAGER ]
-----
function LevelPlayer(XPClass)
    local levelsData = LoadResourceFile(GetCurrentResourceName(), "/shared/levels.json")
    if not levelsData then
        print("[LevelPlayer] levels.json missing or unreadable")
        return 1, XPClass or 0
    end
    local extract = json.decode(levelsData)
    if not extract or not extract.levels then
        print("[LevelPlayer] levels.json malformed or missing 'levels' key")
        return 1, XPClass or 0
    end
    local Level = 1
    for i, json in pairs(extract.levels) do
        if XPClass ~= nil then
            if tonumber(XPClass) >= tonumber(json.exp) and tonumber(json.explimit) > tonumber(XPClass) then
                Level = tonumber(json.lvl) or 1
                break
            end
        end
    end
    return Level, XPClass or 0
end

function XpReturn()
    local PlayerDatas = GetPlayerSession and GetPlayerSession() or nil
    local XPClass = PlayerDatas and tonumber(PlayerDatas._Xp) or 0
    local Level, XP = LevelPlayer(XPClass)
    return Level or 1, XP or 0
end
