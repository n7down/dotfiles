.PHONY: polybar
polybar:
	@echo "installing polybar..."
	@ln -sf ${PWD}/_config/polybar ${HOME}/.config/polybar 
	@echo "done"

.PHONY: yabar
yabar:
	@echo "installing yabar..."
	@ln -sf ${PWD}/_config/yabar ${HOME}/.config/yabar
	@echo "done"

.PHONY: fonts
fonts:
	@echo "install fonts..."
	@ln -sf ${PWD}/_fonts ${HOME}/.local/share/fonts
	@fc-cache
	@echo "done"

.PHONY: gitconfig
gitconfig:
	@echo "install gitconfig..."
	@ln -sf ${PWD}/_gitconfig ${HOME}/.gitconfig
	@echo "done"

.PHONY: aliases
aliases:
	@echo "install aliases..."
	@ln -sf ${PWD}/_aliases ${HOME}/.aliases
	@echo "done"

.PHONY: functions
functions:
	@echo "install functions..."
	@ln -sf ${PWD}/_functions ${HOME}/.functions
	@echo "done"


