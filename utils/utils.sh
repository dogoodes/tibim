#!/bin/bash

################################################################################

## Name: Utils
## Description: Utils

################################################################################

### ..:: Valid Path ::..

APP_ROOT_PATH=$APP_ROOT_PATH
if [ "$APP_ROOT_PATH" = "" ]; then
    APP_ROOT_PATH="$(dirname "$(realpath "$0")")"
fi

################################################################################

### ..:: Execution key ::..

NAME_SCRIPT="utils"
PARAMETER=$1
COMMAND="tibim $NAME_SCRIPT"

################################################################################

app() {
    if [ "$PARAMETER" != "" ]; then
        case $PARAMETER in
            help)   help ;;
            *)      call $@ ;;
        esac
    else
        help
    fi
}

help() {
    echo ""
    echo "See '$COMMAND help'."
    echo ""
    echo "Usage: $COMMAND COMMAND"
    echo ""
    echo "Options:"
    echo "      upper"
    echo "      lower"
    echo ""
    echo "Run '$COMMAND COMMAND help' for more information on a command."
    echo ""
}

upper() {
    echo "$1" | tr a-z A-Z
}

lower() {
    echo "$1" | tr A-Z a-z
}

call() {
    shift 1
    case $PARAMETER in
        upper)          upper "$@" ;;
        lower)          lower "$@" ;;
        *)                help ;;
    esac
}

main() {
    app "$@"
}

### ..:: Fluxo normal do programa ::..

main "$@"

exit 0

## ..:: Fim da execução ::..
