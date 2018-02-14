#!/bin/bash

[ $(sudo groups $USER | grep -c vboxusers) -eq 0 ] && sudo adduser $USER vboxusers

sudo apt-get update

sudo apt-get install -y \
		ardesia \
		colordiff \
		default-jdk \
		dkms \
		docker.io \
		docker-compose \
		eclipse \
		erlang \
		filezilla \
		gimp \
		git \
		gradle \
		htop \
		inkscape \
		kolourpaint4 \
		kompare \
		maven \
		meld \
		mplayer \
		myspell-en-gb \
		myspell-en-us \
		myspell-pt-br \
		nfs-common \
		nmap \
		okular \
		openssh-client \
		openssh-server \
		pdfgrep \
		python-gpgme \
		python3 \
		r-base-core \
		rabbitmq-server \
		rdesktop \
		sshpass \
		terminator \
		texmaker \
		tree \
		unrar \
		vim \
		virtualbox \
		vpnc \
		whois \
		wine \
		wireshark \
		xfonts-100dpi \
		xfonts-75dpi \
		xfonts-base \
		xz-utils
