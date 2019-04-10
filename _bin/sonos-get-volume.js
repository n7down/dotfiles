#!/usr/bin/env node

const { Sonos } = require('sonos')
const device = new Sonos('192.168.1.209')

device.getVolume().then(result => {
	  console.log(result)
}).catch(err => {
	  console.log('Error getting volume %j', err)
})
