#!/bin/bash

################################################################################

## Name:
## Description:

################################################################################

app() {
    if [ "$1" != "" ]; then
        case $1 in
            -help)      help ;;
            -v | -version)   version ;;
            *)          call $@ ;;
        esac
    fi
}

help() {
    echo ""
    echo "See 'tibim -help'."
    echo ""
    echo "Usage: tibim COMMAND"
    echo ""
    echo "Options:"
    echo "      -commons"
    echo "      -docker"
    echo "      -docker-compose"
    echo "      -installer"
    echo "      -version"
    echo ""
    echo "Run 'tibim COMMAND --help' for more information on a command."
    echo ""
}

version() {
    echo "Tibim version 1.0.0"
}

call() {
    case $1 in
        -commons)        echo "$@" ;;
        -docker)         echo "$@" ;;
        -docker-compose) echo "$@" ;;
        -installer)      echo "$@" ;;
        *)              echo "Usage tibim {commons|docker|docker-compose|installer}" ;;
    esac
}

main() {
    app "$@"
}

### ..:: Fluxo normal do programa ::..

[ "$DEBUG" == "n" ] && main "$@" &> /dev/null || main "$@"

exit 0

## ..:: Fim da execução ::..