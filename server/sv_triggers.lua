----
-- [[ roundFunction ]]
----
function roundValue(number, decimals)
    local power = 10 ^ decimals
    return math.floor(number * power) / power
end

----
-- [[ HUD INIT CLIENT ]]
----
RegisterNetEvent("infinity_core:DatasPlayerClient")
AddEventHandler("infinity_core:DatasPlayerClient", function(source, hp, temperature, water, eat, kill)
    GetPlayerSource(source)
    if SourceSteamID then
        local session = GetPlayerSession(tonumber(source))
        TriggerClientEvent('infinity_core:hudDatasClient',source, hp, temperature, water, eat, kill, session)
    end
end)

----
-- [[ ADD CASH ]]
----
RegisterNetEvent("infinity_core:addCash")
AddEventHandler("infinity_core:addCash", function(source, PlayerTarget, CashSet)
    local TargetSteamID = GetPlayerTarget(PlayerTarget) 
    local SourceSteamID = GetPlayerSource(source) 
    local CashSet       = tonumber(roundValue(CashSet, 2))
    if TargetSteamID then
        local PlayerDatas   = exports.infinity_core:GetPlayerTargetSession(tonumber(PlayerTarget))
        TriggerClientEvent('infinitycore:RefreshPlayerDatas', PlayerTarget, PlayerDatas._CharidT, false, tonumber(roundValue(CashSet, 2)), false, false, false, false, false,false, false, "add")
        exports.infinity_core:notification(PlayerTarget, "Cash receive by Admin", 
        "+<b class='text-success'>"..CashSet..Config.Devise.."</b>","center_left","infinitycore",2500)
        exports.infinity_core:notification(source, "Cash send to "..PlayerDatas._FirstnameT, 
        "+<b class='text-info'>"..CashSet..Config.Devise.."</b>","center_left","infinitycore",2500)
    else
        exports.infinity_core:notification(source, Config.Lang_NoExistUser, "","center_left","infinitycore",2500)
    end
end)

----
-- [[ ADD CASH BANK ]]
----
RegisterNetEvent("infinity_core:addCashBank")
AddEventHandler("infinity_core:addCashBank", function(source, PlayerTarget, CashAdd)
    local TargetSteamID = GetPlayerTarget(PlayerTarget) 
    local SourceSteamID = GetPlayerSource(source) 
    local CashAdd       = tonumber(roundValue(CashAdd, 2))
    if TargetSteamID then
        local PlayerDatas   = exports.infinity_core:GetPlayerTargetSession(tonumber(PlayerTarget))
        TriggerClientEvent('infinitycore:RefreshPlayerDatas', PlayerTarget, PlayerDatas._CharidT, tonumber(roundValue(CashAdd, 2)), false, false, false, false, false, false, false, false, "add")
        exports.infinity_core:notification(PlayerTarget, "CashBank receive by Admin", 
        "+<b class='text-success'>"..CashAdd..Config.Devise.."</b>","center_left","infinitycore",2500)
        exports.infinity_core:notification(source, "CashBank send to "..PlayerDatas._FirstnameT, 
        "+<b class='text-info'>"..CashAdd..Config.Devise.."</b>","center_left","infinitycore",2500)
    else
        exports.infinity_core:notification(source, Config.Lang_NoExistUser, "","center_left","infinitycore",2500)
    end
end)

----
-- [[ REMOVE CASH ]]
----
RegisterNetEvent("infinity_core:removeCash")
AddEventHandler("infinity_core:removeCash", function(source, PlayerTarget, CashSet)
    local TargetSteamID = GetPlayerTarget(PlayerTarget) 
    local SourceSteamID = GetPlayerSource(source) 
    local CashSet       = tonumber(roundValue(CashSet, 2))
    if TargetSteamID then
        local PlayerDatas   = exports.infinity_core:GetPlayerTargetSession(tonumber(PlayerTarget))
        TriggerClientEvent('infinitycore:RefreshPlayerDatas', PlayerTarget, PlayerDatas._CharidT, false, tonumber(CashSet), false, false, false, false, false, false, false, "remove")
        exports.infinity_core:notification(PlayerTarget, "Cash remove by Admin", 
        "-<b class='text-danger'>"..CashSet..Config.Devise.."</b>","center_left","infinitycore",2500)
        exports.infinity_core:notification(source, "Cash removed for "..PlayerDatas._FirstnameT, 
        "-<b class='text-info'>"..CashSet..Config.Devise.."</b>","center_left","infinitycore",2500)
    else
        exports.infinity_core:notification(source, Config.Lang_NoExistUser, "","center_left","infinitycore",2500)
    end
end)

