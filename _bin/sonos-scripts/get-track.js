#!/usr/bin/env node

const { Sonos } = require('sonos')
const device = new Sonos('192.168.1.209')

device.currentTrack().then(track => {
	  console.log(track)
}).catch(err => { console.log('Error occurred %j', err) })

