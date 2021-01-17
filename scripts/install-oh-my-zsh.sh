#!/bin/bash

install_oh_my_zsh() {
	if [ ! -d $HOME/.oh-my-zsh ]
	then
		sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	fi
}

install_oh_my_zsh
