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
echo "installing basic programs"
sudo apt install -y curl zsh tmux silversearcher-ag vim ctags

# change default shell to zsh
if [ $SHELL != "/bin/zsh" ]
then
	echo "setting shell to zsh"
	chsh -s /bin/zsh
fi

# install zsh-autosuggestions
echo "install zsh-autosuggestions"
sh -c "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

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

echo "creating/updating symlinks"
for i in _*
do
	link_file $i
done

# install files from the config folder
mkdir -p $HOME/.config/i3/scripts
mkdir -p $HOME/.config/i3/images
mkdir -p $HOME/.config/polybar
mkdir -p $HOME/.config/conky

# create symlinks to config folder
ln -sf ${PWD}/config/i3/scripts/disk $HOME/.config/i3/scripts/disk
ln -sf ${PWD}/config/i3/scripts/load_average $HOME/.config/i3/scripts/load_average
ln -sf ${PWD}/config/i3/scripts/volume $HOME/.config/i3/scripts/volume
ln -sf ${PWD}/config/i3/config $HOME/.config/i3/config
ln -sf ${PWD}/config/i3/i3blocks.conf $HOME/.config/i3/i3blocks.conf
ln -sf ${PWD}/config/i3/launch-polybar.sh $HOME/.config/i3/launch-polybar.sh
ln -sf ${PWD}/config/polybar/config $HOME/.config/polybar/config
ln -sf ${PWD}/config/polybar/trash $HOME/.config/polybar/trash
ln -sf ${PWD}/config/conky/conky.conf $HOME/.config/conky/conky.conf

# install oh-my-zsh themes
echo "installing oh-my-zsh themes"
cp oh-my-zsh/themes/gitster.zsh-theme $HOME/.oh-my-zsh/themes/

# run fc-cache
echo "executing fc-cache"
fc-cache

echo "completed - please logout and log back in for setup to take full effect"

