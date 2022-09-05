fx_version('bodacious')
game('gta5')


ui_page('html/ui.html')

files({
	'html/ui.html',
	'html/css/app.css',
	'html/scripts/app.js'
})


client_scripts {
	'@mFramework/locale.lua',

	-- RAGEUI
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",

	"client/classes/*.lua",
	"client/*.lua"
}

server_scripts {
	'@mFramework/server/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/classes/*.lua',
	'server/*.lua'
}

dependency('mFramework')







