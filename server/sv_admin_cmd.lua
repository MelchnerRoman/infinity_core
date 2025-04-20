----
-- [[ /clearchat ]]
----
RegisterCommand("clearchat", function(source, args) 
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.PermClearChat01 or rankAdmin == Config.PermClearChat02 then
        TriggerClientEvent("chat:clear", -1)
    end
end, true)

----
-- [[ /kill id ]]
----
RegisterCommand("kill", function(source, args) 
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.PermKillPlayer01 or rankAdmin == Config.PermKillPlayer02 then
        TriggerClientEvent("infinity_core:kill", args[1])
    end
end, true)

----
-- [[ /revive id ]]
----
RegisterCommand("revive", function(source, args) 
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.PermRevivePlayer01 or rankAdmin == Config.PermRevivePlayer02 then
        if args[1] ~= nil then
            TriggerClientEvent("infinity_core:revive", args[1])
        end
    end
end, true)

----
-- [[ /setcash id amount ]]
----
RegisterCommand("setcash", function(source, args, rawCommand)
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.PermManageCash01 or rankAdmin == Config.PermManageCash02 then
        if args[1] == nil or args[2] == nil then
            exports.infinity_core:notification(source,"Wrong Command", Config.Lang_BadArguments, "center_bottom", "redm_min", 1500)
        else
            TriggerEvent("infinity_core:setCash", source, args[1], args[2],  
            function(cb)
            end)
        end
    end
end, true)

----
-- [[ /addcash id amount ]]
----
RegisterCommand("addcash", function(source, args, rawCommand)
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.PermManageCash01 or rankAdmin == Config.PermManageCash02 then
        if args[1] == nil or args[2] == nil then
            exports.infinity_core:notification(source,"Wrong Command", Config.Lang_BadArguments, "center_bottom", "redm_min", 1500)
        else
            TriggerEvent("infinity_core:addCash", source, args[1], args[2])
        end
    end
end, true)

----
-- [[ /addcashbank id amount ]]
----
RegisterCommand("addcashbank", function(source, args, rawCommand)
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.PermManageCash01 or rankAdmin == Config.PermManageCash02 then
        if args[1] == nil or args[2] == nil then
            exports.infinity_core:notification(source,"Wrong Command", Config.Lang_BadArguments, "center_bottom", "redm_min", 1500)
        else
            TriggerEvent("infinity_core:addCashBank", source, args[1], args[2])
        end
    end
end, true)

----
-- [[ /removecash id amount ]]
----
RegisterCommand("removecash", function(source, args, rawCommand)
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.PermManageCash01 or rankAdmin == Config.PermManageCash02 then
        if args[1] == nil or args[2] == nil then
            exports.infinity_core:notification(source,"Wrong Command", Config.Lang_BadArguments, "center_bottom", "redm_min", 1500)
        else
            TriggerEvent("infinity_core:removeCash", source, args[1], args[2],  
            function(cb)
            end)
        end
    end
end, true)

----
-- [[ /setxp id amount ]]
----
RegisterCommand("setxp", function(source, args, rawCommand)
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.PermManageXp01 or rankAdmin == Config.PermManageXp02 then
        if args[1] == nil or args[2] == nil then
            exports.infinity_core:notification(source,"Wrong Command", Config.Lang_BadArguments, "center_bottom", "redm_min", 1500)
        else
            TriggerEvent("infinity_core:setXP", source, args[1], args[2],  
            function(cb)
            end)
        end
    end
end, true)

----
-- [[ /addxp id amount ]]
----
RegisterCommand("addxp", function(source, args, rawCommand)
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.PermManageXp01 or rankAdmin == Config.PermManageXp02 then
        if args[1] == nil or args[2] == nil then
            exports.infinity_core:notification(source,"Wrong Command", Config.Lang_BadArguments, "center_bottom", "redm_min", 1500)
        else
            TriggerEvent("infinity_core:addXP", source, args[1], args[2],  
            function(cb)
            end)
        end
    end
end, true)

