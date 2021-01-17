#!/bin/bash

install_zsh_autosuggestions() {
	sh -c "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
}

install_zsh_autosuggestions
