#!/bin/bash

sudo apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/debian \
	$(lsb_release -cs) \
	stable"
sudo apt-get update
sudo apt-get remove -y docker docker-engine
sudo apt-get install -y git
sudo apt-get install -y docker-ce

# add user to docker group
sudo usermod -aG docker $USER

echo "please log out and log back in for script to take effect"
