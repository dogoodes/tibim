#!/bin/bash

################################################################################

## Name: Tibim
## Description: Tibim

################################################################################

#Aux
#ln -s $HOME"/Developer/workspace/dogood/dogood-devops/tibim/tibim/tibim.sh tibim
#sudo chmod +x tibim
#sudo mv tibim /usr/local/bin/

# .bashrc
# export APP_ROOT_PATH="/home/fabiano/Developer/workspace/dogood/devops/tibim"

################################################################################

### ..:: Valid Path ::..

APP_ROOT_PATH=$APP_ROOT_PATH
if [ "$APP_ROOT_PATH" = "" ]; then
    # echo $APP_ROOT_PATH 1
    APP_ROOT_PATH=$(pwd)
# else
    # echo $APP_ROOT_PATH 2
fi

################################################################################

### ..:: Execution key ::..

DEBUG="y" #y or n

DOCKER_PATH="$APP_ROOT_PATH/docker/docker.sh"
DOCKER_COMPOSE_PATH="$APP_ROOT_PATH/docker-compose/docker-compose.sh"
INSTALLER_PATH="$APP_ROOT_PATH/docker-registry/docker-registry.sh"
KUBERNETES_PATH="$APP_ROOT_PATH/kubernetes/kubernetes.sh"
WIKI_PATH="$APP_ROOT_PATH/wiki/wiki.sh"
PARAMETER=$1
COMMAND="tibim"

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
    echo "See '$COMMAND help'."
    echo ""
    echo "Usage: $COMMAND COMMAND"
    echo ""
    echo "Options:"
    echo "      commons, -c"
    echo "      docker, -d"
    echo "      docker-compose, -dc"
    echo "      installer, -i"
    echo "      kubernetes, -k"
    echo "      open-path, -cd"
    echo "      version, -v"
    echo "      wiki, -w"
    echo ""
    echo "Run '$COMMAND COMMAND help' for more information on a command."
    echo ""
}

version() {
    echo "Tibim version 1.0.0"
}

open_path() {
    cd $APP_ROOT_PATH
    exec bash
}

call() {
    shift 1
    case $PARAMETER in
        commons | -c)          echo "$@" ;;
        docker | -d)           echo "$@" ;;
        docker-compose | -dc)  sh $DOCKER_COMPOSE_PATH "$@" ;;
        kubernetes | -k)       sh $KUBERNETES_PATH "$@" ;;
        installer | -i)        echo "$@" ;;
        open-path | -cd)       open_path ;;
        wiki | -w)             sh $WIKI_PATH "$@" ;;
        *)                     empty ;;
    esac
}

empty() {
    echo "Usage $COMMAND {commons|docker|docker-compose|installer|open-path|wiki}"
}

main() {
    app "$@"
}

### ..:: Fluxo normal do programa ::..

[ "$DEBUG" == "n" ] && main "$@" &> /dev/null || main "$@"

exit 0

## ..:: Fim da execução ::..
