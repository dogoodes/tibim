#!/bin/bash

[ $(sudo groups $USER | grep -c vboxusers) -eq 0 ] && sudo adduser $USER vboxusers

sudo apt-get install -y \
		docker.io \
        python3