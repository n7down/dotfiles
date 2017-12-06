#!/bin/zsh
if [[ $1 == 'init' ]] 
then
	git init --bare $HOME/.dm
	git --git-dir=$HOME/.dm --work-tree=$HOME config status.showUntrackedFiles no
else
	git --git-dir=$HOME/.dm --work-tree=$HOME "$@" 
fi