----
-- [[ ADD GOLD ]]
----
RegisterNetEvent("infinity_core:addGold")
AddEventHandler("infinity_core:addGold", function(source, PlayerTarget, GoldSet)
    local TargetSteamID = GetPlayerTarget(PlayerTarget) 
    local SourceSteamID = GetPlayerSource(source) 
    local GoldSet       = tonumber(roundValue(GoldSet, 2))
    if TargetSteamID then
        local PlayerDatas   = exports.infinity_core:GetPlayerTargetSession(tonumber(PlayerTarget))
        TriggerClientEvent('infinitycore:RefreshPlayerDatas', PlayerTarget, PlayerDatas._CharidT, false, false, false, tonumber(GoldSet), false, false, false, false, false, "add")
        exports.infinity_core:notification(PlayerTarget, "Golds receive by Admin", 
        "+<b class='text-success'>"..GoldSet.."g</b>","center_left","infinitycore",2500)
        exports.infinity_core:notification(source, "Golds send to "..PlayerDatas._FirstnameT, 
        "+<b class='text-info'>"..GoldSet.."g</b>","center_left","infinitycore",2500)
    else
        exports.infinity_core:notification(source, Config.Lang_NoExistUser, "","center_left","infinitycore",2500)
    end
end)

----
-- [[ REMOVE GOLD ]]
----
RegisterNetEvent("infinity_core:removeGold")
AddEventHandler("infinity_core:removeGold", function(source, PlayerTarget, GoldSet)
    local TargetSteamID = GetPlayerTarget(PlayerTarget) 
    local SourceSteamID = GetPlayerSource(source)       
    local GoldSet       = tonumber(roundValue(GoldSet, 2))
    if TargetSteamID then
        local PlayerDatas   = exports.infinity_core:GetPlayerTargetSession(tonumber(PlayerTarget))
        TriggerClientEvent('infinitycore:RefreshPlayerDatas',PlayerTarget, PlayerDatas._CharidT, false, false, false, tonumber(GoldSet), false, false, false, false, false, "remove")
        exports.infinity_core:notification(PlayerTarget, "Golds removed by Admin", 
        "-<b class='text-danger'>"..GoldSet.."g</b>","center_left","infinitycore",2500)
        exports.infinity_core:notification(source, "Golds removed to "..PlayerDatas._FirstnameT, 
        "-<b class='text-info'>"..GoldSet.."g</b>","center_left","infinitycore",2500)
    else
        exports.infinity_core:notification(source, Config.Lang_NoExistUser, "","center_left","infinitycore",2500)
    end
end)

----
-- [[ ADD XP ]]
----
RegisterNetEvent("infinity_core:addXP")
AddEventHandler("infinity_core:addXP", function(source, PlayerTarget, XPSet)
    local TargetSteamID = GetPlayerTarget(PlayerTarget) 
    local SourceSteamID = GetPlayerSource(source) 
    local XPSet       = tonumber(roundValue(XPSet, 2))
    if TargetSteamID then
        local PlayerDatas   = exports.infinity_core:GetPlayerTargetSession(tonumber(PlayerTarget))
        TriggerClientEvent('infinitycore:RefreshPlayerDatas',PlayerTarget, PlayerDatas._CharidT, false, false, tonumber(XPSet), false, false, false, false, false, false, "add")
        exports.infinity_core:notification(PlayerTarget, "XP receive by Admin", 
        "+<b class='text-success'>"..XPSet.."xp</b>","center_left","infinitycore",2500)
        exports.infinity_core:notification(source, "XP send to "..PlayerDatas._FirstnameT, 
        "+<b class='text-info'>"..XPSet.."xp</b>","center_left","infinitycore",2500)
    else
        exports.infinity_core:notification(source, Config.Lang_NoExistUser, "","center_left","infinitycore",2500)
    end
end)

