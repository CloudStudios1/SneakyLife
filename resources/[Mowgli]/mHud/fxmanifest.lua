fx_version "bodacious"
game "gta5"

client_scripts {
    "client.lua",
	'cl_hud.lua',
    'config.lua'
}

server_scripts {
	'@mFramework/server/async.lua',
	'@mysql-async/lib/MySQL.lua',
	"server.lua"
}

ui_page "ui/index.html"

files {
	"ui/index.html",
	"ui/script.js",
	"ui/style.css",
}

exports {
	"getRessource"
}