#!/usr/bin/env sh

sudo apt-get install -y \
	git \
	g++ \
	libgtk-3-dev \
	gtk-doc-tools \
	gnutls-bin \
	valac \
	intltool \
	libpcre2-dev \
	libglib3.0-cil-dev \
	libgnutls28-dev \
	libgirepository1.0-dev \
	libxml2-utils \
	gperf

mkdir -p ~/Source

git clone --recursive https://github.com/thestinger/termite.git ~/Source/termite
git clone https://github.com/thestinger/vte-ng.git ~/Source/vte-ng

echo export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
cd ~Source/vte-ng && ./autogen.sh && make && sudo make install
cd ~/Source/termite && make && sudo make install
sudo ldconfig
sudo mkdir -p /lib/terminfo/x; sudo ln -s \
	/usr/local/share/terminfo/x/xterm-termite \
	/lib/terminfo/x/xterm-termite
