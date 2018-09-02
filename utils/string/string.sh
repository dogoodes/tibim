#!/bin/bash

################################################################################

## Name: String Utils
## Description: String Utils

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
    if [ "${PARAMETER}" != "" ]; then
        case ${PARAMETER} in
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
    echo "      append"
    echo "      length, len"
    echo "      lower"
    echo "      prepend"
    echo "      replace"
    echo "      replace_empty"
    echo "      upper"
    echo ""
    echo "Run '$COMMAND COMMAND help' for more information on a command."
    echo ""
}

append() {
    ORIGINAL_TEXT="$(echo $@ | cut -d'%' -f1)"
    APPEND_TEXT="$(echo $@ | cut -d'%' -f2)"
    echo "$ORIGINAL_TEXT$APPEND_TEXT"
}

length() {
    echo -n "$@" | wc -m
}

lower() {
    echo "$@" | tr A-Z a-z
}

prepend() {
    ORIGINAL_TEXT="$(echo $@ | cut -d'%' -f1)"
    APPEND_TEXT="$(echo $@ | cut -d'%' -f2)"
    echo "$APPEND_TEXT$ORIGINAL_TEXT"
}

upper() {
    echo "$@" | tr a-z A-Z
}

replace() {
    ORIGINAL_TEXT="$(echo $@ | cut -d'%' -f1)"
    SEARCH_TEXT="$(echo $@ | cut -d'%' -f2)"
    REPLACEMENT="$(echo $@ | cut -d'%' -f3)"

    echo ${ORIGINAL_TEXT} | sed s/${SEARCH_TEXT}/${REPLACEMENT}/g

    if [ $? != 0 ]
    then
        echo "[ERRO] - Error, verify the parameters."
        exit 1
    fi
}

replace_empty() {
    echo "$@" | sed s/" "/""/g
}

call() {
    shift 1
    case ${PARAMETER} in
        append)         append "$@" ;;
        lenght | len)   length "$@" ;;
        lower)          lower "$@" ;;
        prepend)        prepend "$@" ;;
        replace)        replace "$@" ;;
        replace_empty)  replace_empty "$@" ;;
        upper)          upper "$@" ;;
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
