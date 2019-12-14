.PHONY: polybar
polybar:
	@echo "installing polybar..."
	@ln -sf ${PWD}/config/polybar ${HOME}/.config/polybar 
	@echo "done"

.PHONY: fonts
fonts:
	@echo "install fonts..."
	@ln -sf ${PWD}/_fonts ${HOME}/.local/share/fonts
	@fc-cache
	@echo "done"
