#!/bin/bash

################################################################################

## Name:
## Description:

################################################################################

### ..:: Valid Path ::..

APP_ROOT_PATH=$APP_ROOT_PATH
if [ "$APP_ROOT_PATH" = "" ]; then
    APP_ROOT_PATH="$(dirname "$(realpath "$0")")"
fi

################################################################################

### ..:: Execution key ::..

NAME_SCRIPT="monitoring"
DOCKER_COMPOSE_PATH="$APP_ROOT_PATH/docker-compose/$NAME_SCRIPT/docker-compose.yml"
PARAMETER=$1
COMMAND="tibim docker-compose $NAME_SCRIPT"

################################################################################

app() {
    if [ "$PARAMETER" != "" ]; then
        case $PARAMETER in
            help)               help ;;
            background | -b)    run_in_background ;;
            *)                  help ;;
        esac
    else
        run
    fi
}

help() {
    echo ""
    echo "See '$COMMAND help'."
    echo ""
    echo "Usage: $COMMAND COMMAND"
    echo ""
    echo "Options:"
    echo "      background"
    echo ""
    echo "Run '$COMMAND COMMAND help' for more information on a command."
    echo ""
}

run () {
    docker-compose -f $DOCKER_COMPOSE_PATH up
}

run_in_background () {
    docker-compose -f $DOCKER_COMPOSE_PATH up -d
}

main() {
    app "$@"
}

################################################################################

### ..:: Fluxo normal do programa ::..

main "$@"

exit 0

################################################################################

## ..:: Fim da execução ::..