----
-- [[ /removexp id amount ]]
----
RegisterCommand("removexp", function(source, args, rawCommand)
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.PermManageXp01 or rankAdmin == Config.PermManageXp02 then
        if args[1] == nil or args[2] == nil then
            exports.infinity_core:notification(source,"Wrong Command", Config.Lang_BadArguments, "center_bottom", "redm_min", 1500)
        else
            TriggerEvent("infinity_core:removeXP", source, args[1], args[2],  
            function(cb)
            end)
        end
    end
end, true)

----
-- [[ /setrank id amount ]] (not ready)
----
RegisterCommand("setrank", function(source, args, rawCommand)
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.PermManageRank01 or rankAdmin == Config.PermManageRank02 then
        if args[1] == nil or args[2] == nil then
            exports.infinity_core:notification(source,"Wrong Command", Config.Lang_BadArguments, "center_bottom", "redm_min", 1500)
        else
            TriggerEvent("infinity_core:setRank", source, args[1], args[2],  
            function(cb)
            end)
        end
    end
end, true)

----
-- [[ /setgold id amount ]]
----
RegisterCommand("setgold", function(source, args, rawCommand)
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.PermManageGolds01 or rankAdmin == Config.PermManageGolds02 then
        if args[1] == nil or args[2] == nil then
            exports.infinity_core:notification(source,"Wrong Command", Config.Lang_BadArguments, "center_bottom", "redm_min", 1500)
        else
            TriggerEvent("infinity_core:setGold", source, args[1], args[2],  
            function(cb)
            end)
        end
    end
end, true)

----
-- [[ /addgold id amount ]]
----
RegisterCommand("addgold", function(source, args, rawCommand)
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.PermManageGolds01 or rankAdmin == Config.PermManageGolds02 then
        if args[1] == nil or args[2] == nil then
            exports.infinity_core:notification(source,"Wrong Command", Config.Lang_BadArguments, "center_bottom", "redm_min", 1500)
        else
            TriggerEvent("infinity_core:addGold", source, args[1], args[2],  
            function(cb)
            end)
        end
    end
end, true)

----
-- [[ /removegold id amount ]]
----
RegisterCommand("removegold", function(source, args, rawCommand)
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.PermManageGolds01 or rankAdmin == Config.PermManageGolds02 then
        if args[1] == nil or args[2] == nil then
            exports.infinity_core:notification(source,"Wrong Command", Config.Lang_BadArguments, "center_bottom", "redm_min", 1500)
        else
            TriggerEvent("infinity_core:removeGold", source, args[1], args[2],  
            function(cb)
            end)
        end
    end
end, true)

----
-- [[ /setjob id jobname jobrank ]]
----
RegisterCommand("setjob", function(source, args, rawCommand)
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.PermManageJob01 or rankAdmin == Config.PermManageJob02 then
        if args[1] == nil or args[2] == nil or args[3] == nil then
            exports.infinity_core:notification(source,"Wrong Command", Config.Lang_BadArguments, "center_bottom", "redm_min", 1500)
        else
            TriggerEvent("infinity_core:setJob", source, args[1], args[2], args[3],  
            function(cb)
            end)
        end
    end
end, true)

----
-- [[ /setgang id gangname gangrank ]]
----
RegisterCommand("setgang", function(source, args, rawCommand)
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.PermManageJob01 or rankAdmin == Config.PermManageJob02 then
        if args[1] == nil or args[2] == nil or args[3] == nil then
            exports.infinity_core:notification(source,"Wrong Command", Config.Lang_BadArguments, "center_bottom", "redm_min", 1500)
        else
            TriggerEvent("infinity_core:setGang", source, args[1], args[2], args[3],  
            function(cb)
            end)
        end
    end
end, true)

----
-- [[ /kick id reason ]]
----
RegisterCommand('kick', function(source, args, rawCommand)
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.PermKick01 or rankAdmin == Config.PermKick02 then
        if args[1] == nil or args[2] == nil then
            exports.infinity_core:notification(source,"Wrong Command", Config.Lang_BadArguments, "center_bottom", "redm_min", 1500)
        else
            TriggerEvent("infinity_core:kick", source, args[1], args[2],  
            function(cb)
            end)
        end
    end
end, true)

