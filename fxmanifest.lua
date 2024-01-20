fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'rt-weed | A Weed Picking/Proccessing script'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}