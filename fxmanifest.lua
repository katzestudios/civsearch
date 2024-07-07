fx_version 'cerulean'
game 'gta5'
shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    '@ox_target'
}


server_script 'server.lua'
client_scripts {
    
    'client.lua',
    '@NativeUI/NativeUI.lua'
}

lua54 'yes'
