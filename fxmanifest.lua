fx_version 'adamant'

game 'gta5'

description 'Page Emergency Services from their HQ lobbies'

version '1.0.0'

client_scripts{
    'config-FrontDeskPage.lua',
    'client-FrontDeskPage.lua' 
}

server_scripts{
    'config-FrontDeskPage.lua',
    'server-FrontDeskPage.lua',
    '@mysql-async/lib/MySQL.lua'
}