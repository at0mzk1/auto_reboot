resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

description 'Shutdown Notifications'

version '1.0.0'

server_scripts {
    'server/main.lua',
    'config.lua'
}

dependencies {
    'es_extended'
}