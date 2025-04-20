if not ConfigDiscord.ChatRolesEnabled then return end

local RoleList = ConfigDiscord.RoleList
local ServerID = ConfigDiscord.ServerID
local cachedPlayerRoles = {}
local playerSelectedRole = {}
local playerStaffChatStatus = {}

local function syncTags( source )
    local src = source
    local identifiers = GetIdentifiersTable( src )

    if identifiers.discord then
        local roles = getRoles( src )
        local rolesAllowed = {}
        local highestRole, highestRoleIndex = nil, nil

        for i = 1, #RoleList do 
            if tostring( RoleList[ i ][ 1 ] ) == "0" then
                table.insert( rolesAllowed, i )
                highestRoleIndex = i
            end
            if roles ~= nil then
                for _, v in pairs( roles ) do
                    if tostring( RoleList[ i ][ 1 ] ) == tostring( v ) then
                        table.insert( rolesAllowed, i )
                        highestRole, highestRoleIndex = v, i
                    end
                end
            end
        end

        cachedPlayerRoles[ src ] = rolesAllowed
        playerSelectedRole[ src ] = RoleList[ highestRoleIndex ][ 2 ]
    end
end

local function sendMessage( source, message )
    TriggerClientEvent( "chat:addMessage", source, {
        color = { 255, 0, 0 },
        multiline = true,
        args = { "Server", tostring( message ) }
    } )
end

AddEventHandler( "chatMessage", function( source, name, message )

    CancelEvent()

    local PlayerDatas        = exports.infinity_core:GetPlayerSession(tonumber(source))
    local source, args, role = tonumber( source ), SplitString( message ), playerSelectedRole[ source ]
    roleplay_name            = PlayerDatas._Firstname.." "..PlayerDatas._Lastname
    Level, XPClass           = XpReturn(source)

    if role == nil then
        syncTags( source )
        role = playerSelectedRole[ source ]
    end

    if string.find( args[ 1 ], "/global" ) and not playerStaffChatStatus[ source ] then
        if ServerID then
            TriggerClientEvent( "chatMessage", -1, "^0[Global OOC] ID: ^6" .. source .. "^0 | " .. role .. " " .. roleplay_name .. " ^2[ lvl "..Level.." ] ^r^0 say: " .. args[ 2 ] )
        else
            TriggerClientEvent( "chatMessage", -1, "^0[Global OOC] ID: ^6" .. source .. "^0 | " .. role .. " " .. roleplay_name .. " ^2[ lvl "..Level.." ] ^r^0 say: " .. args[ 2 ] )
        end
    end
end)

local function setData( source )
    syncTags( source )
    if IsPlayerAceAllowed( source, "infinitycore:StaffChat" ) then
        playerStaffChatStatus[ tonumber( source ) ] = false
        TriggerClientEvent( "DiscordAPI:staffChatStatus", source, false )
    end
end

RegisterNetEvent( "DiscordAPI:UpdateChatPermissions" )
AddEventHandler( "DiscordAPI:UpdateChatPermissions", function()
    setData( source )
end )

AddEventHandler( "playerDropped", function()
    cachedPlayerRoles[ source ] = nil
    playerSelectedRole[ source ] = nil
end )

RegisterCommand( "chattag", function( source, args, rawCommand )

    local src       = source
    local roleList  = cachedPlayerRoles[ src ]

    if roleList == nil then
        syncTags( src )
        roleList = cachedPlayerRoles[ src ]
    end

    if #args == 0 then
        for k, v in pairs( roleList ) do
            TriggerClientEvent( "chatMessage", src, "^*" .. k .. "^r^7: " .. RoleList[ v ][ 2 ] )
        end
        sendMessage( src, "Use /chattag <id> to select the tag you'd like to use.^r^7" )
    elseif #args == 1 then
        local selectedID = tonumber( args[ 1 ] )
        if selectedID > 0 and selectedID <= #roleList then
            playerSelectedRole[ src ] = RoleList[ roleList[ selectedID ] ][ 2 ]
            sendMessage( src, "You have choice the rôle Discord Synced : " .. playerSelectedRole[ src ] .. "^r^7" )
        else
            sendMessage( src, "Sorry you dont have the role on Discord!^r^7" )
        end
    end
end)