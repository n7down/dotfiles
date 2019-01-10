#!/bin/bash

install_packages() {
	echo "Installing packages"
	sudo apt install -y 
	libdbus-1-dev \
		libx11-dev \
		libxinerama-dev \
		libxrandr-dev \
		libxss-dev \
		libglib2.0-dev \
		libpango1.0-dev \
		libgtk-3-dev \
		libxdg-basedir-dev \
		libnotify-dev
}

install_dunst() {
	echo "Installing dunst"
	git clone https://github.com/dunst-project/dunst.git ~/Source/dunst
	cd ~/Source/dunst
	make
	sudo make install
}

install_config() {
	echo "Installing dunst config"
}
