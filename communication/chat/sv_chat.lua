-- Chat Proximity
AddEventHandler('chatMessage', function(source, name, message)
    if string.sub(message, 1, string.len("/")) ~= "/" then
        local PlayerDatas        = exports.infinity_core:GetPlayerSession(tonumber(source))
        roleplay_name            = PlayerDatas._Firstname.." "..PlayerDatas._Lastname
        DiscordWebhook(roleplay_name, message)
        TriggerClientEvent("sendProximityMessage", -1, source, message, roleplay_name)
    end
    CancelEvent()
end)

-- Chat /me msg
RegisterCommand('me', function(source, args, user)
    local PlayerDatas        = exports.infinity_core:GetPlayerSession(tonumber(source))
    roleplay_name            = PlayerDatas._Firstname.." "..PlayerDatas._Lastname
    DiscordWebhook(roleplay_name, "**[ME]** "..table.concat(args, " "))
    TriggerClientEvent("sendProximityMessageMe", -1, source, roleplay_name, table.concat(args, " "))
end, false)

-- Chat /do
RegisterCommand('do', function(source, args, user)
    local PlayerDatas        = exports.infinity_core:GetPlayerSession(tonumber(source))
    roleplay_name            = PlayerDatas._Firstname.." "..PlayerDatas._Lastname
    DiscordWebhook(roleplay_name, "**[DO]** "..table.concat(args, " "))
    TriggerClientEvent("sendProximityMessageDo", -1, source, roleplay_name, table.concat(args, " "))
end, false)

-- Chat /dice
RegisterCommand('dice', function(source, args, user)
    local PlayerDatas        = exports.infinity_core:GetPlayerSession(tonumber(source))
    roleplay_name            = PlayerDatas._Firstname.." "..PlayerDatas._Lastname
    num = math.random(1, 6)
    DiscordWebhook(roleplay_name, '**roll the dice** '..num)
    TriggerClientEvent("sendProximityMessageDice", -1, source, roleplay_name, num, table.concat(args, " "))
end, false)

-- Chat /ooc msg
RegisterCommand('ooc', function(source, args, user)
    local PlayerDatas        = exports.infinity_core:GetPlayerSession(tonumber(source))
    roleplay_name            = PlayerDatas._Firstname.." "..PlayerDatas._Lastname
    DiscordWebhook(roleplay_name, "**[OOC]** "..table.concat(args, " "))
    TriggerClientEvent('chatMessage', -1, "OOC | " .. roleplay_name, {128, 128, 128}, table.concat(args, " "))
end, false)

-- Chat /ad msg
RegisterCommand('ad', function(source, args, user)
    if source then 
        local PlayerDatas        = exports.infinity_core:GetPlayerSession(tonumber(source))
        roleplay_name            = PlayerDatas._Firstname.." "..PlayerDatas._Lastname
        local price              = Config.PriceAds
        if tonumber(PlayerDatas._Cash) >= tonumber(price) then
            DiscordWebhook(roleplay_name, "**[ADS]** "..table.concat(args, " "))
            exports.infinity_core:RemoveCash(source, price)
            TriggerClientEvent('chatMessage', -1, "^6[ADS]: " .. roleplay_name, {255,215,0}, table.concat(args, " "))
        end
    end
end, false)

function stringsplit(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t={} ; i=1
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    t[i] = str
    i = i + 1
  end
  return t
end

function DiscordWebhook(author, msg)
    if Config.DiscordChatWebhook then
        PerformHttpRequest(Config.WebhookURI, function(err, text, headers) end, 'POST',json.encode({
            embeds={
                {
                    title        = author, 
                    description  = msg, 
                    footer = { 
                        text = Config.DiscordBotNameChat
                    },color  = Config.DiscordBotColor
                }
            }}),
        { ['Content-Type'] = 'application/json' })
    end
end