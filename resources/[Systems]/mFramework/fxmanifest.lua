fx_version('bodacious')
game('gta5')

loadscreen_manual_shutdown('yes')

server_scripts({
	'@mysql-async/lib/MySQL.lua',

	'locale.lua',
	'locales/fr.lua',

	'config.lua',
	'config.weapons.lua',

	'server/common.lua',
	'server/classes/groups.lua',
	'server/classes/player.lua',
	'server/functions.lua',
	'server/paycheck.lua',
	'server/main.lua',
	'server/commands.lua',
	'server/async.lua',
	'common/modules/math.lua',
	'common/modules/table.lua',
	'common/functions.lua'
})

client_scripts({
	'locale.lua',
	'locales/fr.lua',

	'config.lua',
	'config.weapons.lua',
	'client/common.lua',
	'client/entityiter.lua',
	'client/bulletin.lua',
	'client/functions.lua',
	'client/wrapper.lua',
	'client/spawnmanager.lua',
	'client/main.lua',

	'client/modules/death.lua',
	'client/modules/scaleform.lua',
	'client/modules/streaming.lua',

	'common/modules/math.lua',
	'common/modules/table.lua',
	'common/functions.lua'
})

ui_page 'ui/ui.html'

files {
    'ui/ui.html',
    'ui/images/*.jpg',
    'ui/images/*.png',
    'ui/audio/*.ogg',
    'ui/audio/*.mp3',
    'ui/audio/*.wav',
    'ui/fonts/*.ttf',
    'ui/css/*.css',
    'ui/js/*.js'
}

exports {
    'Send',
    'SendAdvanced',
    'SendSuccess',
    'SendInfo',
    'SendWarning',
    'SendError',
    'SendPinned',
    'Unpin',
    'UpdatePinned'
}

server_exports {
	"onSavedPlayer"
}

dependencies({
	'mysql-async'
})







