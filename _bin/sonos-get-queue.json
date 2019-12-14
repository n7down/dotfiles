#!/usr/bin/env node

const { Sonos } = require('sonos')
const device = new Sonos('192.168.1.209')

device.getQueue().then(result => {
	  console.log(result)
}).catch(err => {
	  console.log('Error fetch queue %j', err)
})
