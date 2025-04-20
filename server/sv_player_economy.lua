----
-- [[ TRANSACTION PLAYERS ]]
----
RegisterNetEvent("infinity_core:pay")
AddEventHandler("infinity_core:pay", function(source, PlayerTarget, cashSend, PlayerDatas)
    
    local TargetSteamID     = GetPlayerTarget(PlayerTarget) 
    local SourceSteamID     = GetPlayerSource(source) 
    local cashSend          = tonumber(roundValue(cashSend, 2))

    if TargetSteamID then
        if TargetSteamID ~= SourceSteamID then
            if tonumber(cashSend) <= tonumber(Config.MaxPayAmount) then
                if tonumber(PlayerDatas._Cash) >= tonumber(cashSend) and tonumber(cashSend) >= 0.01 then
                    local PlayerTargetDatas   = exports.infinity_core:GetPlayerSession(tonumber(PlayerTarget))
                    TriggerClientEvent('infinitycore:RefreshPlayerDatas', source, PlayerDatas._Charid, false, tonumber(cashSend), false, false, false, false, false, false, false, "remove")
                        exports.infinity_core:notification(
                            source,
                            "You send a cash for "..PlayerTargetDatas._Firstname.." "..PlayerTargetDatas._Lastname,  		
                            cashSend.."$",  	
                            "center_left",         
                            "infinitycore",         
                            2500
                        )   
                        TriggerClientEvent('infinitycore:RefreshPlayerDatas', PlayerTarget, PlayerDatas._CharidT, false, tonumber(cashSend), false, false, false, false, false, false, false, "add")
                        TriggerClientEvent('infinity_core:goldanim', PlayerTarget)
                        exports.infinity_core:notification(
                            PlayerTarget,
                            "Your Receive a cash by <b>"..PlayerDatas._Firstname.." "..PlayerDatas._Lastname.."</b>",  		
                            cashSend.."$",  	
                            "center_left",         
                            "infinitycore",            
                            2500
                        )  
                else
                    exports.infinity_core:notification(
                        source,
                        Config.ERROR,  		
                        "No cash for pay user or invalid format !",  	
                        "center_left",         
                        "infinitycore",        
                        2500
                    )  
                end
            else
                exports.infinity_core:notification(
                    source,
                    Config.ERROR,  		
                    "No Pay 24 999$ or +",  	
                    "center_left",         
                    "infinitycore",          
                    2500
                )  
            end
        else
            exports.infinity_core:notification(
                source,
                Config.ERROR,  		
                "Impossible to pay yourself !",  	
                "center_left",         
                "infinitycore",      
                2500
            )  
        end
    else
        exports.infinity_core:notification(
            source,
            Config.ERROR,  		
            "Player is offline !",  	
            "center_left",         
            "infinitycore",           
            2500
        )  
    end
end)

-----
-- [ LEVEL/XP MANAGER SERVER_SIDE]
-----
function LevelPlayer(XPClass)
    levels              = LoadResourceFile(GetCurrentResourceName(), "/shared/levels.json")
    extract             = json.decode(levels)
    for i, json in pairs(extract.levels) do
        if XPClass ~= nil then 
            if XPClass >= json.exp and json.explimit > XPClass then
                Level = json.lvl
                break
            end
        end
    end
    return Level, XPClass
end

function XpReturn(PlayerTarget)
    local TargetSteamID = GetPlayerTarget(PlayerTarget)
    if TargetSteamID then
        local PlayerDatas   = exports.infinity_core:GetPlayerTargetSession(tonumber(PlayerTarget))
        XPClass             = PlayerDatas._XpT
        LevelPlayer(XPClass)
        return Level, XPClass
    end
end