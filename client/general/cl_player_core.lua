PlayerDatas = {}
----
-- [[ PLAYER LOADED MAKE SESSION_DATAS ]]
----
RegisterNetEvent("infinitycore:playerLoaded")
AddEventHandler("infinitycore:playerLoaded", function(_InfinityCharID, _InfinityRank, _InfinityLastname, _InfinityFirstname, _InfinityYears, 
_InfinityNation, _InfinitySex, _InfinityBank, _InfinityCash, _InfinityXP, _InfinityGold, _InfinityJob, _InfinityJobGrade, _InfinityGang, _InfinityGangRank, _InfinityInventory)
    if _InfinityCharID ~= nil then 

        _Charid     = _InfinityCharID
        _Rank       = _InfinityRank
        _Lastname   = _InfinityLastname
        _Firstname  = _InfinityFirstname
        _Years      = _InfinityYears
        _Nation     = _InfinityNation
        _Sex        = _InfinitySex
        _Bank       = _InfinityBank
        _Cash       = _InfinityCash
        _Gold       = _InfinityGold
        _Xp         = _InfinityXP
        _OldXp      = _InfinityXP
        _OldCash    = _InfinityCash
        _OldGold    = _InfinityGold
        _Job        = _InfinityJob
        _JobGrade   = _InfinityJobGrade
        _Gang       = _InfinityGang
        _GangRank   = _InfinityGangRank
        _Inventory  = _InfinityInventory

        if _Lastname == nil then 
            _Lastname = "" 
        end
        if _Firstname == nil then 
            _Firstname = "" 
        end
        if _Years == nil then 
            _Years = ""
        end
        if _Job == nil then 
            _Job = ""
        end
        if _Rank == nil then 
            _Rank = "player"
        end
        if _JobGrade == nil then 
            _JobGrade = ""
        end
        if _Years == nil then 
            _Years = ""
        end
        if _Nation == nil then 
            _Nation = ""
        end
        if _Sex == nil then 
            _Sex = "male"
        end
        if _Gold == nil then 
            _Gold = 0
        end
        if _Xp == nil then 
            _Xp = 0
        end
        if _Cash == nil then 
            _Cash = 0
        end
        if _Bank == nil then 
            _Bank = 0
        end
        if _Gang == nil then 
            _Gang = ""
        end
        if _GangRank == nil then 
            _GangRank = 1
        end
        return _InfinitySource, _Charid, _Rank, _Lastname, _Firstname, _Years, _Nation, _Sex, _Bank, _Cash, _Xp, _OldXp, _OldCash, _Gold, _OldGold, _Job, _JobGrade, _Inventory
    end
end)

-----
-- [ REFRESH SESSION DATAS ]
-----
RegisterNetEvent("infinitycore:RefreshPlayerDatas")
AddEventHandler("infinitycore:RefreshPlayerDatas", function(_InfinityCharID, _InfinityBank, _InfinityCash, _InfinityXP, _InfinityGold, _InfinityJob, _InfinityJobGrade, _InfinityGang, _InfinityGangRank, _InfinityInventory, _Action)
 
    if _InfinityXP and _Action ~= "refresh" then
        if _Action == "add" and tonumber(_InfinityXP) >= 1 then 
            NewValues   = tonumber(_Xp) + tonumber(_InfinityXP)
            _Xp         = tonumber(NewValues)
        end
        if _Action == "remove" and tonumber(_InfinityXP) >= 1 then 
            NewValues   = tonumber(_Xp) - tonumber(_InfinityXP)
            _Xp         = tonumber(NewValues)
        end
    end

    if _InfinityGold then
        if _Action == "add" and tonumber(_InfinityGold) >= 0.1 then 
            NewValues   = tonumber(_Gold) + tonumber(_InfinityGold)
            _Gold         = tonumber(NewValues)
        end
        if _Action == "remove" and tonumber(_InfinityGold) >= 0.1 then 
            NewValues   = tonumber(_Gold) - tonumber(_InfinityGold)
            _Gold       = tonumber(NewValues)
        end
    end

    if _InfinityCash then
        if _Action == "add" and tonumber(_InfinityCash) >= 0.01 then 
            NewValues   = tonumber(_Cash) + tonumber(_InfinityCash)
            _Cash         = tonumber(NewValues)
        end
        if _Action == "remove" and tonumber(_InfinityCash) >= 0.01 then 
            NewValues   = tonumber(_Cash) - tonumber(_InfinityCash)
            _Cash       = tonumber(NewValues)
        end
    end

    if _InfinityBank then
        if _Action == "add" and tonumber(_InfinityBank) >= 0.01 then 
            NewValues     = tonumber(_Bank) + tonumber(_InfinityBank)
            _Bank         = tonumber(NewValues)
        end
        if _Action == "remove" and tonumber(_InfinityBank) >= 0.01 then 
            NewValues   = tonumber(_Bank) - tonumber(_InfinityBank)
            _Bank       = tonumber(NewValues)
        end
    end

    if _Action == "refresh" then 
        _Bank       = _InfinityBank
        _Cash       = _InfinityCash
        _Xp         = _InfinityXP
        _Gold       = _InfinityGold
        _Job        = _InfinityJob
        _JobGrade   = _InfinityJobGrade
    end

    if _Action == "setxp" then 
        _Xp    = tonumber(_InfinityXP)
    end

    if _Action == "setcash" then 
        _Cash   = tonumber(_InfinityCash)
    end

    if _Action == "setgold" then 
        _Gold   = tonumber(_InfinityGold)
    end

    if _Action == "setjob" then 
        _Job          = _InfinityJob
        _JobGrade     = _InfinityJobGrade
    end

    if _Action == "setgang" then 
        _Gang          = _InfinityGang
        _GangRank      = _InfinityGangRank
    end

    if _Action == "inv" then 
        _Inventory = _InfinityInventory
    end

    if _Cash ~= nil then 
        local PlayerDatas = {
            _InfinitySource = _InfinitySource,
            _Charid       = _InfinityCharID,
            _Rank         = _Rank,
            _Lastname     = _Lastname,
            _Firstname    = _Firstname, 
            _Years        = _Years,
            _Nation       = _Nation,
            _Sex          = _Sex,
            _Bank         = _Bank,
            _Cash         = _Cash,
            _Xp           = _Xp,
            _Gold         = _Gold,
            _Job          = _Job,
            _JobGrade     = _JobGrade,
            _Gang         = _Gang,
            _GangRank     = _GangRank,
            _Inventory    = _Inventory
        }
        TriggerServerEvent('infinity_core:refreshServerSession', PlayerDatas)
    end
    
    return _Cash, _Xp, _Gold, _Bank
end)

