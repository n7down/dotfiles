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

.PHONY: lemonbar
lemonbar:
	@echo "install lemonbar..."
	@ln -sf ${PWD}/_config/lemonbar ${HOME}/.config/lemonbar
	@echo "done"

.PHONY: wallpapers
wallpapers:
	@echo "install wallpapers..."
	@mkdir -p ${HOME}/Pictures
	@ln -sf ${PWD}/_wallpapers ${HOME}/Pictures/wallpapers
	@echo "done"

.PHONY: deps
deps:
	@echo "installing deps..."
	pacman -S feh git
	@echo "done"
