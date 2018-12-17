#!/bin/bash

OS="$(uname -a)"

# make symbolic links to home folder
link_files() {
	source="${PWD}/$1"
	target="${HOME}/${1/_/.}"

	if [ -e $target ] ; then
		if [ ! -d $target ] ; then
			echo "Update $target"
			mv $target $target.bak
			ln -sf ${source} ${target}
		fi
	else
		echo "Install $target"
		ln -sf ${source} ${target}
	fi
}

install_mac_packages() {
	# install homebrew
	command -v brew >/dev/null 2>&1 || { echo >&2 "installing homebrew"; \
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

	# install brew things
	command -v ctags >/dev/null 2>&1 || { echo >&2 "installing packages"; \
		brew install ctags; \
		brew install the_silver_searcher; \
		brew install tmux; }
}

install_linux_packages() {
	# install files
	echo "installing packages"
	sudo apt install -y curl zsh tmux silversearcher-ag vim ctags
}

if test "$OS" = "Darwin"; then
	install_mac_packages
else if test "$OS" = "Linux"; then 
	install_linux_packages
fi

# install vundle
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]
then
	echo "installing vundle"
	sh -c "git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
fi

# install oh-my-zsh
if [ ! -d $HOME/.oh-my-zsh ]
then
	echo "installing oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# install fzf
if [ ! -d $HOME/.fzf ]
then
	echo "installing fzf"
	sh -c "git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install"
fi

# change default shell to zsh
if [ $SHELL != "/bin/zsh" ]
then
	echo "setting shell to zsh"
	chsh -s /bin/zsh
fi

# install zsh-autosuggestions
echo "install zsh-autosuggestions"
sh -c "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

echo "creating/updating symlinks"
for i in _*
do
	link_files $i
done

# install bin files
echo "install files to bin folder"
mkdir -p $HOME/.bin
curl -o ~/.bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr
curl https://cht.sh/:cht.sh > ~/.bin/cht
chmod +x ~/.bin/cht

# install oh-my-zsh themes
echo "installing oh-my-zsh themes"
cp oh-my-zsh/themes/gitster.zsh-theme $HOME/.oh-my-zsh/themes/

# run fc-cache
echo "executing fc-cache"
fc-cache

echo "completed - please logout and log back in for setup to take full effect"

