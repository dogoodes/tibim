#!/bin/bash

################################################################################

## Name: Mongodb
## Description: Mongodb

################################################################################

### ..:: Execution key ::..

APP_ROOT_PATH=$(pwd)
DOCKER_COMPOSE_PATH="/docker-compose/mongodb/docker-compose.yml"

PARAMETER=$1

PRINCIPAL="mongodb"

################################################################################

app() {
    if [ "$PARAMETER" != "" ]; then
        case $PARAMETER in
            help)               help ;;
            background | -b)    run_in_background ;;
            *)                  run $@ ;;
        esac
    else
        run
    fi
}

help() {
    echo ""
    echo "See 'tibim docker-compose $PRINCIPAL help'."
    echo ""
    echo "Usage: tibim docker-compose $PRINCIPAL COMMAND"
    echo ""
    echo "Options:"
    echo "      background"
    echo ""
    echo "Run 'tibim docker-compose $PRINCIPAL COMMAND help' for more information on a command."
    echo ""
}

run () {
    docker-compose -f $APP_ROOT_PATH$DOCKER_COMPOSE_PATH up
}

run_in_background () {
    docker-compose -f $APP_ROOT_PATH$DOCKER_COMPOSE_PATH up -d
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