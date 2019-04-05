#!/usr/bin/env node

//const Sonos = require('../').Sonos
const Sonos = require('sonos')
const sonos = new Sonos(process.env.SONOS_HOST || '192.168.1.209')

sonos.getMusicLibrary('playlists', { start: 0, total: 25 }).then(playlists => {
	console.log('Got current playlists %j', playlists)
}).catch(err => { console.log('Error occurred %j', err) })

