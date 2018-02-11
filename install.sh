#!/bin/sh

# make symbolic links to home folder
link_file() {
	source="${PWD}/$1"
	target="${HOME}/${1/_/.}"

	if [ -e $target ] ; then
		if [ ! -d $target ] ; then
			echo "Update\t$target"
			mv $target $target.bak
			ln -sf ${source} ${target}
		fi
	else
		echo "Install\t$target"
		ln -sf ${source} ${target}
	fi
}

for i in _*
do
	link_file $i
done

# change default shell to zsh
if [ ! $SHELL -eq "/bin/zsh" ]
then
	chsh -s /bin/zsh
fi

# install vundle
if [ ! -d $HOME/.vim/bundle ]
then
	git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

# install oh-my-zsh
if [ ! -d $HOME/.oh-my-zsh ]
then
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

