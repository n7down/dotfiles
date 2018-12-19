#!/bin/bash

for i in _*
do
	rm -fr "${HOME}/${i/_/.}"
done

rm -rf $HOME/.oh-my-zsh
rm -rf $HOME/.config
rm -rf $HOME/.bin
