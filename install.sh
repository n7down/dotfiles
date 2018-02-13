#!/bin/bash

# make symbolic links to home folder
link_file() {
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

# install files
echo "installing basic file"
apt install -y curl zsh tmux

# install files for polybar
echo "installing files for polybar"
apt install -y cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev

# change default shell to zsh
if [ $SHELL != "/bin/zsh" ]
then
	echo "setting shell to zsh"
	chsh -s /bin/zsh
fi

# install vundle
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]
then
	echo "installing vundle"
	eval 'git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
fi

# install oh-my-zsh
if [ ! -d $HOME/.oh-my-zsh ]
then
	echo "installing oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo "creating/updating symlinks"
for i in _*
do
	link_file $i
done

# install oh-my-zsh themes
ln -sf oh-my-zsh/themes/gitster.zsh-theme $HOME/.oh-my-zsh/themes/gitster.zsh-theme

# install files from the config folder
