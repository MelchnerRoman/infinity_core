-----
-- [ API_DISCORD 1.0 ]
-----
Config.EnableDiscordSync       = true
Config.WebhookURI              = "https://discord.com/api/webhooks/"
Config.DiscordAppID            = 1311043446160494612 -- APP ID
Config.discordImageName        = 'https://infinitycore.com/assets/medias/20221111024347_1.jpg'
Config.hoverText               = 'infinitycore.com'
Config.richPresenceText        = "infinitycore Framework 1.0.0"
Config.smallDiscordImageName   = 'https://infinitycore.com/assets/medias/20221111024347_1.jpg'
Config.smallHoverText          = 'infinitycore ALPHA FRAMEWORK'

Config.button1 = {
    text = 'Trello',
    url  = ''
}

Config.button2 = {
    text = 'Discord',
    url  = 'https://discord.gg/ncH7GX3XJd'
}

Config.button3 = {
    text = 'Official Website',
    url  = 'https://altitude-dev.gitbook.io/doc/'
}

--- Chat Logs
Config.DiscordChatWebhook       = true -- Enable transcription chat ingame to the discord ?
Config.DiscordBotNameChat       = "Live Server"
Config.DiscordBotColor          = 7419530

ConfigDiscord = {

    DiscordToken     = "......",
    GuildID          = 1311043446160494612,
    ChatRolesEnabled = true, 
    
    RoleList = { 
        {0,  "🤠^0Player |^0"},
        {1028727011985854525,  "⭕^1CoreTeam |^0"},
        {1041442964381126737,  "⭕^1CoreDev  |^0"},
    },

    ServerID = true, 

    DiscordRoles = { 
        [ "Public Cop" ] = "",
    },

    AcePermsEnabled = true,
    Groups = {
        [ "1041442964381126737" ] = "group.admin", 
        [ "1052405211370631188" ] = "group.member",
    },
    Permissions = {
        [ "926664698601041990" ] = {
            "aop.*",
            "chattoggle",
        }
    }
}