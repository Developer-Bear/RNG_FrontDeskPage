fx_version 'adamant'

game 'gta5'

description 'Page Emergency Services from their HQ lobbies'

version '1.0.0'

client_scripts{
    '@es_extended/locale.lua',
    'locales/en.lua',
    'config-FrontDeskPage.lua',
    'client-FrontDeskPage.lua' 
}

server_scripts{
    '@es_extended/locale.lua',
    'locales/en.lua',
    'config-FrontDeskPage.lua',
    'server-FrontDeskPage.lua',
    '@mysql-async/lib/MySQL.lua'
}