#!/bin/bash

[ $(sudo groups $USER | grep -c vboxusers) -eq 0 ] && sudo adduser $USER vboxusers

sudo apt-get update

sudo apt-get install -y \
		docker.io \
        git \
		htop \
        python3 \
		vim