#!/bin/bash

################################################################################

## Name:
## Description:

################################################################################

### ..:: Execution key ::..

APP_ROOT_PATH=$HOME"/Developer/workspace/dogood/dogood-devops/tibim/tibim"
DOCKER_COMPOSE_PATH=$APP_ROOT_PATH"/docker-compose/jenkins/docker-compose.yml"
PARAMETER=$1
COMMAND="tibim docker-compose jenkins"

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
