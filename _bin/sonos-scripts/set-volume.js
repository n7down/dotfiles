#!/usr/bin/env node

const { Sonos } = require('sonos')
const device = new Sonos('192.168.1.209')

const args = require('minimist')(process.argv.slice(2));
console.log("args: %j", args.s)

// FIXME: get the volume as a param
device.setVolume(args.s).then(result => {
	  console.log("Set volume %j", result)
}).catch(err => {
	  console.log('Error setting volume %j', err)
})
