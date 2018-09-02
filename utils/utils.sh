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

DATE_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/date/date.sh"
HOST_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/host/host.sh"
MATH_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/math/math.sh"
STRING_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/string/string.sh"

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
#    echo "      date, -d"
#    echo "      host, -h"
    echo "      math, -m"
    echo "      string, -s"
    echo ""
    echo "Run '$COMMAND COMMAND help' for more information on a command."
    echo ""
}

call() {
    shift 1
    case $PARAMETER in
#        date | -d)           sh $DATE_PATH "$@" ;;
#        host | -h)           sh $HOST_PATH "$@" ;;
        math | -m)           sh $MATH_PATH "$@" ;;
        string | -s)         sh $STRING_PATH "$@" ;;
        *)              help ;;
    esac
}

main() {
    app "$@"
}

### ..:: Fluxo normal do programa ::..

main "$@"

exit 0

## ..:: Fim da execução ::..
