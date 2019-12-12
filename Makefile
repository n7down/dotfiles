.PHONY polybar
polybar:
	echo "installing polybar..."
	ln -sf ${PWD}/_config/polybar ${HOME}/.config/polybar 
	echo "done"
