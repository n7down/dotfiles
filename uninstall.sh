#!/bin/bash

for i in _*
do
	rm -fr "${HOME}/${i/_/.}"
done

rm -rf $HOME/.config/i3/scripts/disk
rm -rf $HOME/.config/i3/scripts/load_average
rm -rf $HOME/.config/i3/scripts/volume
rm -rf $HOME/.config/i3/config
rm -rf $HOME/.config/i3/i3blocks.conf
rm -rf $HOME/.config/i3/launch-polybar.sh
rm -rf $HOME/.config/polybar/config
rm -rf $HOME/.config/polybar/trash
