fx_version "cerulean"
game "gta5"
description "Standalone FiveM Apartment System"
author "UnKnown"

client_scripts  { "client/*lua" }
server_scripts  { "server/*lua" }
shared_scripts {
    'config.lua',
    '@ox_lib/init.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua'
}

lua54 'yes'