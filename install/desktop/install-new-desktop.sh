#!/bin/bash

[ $(sudo groups $USER | grep -c vboxusers) -eq 0 ] && sudo adduser $USER vboxusers

sudo apt-get install -y \
		ardesia \
		build-essential \
		byzanz \
		clusterssh \
		colordiff \
		default-jdk \
		dkms \
		docker.io \
		erlang \
		filezilla \
		gddrescue \
		geeqie \
		gimp \
		git \
		gsfonts-other \
		gsfonts-x11 \
		gsmartcontrol \
		htop \
		indicator-multiload \
		inkscape \
		jabref \
		kolourpaint4 \
		kompare \
		linux-headers-generic \
		linux-source \
		lm-sensors \
		maven \
		meld \
		mercurial \
		mingw-w64 \
		mplayer \
		myspell-en-gb \
		myspell-en-us \
		myspell-pt-br \
		nfs-common \
		nmap \
		octave \
		okular \
		openssh-client \
		openssh-server \
		pdfgrep \
		python-gpgme \
		r-base-core \
		rdesktop \
		smartmontools \
		sshpass \
		subversion \
		terminator \
		texlive-full \
		texmaker \
		tree \
		unrar \
		vim \
		virtualbox \
		visualvm \
		vpnc \
		whois \
		wine \
		winetricks \
		wireshark \
		xfonts-100dpi \
		xfonts-75dpi \
		xfonts-base \
		xz-utils

		#linux-headers-$(uname -r) \
