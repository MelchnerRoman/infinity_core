----
-- [[ EXPORTS GLOBAL FUNCTIONS  AND CORE FUNCTIONS ]]
----

-- [[ exports.infinity_core:GetPlayerSource(PlayerTarget) ]]
function GetPlayerTarget(PlayerTarget)
    identifiers  = GetPlayerIdentifiers(PlayerTarget)
    TargetSteamID = nil
    for _, playerId in pairs(GetPlayers()) do
        if tonumber(playerId) == tonumber(PlayerTarget) then
            for _, v in pairs(identifiers) do
                if string.find(v, "steam") then
                    Target_SteamIdentifier = v
                    TargetSteamID = Target_SteamIdentifier
                end
            end
        end
    end
    return TargetSteamID
end

-- [[ exports.infinity_core:GetPlayerSource(source) ]]
function GetPlayerSource(source)
    if source ~= 0 then
        SourceSteamID = nil
        local identifiers = GetPlayerIdentifiers(source)
        for _, v in pairs(identifiers) do
            if string.find(v, "steam") then
                Source_SteamIdentifier = v
                SourceSteamID = Source_SteamIdentifier
            end
        end
        return SourceSteamID
    end
end

-- [[ exports.infinity_core:RemoveCash(source, value) ]]
function RemoveCash(source, cashamount)
    _source = source
    local SourceSteamID         = GetPlayerSource(source)
    cashamount                  = tonumber(roundValue(cashamount, 2))
    local PlayerDatas           = exports.infinity_core:GetPlayerSession(tonumber(_source))
    local PlayerCash            = tonumber(roundValue(PlayerDatas._Cash,2))
    if SourceSteamID ~= nil then 
        if tonumber(cashamount) >= 0 and tonumber(PlayerCash) >= 0 then
            TriggerClientEvent('infinitycore:RefreshPlayerDatas', source, PlayerDatas._Charid, false, tonumber(roundValue(cashamount,2)), false, false, false, false, false, false, false, "remove")
        end
    end
end

-- [[ exports.infinity_core:AddCash(source, value) ]]
function AddCash(source, cashamount)
    _source = source
    local SourceSteamID = GetPlayerSource(source)
    cashamount = tonumber(roundValue(cashamount, 2))
    if SourceSteamID ~= nil then 
        if tonumber(cashamount) >= 0.01 then
            local PlayerDatas           = exports.infinity_core:GetPlayerSession(tonumber(_source))
            TriggerClientEvent('infinitycore:RefreshPlayerDatas', source, PlayerDatas._Charid, false, tonumber(cashamount), false, false, false, false, false, false, false, "add")
        end
    end
end

-- [[ exports.infinity_core:AddXP(source, xpAmount) ]]
function AddXP(source, xpAmount)
    _source                     = source
    local SourceSteamID         = GetPlayerSource(source)
    xpAmount                    = tonumber(roundValue(xpAmount, 1))
    if SourceSteamID ~= nil then 
        if tonumber(xpAmount) >= 1 then
            local PlayerDatas           = exports.infinity_core:GetPlayerSession(tonumber(_source))
            TriggerClientEvent('infinitycore:RefreshPlayerDatas', source, PlayerDatas._Charid, false, false, tonumber(xpAmount), false ,false, false, false,false,false, "add")
        end
    end
end

-- [[ exports.infinity_core:RemoveXP(source, xpAmount) ]]
function RemoveXP(source, xpAmount)
    _source                     = source
    local SourceSteamID         = GetPlayerSource(source)
    xpAmount                    = tonumber(roundValue(xpAmount, 1))
    if SourceSteamID ~= nil then 
        if tonumber(xpAmount) >= 1 then
            local PlayerDatas           = exports.infinity_core:GetPlayerSession(tonumber(_source))
            TriggerClientEvent('infinitycore:RefreshPlayerDatas', source,PlayerDatas._Charid, false, false, tonumber(roundValue(xpAmount,1)), false ,false, false, false, false, false, "remove")
        end
    end
