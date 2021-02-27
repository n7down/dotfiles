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

.PHONY: exports
exports:
	@echo "installing exports..."
	@ln -sf ${PWD}/_exports ${HOME}/.exports
	@echo "done"

.PHONY: path
path:
	@echo "installing path..."
	@ln -sf ${PWD}/_path ${HOME}/.path
	@echo "done"

.PHONY: screenlayout
screenlayout:
	@echo "installing screenlayout..."
	@ln -sf ${PWD}/_screenlayout ${HOME}/.screenlayout
	@echo "done"

.PHONY: docker_functions
docker_functions:
	@echo "installing docker_functions..."
	@ln -sf ${PWD}/_docker_functions ${HOME}/.docker_functions
	@echo "done"

.PHONY: lemonbar
lemonbar:
	@echo "installing lemonbar..."
	@ln -sf ${PWD}/_config/lemonbar ${HOME}/.config/lemonbar
	@echo "done"

.PHONY: polybar
polybar:
	@echo "installing polybar..."
	@ln -sf ${PWD}/_config/polybar ${HOME}/.config/polybar
	@echo "done"

.PHONY: wallpapers
wallpapers:
	@echo "installing wallpapers..."
	@mkdir -p ${HOME}/Pictures
	@ln -sf ${PWD}/_wallpapers ${HOME}/Pictures/wallpapers
	@echo "done"

# FIXME: install from - https://github.com/junegunn/fzf
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

.PHONY: mpd
mpd:
	@echo "installing mpd..."
	@ln -sf ${PWD}/_mpd ${HOME}/.mpd
	@echo "done"

.PHONY: ncmpcpp
ncmpcpp:
	@echo "installing ncmpcpp..."
	@ln -sf ${PWD}/_ncmpcpp ${HOME}/.ncmpcpp
	@echo "done"

.PHONY: bspwm
bspwm:
	@echo "installing bspwm..."
	@ln -sf ${PWD}/_config/bspwm ${HOME}/.config/bspwm
	@ln -sf ${PWD}/_config/sxhkd ${HOME}/.config/sxhkd
	@echo "done"

.PHONY: xorg
xorg:
	@echo "installing xorg files..."
	@ln -sf ${PWD}/_Xresources ${HOME}/.Xresources
	@ln -sf ${PWD}/_xinitrc ${HOME}/.xinitrc
	@ln -sf ${PWD}/_zprofile ${HOME}/.zprofile
	@echo "done"

.PHONY: tmux
tmux:
	@echo "installing tmux..."
	./scripts/install-tmux.sh
	@ln -sf ${PWD}/_tmux.conf.local ${HOME}/.tmux.conf.local
	@echo "done"

.PHONY: st
st:
	@echo "installing st..."
	git@github.com:n7down/st.git ${HOME}/Source/st
	# TODO: run sudo make clean install from makefile
	@echo "done"

.PHONY: nvim
nvim:
	@echo "installing nvim..."
	@ln -sf ${PWD}/_config/nvim ${HOME}/.config/nvim
	@echo "done"

.PHONY: bin
bin:
	@echo "installing bin..."
	@ln -sf ${PWD}/_bin ${HOME}/.bin
	@echo "done"

.PHONY: tig
tig:
	@echo "installing tig..."
	@ln -sf ${PWD}/_config/tig ${HOME}/.config/tig
	@echo "done"

.PHONY: newsboat
newsboat:
	@echo "installing newsboat..."
	@ln -sf ${PWD}/_config/newsboat ${HOME}/.config/newsboat
	@echo "done"

.PHONY: deps
deps:
	@echo "installing deps..."
	sudo pacman -S feh git bspwm dmenu curl tmux neovim htop xorg-xbacklight ctags mpd tig ncmpcpp zsh-autosuggestions newsboat
	@echo "done"

