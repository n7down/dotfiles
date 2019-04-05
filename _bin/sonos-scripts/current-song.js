#!/usr/bin/env node

const { Sonos } = require('sonos')
const device = new Sonos('192.168.1.209');
const terminalImage = require('terminal-image');
const got = require('got');

device.currentTrack().then(track => {
	console.log(track)
	console.log('track: ', track.albumArtURL)
	//got('sindresorhus.com/unicorn', {encoding: null}).then(image => {
	got(track.albumArtURL, {encoding: null}).then(image => {
		console.log(terminalImage.buffer(body));
	}).catch(err => { console.log('Unable to get image %j', err) })
}).catch(err => { console.log('Error occurred %j', err) })

// FIXME: can i display the image from the album art?

