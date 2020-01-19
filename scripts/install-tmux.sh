#!/bin/bash

install_tmux() {
	mkdir -p ${HOME}/Source
	git clone https://github.com/gpakosz/.tmux.git ${HOME}/Source/tmux
	ln -sf ${HOME}/Source/tmux/.tmux.conf ${HOME}/.tmux.conf
}

install_tmux