----
-- [[ /ban id reason ]]
----
RegisterCommand('ban', function(source, args, rawCommand)
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.Ban01 or rankAdmin == Config.Ban02 then
        if args[1] == nil or args[2] == nil then
            exports.infinity_core:notification(source,"Wrong Command", Config.Lang_BadArguments, "center_bottom", "redm_min", 1500)
        else
            TriggerEvent("infinity_core:ban", source, args[1], args[2],  
            function(cb)
            end)
        end
    else
        exports.infinity_core:notification(source, Config.Lang_Nopermission, "","center_left","infinitycore",2500)
    end
end, true)

----
-- [[ /noclip ]]
----
TriggerEvent('chat:addSuggestion', '/noclip', 'Use noclip', {})
RegisterCommand('noclip', function(source, args, rawCommand)
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.PermNoclip or rankAdmin == Config.PermNoclip2 then
        TriggerClientEvent("infinity_core:noclip", source)
    else
        exports.infinity_core:notification(source, Config.Lang_Nopermission, "","center_left","infinitycore",2500)
    end
end, true)

----
-- [[ /tp idzone 1 - 12 ]]
----
RegisterCommand('tp', function(source, args, rawCommand)
    local PlayerDatas = exports.infinity_core:GetPlayerSession(source)
    rankAdmin = PlayerDatas._Rank
    if rankAdmin == Config.PermTP or rankAdmin == Config.PermTP2 then
        if args[1] == nil then
            exports.infinity_core:notification(source,"Wrong Command", Config.Lang_BadArguments, "center_bottom", "redm_min", 1500)
        else
            TriggerClientEvent("infinity_core:teleport", source, args[1])
        end
    else
        exports.infinity_core:notification(source, Config.Lang_Nopermission, "","center_left","infinitycore",2500)
    end
end, true)

----
-- [[ /playerefresh id ]] (( REFRESHED FROM WEBSITE DATABASE ))
----
RegisterCommand("playerefresh", function(source, args, rawCommand)
    local Admin = exports.infinity_core:GetPlayerSession(source)
    if Admin._Rank == "superadmin" then 
        if args[1] ~= nil then 
            PlayerTarget = args[1]
            GetPlayerTarget(PlayerTarget) 
            if TargetSteamID then
                local PlayerDatas            = exports.infinity_core:GetPlayerTargetSession(tonumber(PlayerTarget))
                local TargetSteamID, result  = GetPlayersTargetDatas(PlayerTarget, PlayerDatas._CharidT)
                CASHCORE    = result.cash
                XPCORE              = result.xp
                GOLDCORE            = result.golds
                JOBCORE             = result.job
                JOBGCORE            = result.jobgrade
                GANGCORE            = result.gang
                GANGRANKCORE        = result.gangank
                TriggerClientEvent('infinitycore:RefreshPlayerDatas',PlayerTarget, PlayerDatas._CharidT, false, tonumber(CASHCORE), tonumber(XPCORE), tonumber(GOLDCORE), JOBCORE, JOBGCORE, GANGCORE, GANGRANKCORE, false, "refresh")
                exports.infinity_core:notification(PlayerTarget, "Your datas are refresh", 
                "An admin have set new datas for your account <br>"..CASHCORE.." $ <br> "..XPCORE.." XP <br>"..GOLDCORE.." Golds",
                "center_bottom","redm",2500)
            end
        end
    end
end, true)

----
-- [[ /tpm ]]
----
RegisterCommand("tpm", function(source, args, rawCommand)
    local Admin = exports.infinity_core:GetPlayerSession(source)
    if Admin._Rank == "superadmin" or Admin._Rank == "admin" then 
        TriggerClientEvent('infinitycore:gotomarker', source)
    end
end, true)

----
-- [[ /jail IDPLAYER ]]
----
RegisterCommand("jail", function(source, args, rawCommand)
    local Admin = exports.infinity_core:GetPlayerSession(source)
    if Admin._Rank == "superadmin" or Admin._Rank == "admin" then 
        if args[1] ~= nil then
            local Target = tonumber(args[1])
            TriggerClientEvent('infinitycore:jail', Target)
            exports.infinity_core:notification(Target, "<b class='text-danger'>Jailed by Admin</b>", 
            "Enjoy with the rats",
            "center_bottom","redm",2500)
        end
    end
end, true)