----
-- [[ EXPORTS CLIENTSIDE ]] 
----
function GetPlayerSession(id)
    local PlayerDatas = {
        _InfinitySource = GetPlayerServerId(PlayerId()),
        _Charid       = _Charid,
        _Rank         = _Rank,
        _Lastname     = _Lastname,
        _Firstname    = _Firstname, 
        _Years        = _Years,
        _Nation       = _Nation,
        _Sex          = _Sex,
        _Bank         = _Bank,
        _Cash         = _Cash,
        _Xp           = _Xp,
        _Gold         = _Gold,
        _Job          = _Job,
        _JobGrade     = _JobGrade,
        _Gang         = _Gang,
        _GangRank     = _GangRank,
        _Inventory    = _Inventory
    }
    return PlayerDatas
end

function SetSessionSource(_InfinitySource)
    source          = _InfinitySource
    _InfinitySource   = source 
    return _InfinitySource
end

-----
-- [ SAVE IN SQL DATAS ]
-----
Citizen.CreateThread(function()
    while true do
        Citizen.Wait((1000 * 60) * Config.IntervalSaveSQL)
        local p_coords   = GetEntityCoords(PlayerPedId())
        local SaveDatas = {
            _InfinitySource = _InfinitySource,
            _Charid = _Charid,
            _Rank = _Rank,
            _Lastname = _Lastname,
            _Firstname = _Firstname,
            _Years = _Years,
            _Nation = _Nation,
            _Sex = _Sex,
            _Bank = _Bank,
            _Cash = _Cash,
            _Xp = _Xp,
            _Gold = _Gold,
            HPClass = HPClass,
            WaterClass = WaterClass,
            EatClass = EatClass,
            p_coords_x = p_coords.x,
            p_coords_y = p_coords.y,
            p_coords_z = p_coords.z,
            p_coords_h = GetEntityHeading(PlayerPedId()),
            _Job = _Job,
            _JobGrade = _JobGrade,
            _Gang = _Gang,
            _GangRank = _GangRank,
            _Inventory = _Inventory
        }
        if _InfinitySource and HPClass then
            TriggerServerEvent('SavePlayerDatas', SaveDatas)
        end
    end
end)

----
-- [[ MAKE LAUNCH SESSION STARTED ]]
----
local FirstSpawnEvent = false
Citizen.CreateThread(function()
    while FirstSpawnEvent == false do
        spawned = Citizen.InvokeNative(0xB8DFD30D6973E135, PlayerPedId(), Citizen.ResultAsInteger())
        Wait(1000)
        if spawned then
            FirstSpawnEvent = true
            exports.spawnmanager:setAutoSpawn(false)
            Wait(1000)
            _InfinitySource = GetPlayerServerId(PlayerId())
            SetSessionSource(_InfinitySource)
            Citizen.InvokeNative(0x08797a8c03868cb8, 6.0)
            Citizen.InvokeNative(0xec8703e4536a9952)
            -- Citizen.InvokeNative(0x2A32FAA57B937173,6.0)
            Citizen.InvokeNative(0x58125b691f6827d5,6.0)
            TriggerEvent('infinity_core:loadDatasPlayer', _InfinitySource)
        end
    end
end)