#!/bin/bash

################################################################################

## Name: Install project Tibim
## Description: Install project Tibim

################################################################################

# create simbolic link
# ln -s <file> <link>
# ln -s <file> /usr/local/bin/tibim

################################################################################

### ..:: Valid Path ::..
export APP_ROOT_PATH="$(dirname "$(realpath "$0")")"
TIBIM_PATH=""

get_dir_root() {
    TIBIM_PATH="$(dirname "$APP_ROOT_PATH")"
}

create_simbolic_link() {
    sudo -S ln -s $TIBIM_PATH/tibim.sh /usr/local/bin/tibim
}

main() {
    get_dir_root
    create_simbolic_link
}

### ..:: Fluxo normal do programa ::..

main

exit 0

## ..:: Fim da execução ::..