----
-- [[ /freeze ID true or false ]]
----
RegisterCommand("freeze", function(source, args, rawCommand)
    local Admin = exports.infinity_core:GetPlayerSession(source)
    if Admin._Rank == "superadmin" or Admin._Rank == "admin" or Admin._Rank == "modo" then 
        if args[1] ~= nil and args[2] ~= nil then
            local Target = tonumber(args[1])
            local Freeze = args[2]
            TriggerClientEvent('infinity_core:freeze', Target, Freeze)
            if Freeze == "true" then 
                exports.infinity_core:notification(Target, "<b class='text-danger'>FREEZE by Admin</b>", 
                "","center_bottom","redm",2500)
            elseif Freeze == "false" then
                exports.infinity_core:notification(Target, "<b class='text-success'>UNFREEZE by Admin</b>", 
                "","center_bottom","redm",2500)
            end
        end
    end
end, true)

----
-- [[ TP PLAYER TO ME ]]
----
RegisterNetEvent("infinitycore:teleportplayer")
AddEventHandler("infinitycore:teleportplayer", function(mycoords, target)
    TriggerClientEvent('infinitycore:teleportplayerReturn', target, mycoords)
end)

----
-- [[ INSPECT DATAS OF PLAYER ]]
----
RegisterNetEvent("infinity_core:inspect")
AddEventHandler("infinity_core:inspect", function(source, PlayerTarget)
    local TargetSteamID = GetPlayerTarget(tonumber(PlayerTarget))  -- // GET PLAYER TARGET
    local SourceSteamID = GetPlayerSource(tonumber(source))        -- // GET PLAYER SOURCE
    if TargetSteamID then
        local TargetDatas   = exports.infinity_core:GetPlayerTargetSession(tonumber(PlayerTarget)) -- (( GET DATAS TARGET PLAYER ))
        exports.infinity_core:notification(
            source,
            "<b>Inspect <span class='text-info'>"..TargetDatas._FirstnameT.." "..TargetDatas._LastnameT.."</span></b><br> CharID:"..TargetDatas._CharidT,
            "<span class='text-warning'>ID</span> "..TargetDatas._InfinitySourceT.."<br> Job: "
            ..TargetDatas._JobT.."<br> JobGrade: "
            ..TargetDatas._JobGradeT.."<br>"
            ..TargetDatas._CashT.."<span class='text-success'>$</span><br>"
            ..TargetDatas._GoldT.."<span class='text-warning'>Golds</span><br>"
            ..TargetDatas._XpT.."<span class='text-info'>Xp</span><br> <span class='text-danger'>Rank</span> "
            ..TargetDatas._RankT,  	
            "center_bottom",         
            "redm_min",           
            9500
        )  
    else
        print('^1 no player founded!')
    end
end)

----
-- [[ /dv (delete vehicle) ]]
----
RegisterCommand("dv", function(source, args, rawCommand)
    local _source   = source
    local Admin     = exports.infinity_core:GetPlayerSession(source)
    if Admin._Rank == "superadmin" or Admin._Rank == "admin" or Admin._Rank == "modo" then 
        TriggerClientEvent('infinity_core:deleteveh', _source)
    end
end, true)

----
-- [[ /dh (delete horse) ]]
----
RegisterCommand("dh", function(source, args, rawCommand)
    local _source   = source
    local Admin     = exports.infinity_core:GetPlayerSession(source)
    if Admin._Rank == "superadmin" or Admin._Rank == "admin" or Admin._Rank == "modo" then 
        TriggerClientEvent('infinity_core:deletehorse', _source)
    end
end, true)

----
-- [[ /ghostmod ]]
----
RegisterCommand("ghostmod", function(source, args, rawCommand)
    local _source   = source
    local Admin     = exports.infinity_core:GetPlayerSession(source)
    if Admin._Rank == "superadmin" or Admin._Rank == "admin" or Admin._Rank == "modo" then 
        TriggerClientEvent('infinity_core:ghostmod', _source)
    end
end, true)

----
-- [[ /godmod ((bug)) ]]
----
RegisterCommand("godmod", function(source, args, rawCommand)
    local _source   = source
    local Admin     = exports.infinity_core:GetPlayerSession(source)
    if Admin._Rank == "superadmin" or Admin._Rank == "admin" or Admin._Rank == "modo" then 
        TriggerClientEvent('infinity_core:godmod', _source)
    end
end, true)