#!/bin/bash

HOME="$(pwd)"

function open_help() {
    echo ${HOME}
    echo $@
#    cat $@/help.sh
}

help() {
    case $1
    in
        commons)        open_help commons ;;
        docker)         open_help docker ;;
        docker-compose) open_help docker-compose ;;
        installer)      open_help installer ;;
        *)              echo "Opcao invalida!" ;;
    esac
}