----
-- [[ REMOVE XP ]]
----
RegisterNetEvent("infinity_core:removeXP")
AddEventHandler("infinity_core:removeXP", function(source, PlayerTarget, XPSet)
    local TargetSteamID = GetPlayerTarget(PlayerTarget) 
    local SourceSteamID = GetPlayerSource(source)      
    local XPSet       = tonumber(roundValue(XPSet, 2))
    if TargetSteamID then
        local PlayerDatas   = exports.infinity_core:GetPlayerTargetSession(tonumber(PlayerTarget))
        TriggerClientEvent('infinitycore:RefreshPlayerDatas',PlayerTarget, PlayerDatas._CharidT, false, false, tonumber(XPSet), false, false, false, false, false, false, "remove")
        exports.infinity_core:notification(PlayerTarget, "XP removed by Admin", 
        "-<b class='text-danger'>"..XPSet.."xp</b>","center_left","infinitycore",2500)
        exports.infinity_core:notification(source, "XP removed to "..PlayerDatas._FirstnameT, 
        "-<b class='text-info'>"..XPSet.."xp</b>","center_left","infinitycore",2500)
    else
        exports.infinity_core:notification(source, Config.Lang_NoExistUser, "","center_left","infinitycore",2500)
    end
end)

----
-- [[ KICK PLAYER ]]
----
RegisterNetEvent("infinity_core:kick")
AddEventHandler("infinity_core:kick", function(source, PlayerTarget, Reason)
    local TargetSteamID = GetPlayerTarget(PlayerTarget)
    local SourceSteamID = GetPlayerSource(source) 
    if TargetSteamID then
        exports.infinity_core:notification(source, "Player Kick: "..PlayerDatas._Firstname,"","center_left","infinitycore",2500)
        DropPlayer(PlayerTarget, Reason)
    else
        exports.infinity_core:notification(source, Config.Lang_NoExistUser,"","center_left","infinitycore",2500)
    end
end)

----
-- [[ BAN PLAYER ]]
----
RegisterNetEvent("infinity_core:ban")
AddEventHandler("infinity_core:ban", function(source, PlayerTarget, Reason)
    local TargetSteamID = GetPlayerTarget(PlayerTarget)
    local SourceSteamID = GetPlayerSource(source) 
    if TargetSteamID then
        exports.oxmysql:prepare('UPDATE players SET banned = 1 WHERE steam_identifier = ?', {TargetSteamID}, function(result)
            exports.infinity_core:notification(source, "User Ban", "<b class='text-success'>Player is now ban</b>","center_left","infinitycore",2500)
        end)
        DropPlayer(PlayerTarget, Reason)
    else
        exports.infinity_core:notification(source, Config.Lang_NoExistUser,"","center_left","infinitycore",2500)
    end
end)

