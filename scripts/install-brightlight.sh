#!/bin/bash

install_packages() {
	sudo apt install -y libbsd-dev
}

install_backlight() {
	mkdir -p ~/Source
	cd Source
	git clone https://github.com/multiplexd/brightlight.git
	cd brightlight
	make

	# make symlink to ~/.bin folder
	mkdir -p ~/.bin
	ln -sf ${PWD} ${HOME}/.bin
	sudo chown root:root ${HOME}/.bin/brightlight
	sudo chmod u+s ${HOME}/.bin/brightlight
}
