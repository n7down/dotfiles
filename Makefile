.PHONY: fonts
fonts:
	@echo "installing fonts..."
	@ln -sf ${PWD}/_fonts ${HOME}/.local/share/fonts
	@fc-cache
	@echo "done"

.PHONY: gitconfig
gitconfig:
	@echo "installing gitconfig..."
	@ln -sf ${PWD}/_gitconfig ${HOME}/.gitconfig
	@echo "done"

.PHONY: aliases
aliases:
	@echo "installing aliases..."
	@ln -sf ${PWD}/_aliases ${HOME}/.aliases
	@echo "done"

.PHONY: functions
functions:
	@echo "installing functions..."
	@ln -sf ${PWD}/_functions ${HOME}/.functions
	@echo "done"

.PHONY: lemonbar
lemonbar:
	@echo "installing lemonbar..."
	@ln -sf ${PWD}/_config/lemonbar ${HOME}/.config/lemonbar
	@echo "done"

.PHONY: wallpapers
wallpapers:
	@echo "installing wallpapers..."
	@mkdir -p ${HOME}/Pictures
	@ln -sf ${PWD}/_wallpapers ${HOME}/Pictures/wallpapers
	@echo "done"

.PHONY: fzf
fzf:
	@echo "installing fzf..."
	sudo pacman -S fzf
	@echo "done"

.PHONY: oh-my-zsh
oh-my-zsh:
	@echo "installing oh-my-zsh..."
	./scripts/install-oh-my-zsh.sh
	@echo "done"

.PHONY: zsh-shell
zsh-shell:
	@echo "installing zsh shell..."
	sudo pacman -S zsh
	@echo "done"

.PHONY: change-to-zsh-shell
change-to-zsh-shell:
	@echo "setting shell to zsh..."
	chsh -s /bin/zsh
	@echo "done"

.PHONY: zsh-autosuggestions
zsh-autosuggestions:
	echo "installing zsh-autosuggestions..."
	./scripts/install-zsh-autosuggestions.sh
	echo "done"

.PHONY: zsh-theme
zsh-theme:
	@echo "intalling zsh-theme..."
	@ln -sf ${PWD}/oh-my-zsh/themes/gitster.zsh-theme ~/.oh-my-zsh/custom/themes
	@echo "done"

.PHONY: zshrc
zshrc:
	@echo "installing zshrc..."
	@ln -sf ${PWD}/_zshrc ${HOME}/.zshrc
	@echo "done"

.PHONY: zsh
zsh: zsh-shell oh-my-zsh zsh-theme zsh-autosuggestions zshrc

.PHONY: bspwm
bspwm:
	@echo "installing bspwm..."
	@ln -sf ${PWD}/_config/bspwm ${HOME}/.config/bspwm
	@ln -sf ${PWD}/_config/sxhkd ${HOME}/.config/sxhkd
	@echo "done"

.PHONY: tmux
tmux:
	@echo "install tmux"
	./scripts/install-tmux.sh
	@ln -sf ${PWD}/.tmux.conf.local ${HOME}/.tmux.conf.local
	@echo "done"

.PHONY: deps
deps:
	@echo "installing deps..."
	sudo pacman -S feh git bspwm dmenu curl tmux
	@echo "done"
