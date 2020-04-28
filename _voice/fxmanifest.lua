fx_version 'adamant'
game 'gta5'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name 'ckf_voice'
description 'Voice chat system for CF.K Framework'
author 'Mack'
version 'v1.0.0'

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/script.js',
	'html/style.css',
	'html/mic.png'
}

client_scripts {
	'@_core/libs/utils.lua',
	'client.lua'
}