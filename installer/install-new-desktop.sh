#!/bin/bash

[ $(sudo groups $USER | grep -c vboxusers) -eq 0 ] && sudo adduser $USER vboxusers

sudo apt-get update

sudo apt-get install -y \
		ardesia \
		# atom \ 						>> Precisa instalar referências
		colordiff \
		default-jdk \
		dkms \
		docker.io \
		docker-compose \
		eclipse \
		erlang \
		filezilla \
		gimp \
		git \ 							#is a version control system for tracking changes in computer files and coordinating work on those files among multiple people. It is primarily used for source code management in software development
		gradle \ 						#build automation system
		htop \
		inkscape \
		iptraf \ 						#ip network monitor
		kolourpaint4 \
		kompare \
		maven \ 						#project management and comprehension tool
		meld \
		mplayer \
		myspell-en-gb \
		myspell-en-us \
		myspell-pt-br \
		nfs-common \
		nmap \
		# nodejs \
		# npm \
		okular \
		openssh-client \
		openssh-server \
		pdfgrep \
		python-gpgme \
		python3 \
		r-base-core \
		rabbitmq-server \
		rdesktop \
		# sbt \
		sshpass \
		terminator \ 				#terminal emulator
		texmaker \
		tree \
		unrar \ 						#applications for extracting RAR file archives
		# vagrant \
		vim \
		virtualbox \ 				#it supports the creation and management of guest virtual machines
		vpnc \
		whois \ 						#is a query and response protocol that is widely used for querying databases that store the registered users or assignees of an Internet resource, such as a domain name, an IP address block, or an autonomous system, but is also used for a wider range of other information
		wine \ 							#also provides a software library, known as Winelib, against which developers can compile Windows applications to help port them to Unix-like systems
		wireshark \ 				#it is used for network troubleshooting, analysis, software and communications protocol development, and education
		xfonts-100dpi \
		xfonts-75dpi \
		xfonts-base \
		xz-utils
