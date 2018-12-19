#!/bin/bash

# install files
install_i3_packages() {
	echo "installing i3 packages"
	sudo apt install -y 
		scrot \
		i3lock \
		feh

	# this is install for debian strech - need one for ubuntu?
	sudo apt install -y 
		libxcb-keysyms1-dev \
		libpango1.0-dev \
		libxcb-util0-dev \
		xcb \
		libxcb1-dev \
		libxcb-icccm4-dev \
		libyajl-dev \
		libev-dev \
		libxcb-xkb-dev \
		libxcb-cursor-dev \
		libxkbcommon-dev \
		libxcb-xinerama0-dev \
		libxkbcommon-x11-dev \
		libstartup-notification0-dev \
		libxcb-randr0-dev \
		libxcb-xrm0 \
		libxcb-xrm-dev \
		libxcb-shape0-dev 
}

install_polybar() {
	# install files for polybar
	echo "installing files for polybar"
	sudo apt install -y 
		cmake \
		cmake-data \
		libcairo2-dev \
		libxcb1-dev \
		libxcb-ewmh-dev \
		libxcb-icccm4-dev \
		libxcb-image0-dev \
		libxcb-randr0-dev \
		libxcb-util0-dev \
		libxcb-xkb-dev \
		pkg-config \
		python-xcbgen \
		xcb-proto \
		libxcb-xrm-dev \
		i3-wm \
		libasound2-dev \
		libmpdclient-dev \
		libiw-dev \
		libcurl4-openssl-dev

}

install_i3_config() {
	echo "installing i3 files"
	mkdir -p $HOME/.config/i3/scripts
	mkdir -p $HOME/.config/i3/images
	mkdir -p $HOME/.config/polybar
	mkdir -p $HOME/.config/conky

	# create symlinks to config folder
	# TODO: need to check that these files still exist
	ln -sf ${PWD}/config/i3/scripts/disk $HOME/.config/i3/scripts/disk
	ln -sf ${PWD}/config/i3/scripts/load_average $HOME/.config/i3/scripts/load_average
	ln -sf ${PWD}/config/i3/scripts/volume $HOME/.config/i3/scripts/volume
	ln -sf ${PWD}/config/i3/config $HOME/.config/i3/config
	ln -sf ${PWD}/config/i3/i3blocks.conf $HOME/.config/i3/i3blocks.conf
	ln -sf ${PWD}/config/i3/launch-polybar.sh $HOME/.config/i3/launch-polybar.sh
	ln -sf ${PWD}/config/polybar/config $HOME/.config/polybar/config
	ln -sf ${PWD}/config/polybar/trash $HOME/.config/polybar/trash
	ln -sf ${PWD}/config/conky/conky.conf $HOME/.config/conky/conky.conf
}
