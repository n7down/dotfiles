#!/usr/bin/env node

const { DeviceDiscovery } = require('sonos')

// event on all found...
DeviceDiscovery((device) => {
	console.log('found device at ' + device.host)

	// mute every device...
	device.setMuted(true).then(`${device.host} now muted`)
})

// find one device
DeviceDiscovery().once('DeviceAvailable', (device) => {
	console.log('found device at ' + device.host)

	// get all groups
	device.getAllGroups().then(console.log)
})
