#!/usr/bin/env node

const { Sonos } = require('sonos')
const device = new Sonos('192.168.1.209')

/*device.getMusicLibrary('sonos_playlists', { start: 0, total: 25 }).then(playlists => {*/
	  //console.log(playlists)
/*}).catch(err => { console.log('Error occurred %j', err) })*/

/*device.getPlaylist('8', { start: 0, total: 25 }).then(results => {*/
	//console.log(results)
/*}).catch(err => { console.log('Error occurred %j', err) })*/

/*device.currentTrack().then(track => {*/
	//console.log(track)
/*}).catch(err => { console.log('Error occurred %j', err) })*/

device.getQueue().then(result => {
	console.log(result)
}).catch(err => {
	console.log('Error fetch queue %j', err)
})
