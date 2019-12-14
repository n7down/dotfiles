#!/usr/bin/env node

const { Sonos } = require('sonos')
const device = new Sonos('10.2.10.134')

device.currentTrack().then(track => {
	  console.log(JSON.stringify(track, " ", 4))
}).catch(err => { console.log('Error occurred %j', err) })

