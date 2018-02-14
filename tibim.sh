#!/bin/bash

################################################################################

## Name: Tibim
## Description: Tibim

################################################################################

#Aux
#ln -s tibim.sh tibim
#sudo chmod +x tibim
#sudo mv tibim /usr/local/bin/

################################################################################

### ..:: Execution key ::..

DEBUG="y" #y or n

APP_ROOT_PATH=$(pwd)
DOCKER_PATH="/docker/docker.sh"
DOCKER_COMPOSE_PATH="/docker-compose/docker-compose.sh"
INSTALLER_PATH="/docker-registry/docker-registry.sh"
VAGRANT_PATH="/vagrant/vagrant.sh"
WIKI_PATH="/wiki/wiki.sh"

PARAMETER=$1

################################################################################


app() {
    if [ "$PARAMETER" != "" ]; then
        case $PARAMETER in
            help)           help ;;
            version | -v)   version ;;
            *)              call $@ ;;
        esac
    else
        empty
    fi
}

help() {
    echo ""
    echo "See 'tibim help'."
    echo ""
    echo "Usage: tibim COMMAND"
    echo ""
    echo "Options:"
    echo "      commons"
    echo "      docker"
    echo "      docker-compose"
    echo "      installer"
    echo "      version"
    echo "      wiki"
    echo ""
    echo "Run 'tibim COMMAND help' for more information on a command."
    echo ""
}

version() {
    echo "Tibim version 1.0.0"
}

call() {
    shift 1
    case $PARAMETER in
        commons | -c)          echo "$@" ;;
        docker | -d)           echo "$@" ;;
        docker-compose | -dc)  sh $APP_ROOT_PATH$DOCKER_COMPOSE_PATH "$@" ;;
        installer | -i)        echo "$@" ;;
        wiki | -w)             sh $APP_ROOT_PATH$WIKI_PATH "$@" ;;
        *)                     empty ;;
    esac
}

empty() {
    echo "Usage tibim {commons|docker|docker-compose|installer|wiki}"
}

main() {
    app "$@"
}

### ..:: Fluxo normal do programa ::..

[ "$DEBUG" == "n" ] && main "$@" &> /dev/null || main "$@"

exit 0

## ..:: Fim da execução ::..
