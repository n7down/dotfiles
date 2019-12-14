#!/usr/bin/env node

const { Sonos } = require('sonos')
const device = new Sonos('192.168.1.209')

device.play('x-file-cifs://localhost/home/josh/Music/Zedd & Katy Perry/365/01 365.mp3').then(success => {
	  console.log('Playing')
}).catch(err => { console.log('Error occurred %j', err) })