----
-- [[ SET XP ]
----
RegisterNetEvent("infinity_core:setXP")
AddEventHandler("infinity_core:setXP", function(source, PlayerTarget, XPSet)
    local TargetSteamID = GetPlayerTarget(PlayerTarget)
    local SourceSteamID = GetPlayerSource(source) 
    local XPSet         = tonumber(roundValue(XPSet, 0))
    if TargetSteamID then
        local PlayerDatas   = exports.infinity_core:GetPlayerTargetSession(tonumber(PlayerTarget))
        TriggerClientEvent('infinitycore:RefreshPlayerDatas',PlayerTarget, PlayerDatas._CharidT, false, false, tonumber(XPSet), false, false, false, false, false, false, "setxp")
        exports.infinity_core:notification(PlayerTarget, "XP set by Admin", 
        "<b class='text-info'>"..XPSet.."xp</b>","center_left","infinitycore",2500)
        exports.infinity_core:notification(source, "XP set to "..PlayerDatas._FirstnameT, 
        "<b class='text-info'>"..XPSet.."xp</b>","center_left","infinitycore",2500)
    else
        exports.infinity_core:notification(source, Config.Lang_NoExistUser, "","center_left","infinitycore",2500)
    end
end)

----
-- [[ SET GOLD ]]
----
RegisterNetEvent("infinity_core:setGold")
AddEventHandler("infinity_core:setGold", function(source, PlayerTarget, GoldSet)
    local TargetSteamID = GetPlayerTarget(PlayerTarget)
    local SourceSteamID = GetPlayerSource(source) 
    local GoldSet       = tonumber(roundValue(GoldSet, 2))
    if TargetSteamID then
        local PlayerDatas   = exports.infinity_core:GetPlayerTargetSession(tonumber(PlayerTarget))
        TriggerClientEvent('infinitycore:RefreshPlayerDatas',PlayerTarget, PlayerDatas._CharidT, false, false, false, tonumber(roundValue(GoldSet, 2)), false, false, false, false, false, "setgold")
        exports.infinity_core:notification(PlayerTarget, "Golds set by Admin", 
        "<b class='text-info'>"..GoldSet.." Golds</b>","center_left","infinitycore",2500)
        exports.infinity_core:notification(source, "Golds set to "..PlayerDatas._FirstnameT, 
        "<b class='text-info'>"..GoldSet.." Golds</b>","center_left","infinitycore",2500)
    else
        exports.infinity_core:notification(source, Config.Lang_NoExistUser, "","center_left","infinitycore",2500)
    end
end)

----
-- [[ SET CASH ]]
----
RegisterNetEvent("infinity_core:setCash")
AddEventHandler("infinity_core:setCash", function(source, PlayerTarget, CashSet)
    local TargetSteamID = GetPlayerTarget(PlayerTarget)
    local SourceSteamID = GetPlayerSource(source) 
    local CashSet       = tonumber(roundValue(CashSet, 2))
    if TargetSteamID then
        local PlayerDatas   = exports.infinity_core:GetPlayerTargetSession(tonumber(PlayerTarget))
        TriggerClientEvent('infinitycore:RefreshPlayerDatas',PlayerTarget, PlayerDatas._CharidT, false, tonumber(roundValue(CashSet, 2)), false, false, false, false, false, false, false, "setcash")
        exports.infinity_core:notification(PlayerTarget, "$ set by Admin", 
        "<b class='text-info'>"..CashSet.." $</b>","center_left","infinitycore",2500)
        exports.infinity_core:notification(source, "$ set to "..PlayerDatas._FirstnameT, 
        "<b class='text-info'>"..CashSet.." $</b>","center_left","infinitycore",2500)
    else
        exports.infinity_core:notification(source, Config.Lang_NoExistUser, "","center_left","infinitycore",2500)
    end
end)

----
-- [[ SET JOB + GRADE ]]
----
RegisterNetEvent("infinity_core:setJob")
AddEventHandler("infinity_core:setJob", function(source, PlayerTarget, JobSet, JobGrade)
    local TargetSteamID = GetPlayerTarget(PlayerTarget) 
    local SourceSteamID = GetPlayerSource(source)       
    local JobGrade      = tonumber(JobGrade)
    if TargetSteamID then
        local PlayerDatas   = exports.infinity_core:GetPlayerTargetSession(tonumber(PlayerTarget))
        TriggerClientEvent('infinitycore:RefreshPlayerDatas', PlayerTarget, PlayerDatas._CharidT, false, false, false, false, JobSet, JobGrade, false, false, false, "setjob")
        exports.infinity_core:notification(PlayerTarget, " You have a new job by Admin", 
        JobSet.." Grade: "..JobGrade,"center_left","infinitycore",2500)
        exports.infinity_core:notification(source, "New job for "..PlayerDatas._FirstnameT, 
        JobSet.." Grade: "..JobGrade,"center_left","infinitycore",2500)
    else
        exports.infinity_core:notification(source, Config.Lang_NoExistUser, "","center_left","infinitycore",2500)
    end
end)

----
-- [[ SET GANG + GRADE ]]
----
RegisterNetEvent("infinity_core:setGang")
AddEventHandler("infinity_core:setGang", function(source, PlayerTarget, GangSet, Grade)
    local TargetSteamID = GetPlayerTarget(PlayerTarget) 
    local SourceSteamID = GetPlayerSource(source)       
    local Grade         = tonumber(Grade)
    if TargetSteamID then
        local PlayerDatas   = exports.infinity_core:GetPlayerTargetSession(tonumber(PlayerTarget))
        TriggerClientEvent('infinitycore:RefreshPlayerDatas', PlayerTarget, PlayerDatas._CharidT, false, false, false, false, false, false, GangSet, Grade, false, "setgang")
        exports.infinity_core:notification(PlayerTarget, " You have a new gang by Admin", 
        GangSet.." Grade: "..Grade,"center_left","infinitycore",2500)
        exports.infinity_core:notification(source, "New gang set for "..PlayerDatas._FirstnameT, 
        GangSet.." Grade: "..Grade,"center_left","infinitycore",2500)
    else
        exports.infinity_core:notification(source, Config.Lang_NoExistUser, "","center_left","infinitycore",2500)
    end
end)