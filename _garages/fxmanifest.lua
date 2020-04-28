fx_version 'adamant'
game 'gta5'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name 'ckf_garages'
description 'A garage system for CK.F Framework'
author 'Mack'
version 'v1.0.0'


client_scripts {
	"@_core/libs/utils.lua",
    "warmenu.lua",
    "config.lua",
    "client.lua",
}

server_scripts {
	"@_core/libs/utils.lua",
    "config.lua",
    "server.lua",
}