end

-- [[ exports.infinity_core:RemoveGold(source, goldAmount) ]]
function RemoveGold(source, goldAmount)
    _source                     = source
    local SourceSteamID         = GetPlayerSource(source)
    goldAmount                  = tonumber(roundValue(goldAmount, 2))
    if SourceSteamID ~= nil then 
        if tonumber(goldAmount) >= 0.01 then
            local PlayerDatas           = exports.infinity_core:GetPlayerSession(tonumber(_source))
            TriggerClientEvent('infinitycore:RefreshPlayerDatas', source, PlayerDatas._Charid, false, false, false, tonumber(roundValue(goldAmount,2)), false, false, false, false, false, "remove")
        end
    end
end

-- [[ exports.infinity_core:AddGold(source, goldAmount) ]]
function AddGold(source, goldAmount)
    _source                     = source
    local SourceSteamID         = GetPlayerSource(source)
    goldAmount                  = tonumber(roundValue(goldAmount, 2))
    if SourceSteamID ~= nil then 
        if tonumber(goldAmount) >= 0.01 then
            local PlayerDatas           = exports.infinity_core:GetPlayerSession(tonumber(_source))
            TriggerClientEvent('infinitycore:RefreshPlayerDatas', source, PlayerDatas._Charid, false, false, false, tonumber(goldAmount), false, false, false, false, false, "add")
        end
    end
end

RegisterNetEvent("infinity_core:getPlayerDatas")
AddEventHandler("infinity_core:getPlayerDatas", function(Target)
    GetPlayersAllDatas(Target)
end)

--[[ exports.infinity_core:notification(source, 'TITLE', 'DESC', 'bottom_large', 'infinitycore', 1500) ]]
function notification(target, title, text, position, design, duration)
	TriggerClientEvent('infinity_core:notification',
		target,
		title,  		
		text,  	
		position,         
		design,         
		duration
	)
end

RegisterNetEvent("infinity_core:notification")
AddEventHandler("infinity_core:notification", function(target, title, text, position, design, duration)
    TriggerClientEvent('infinity_core:notification',
        target,
        title,  		
        text,  	
        position,         
        design,         
        duration
    )
end)

-- [[ exports.infinity_core:GetPlayersTargetDatas(target) ]] SQL FROM WEBSITE
function GetPlayersTargetDatas(Target, CharacterID)
    local identifiers = GetPlayerIdentifiers(Target)
    for _, playerId in ipairs(GetPlayers()) do
        local name = GetPlayerName(playerId)
        if playerId == Target then
            for _, v in pairs(identifiers) do
                if string.find(v, "steam") then
                    Target_SteamIdentifier = v
                    break
                end
            end
            break
        else
            Target_SteamIdentifier = false
        end
    end
    TargetSteamID = Target_SteamIdentifier
    if TargetSteamID then
        local result = MySQL.prepare.await('SELECT * FROM players WHERE steam_identifier = ? and charid = ?', {TargetSteamID, CharacterID})
        if result then
            TargetGlobal          = json.encode(result, {indent=true})
            Targetfirstname       = result.firstname
            Targetlastname        = result.lastname
            Targetnationality     = result.nationality
            Targetrank            = result.rank
            Targetcash            = result.cash
            TargetAge             = result.years
            Targetgolds           = result.golds
            Targetxp              = result.xp
            Targetjob             = result.job
            Targetjobgrade        = result.jobgrade
            Targetcoords          = result.coords
            return TargetSteamID, result
        end
    end
end

-- [[ exports.infinity_core:RandomInt(maxvalue) ]]
function RandomInt(max)
    MakeRandomInt = math.random(1, tonumber(max))
    return MakeRandomInt
end

-- [[ exports.infinity_core:roundValue(value, value) ]]
function roundValue(number, decimals)
    local power = 10 ^ decimals
    return math.floor(number * power) / power
end