#!/bin/bash

################################################################################

## Name: Wiki
## Description: Wiki

################################################################################

### ..:: Execution key ::..

APP_ROOT_PATH=$(pwd)
GIT_PATH="/wiki/git"
LINUX_PATH="/wiki/linux"
PLAY_PATH="/wiki/play"
SOFTWARE_PATH="/wiki/software"
SQL_PATH="/wiki/sql"

PARAMETER=$1

################################################################################

app() {
    if [ "$PARAMETER" != "" ]; then
        case $PARAMETER in
            help)   help ;;
            *)      call $@ ;;
        esac
    else
        empty
    fi
}

help() {
    echo ""
    echo "See 'tibim wiki help'."
    echo ""
    echo "Usage: tibim wiki COMMAND"
    echo ""
    echo "Options:"
    echo "      git"
    echo "      linux"
    echo "      play"
    echo "      software"
    echo "      sql"
    echo ""
    echo "Run 'tibim wiki COMMAND help' for more information on a command."
    echo ""
}

call() {
    case $PARAMETER in
        git)       cat $APP_ROOT_PATH$GIT_PATH ;;
        linux)     cat $APP_ROOT_PATH$LINUX_PATH ;;
        play)      cat $APP_ROOT_PATH$PLAY_PATH ;;
        software)  cat $APP_ROOT_PATH$SOFTWARE_PATH ;;
        sql)       cat $APP_ROOT_PATH$SQL_PATH ;;
        *)         empty ;;
    esac
}

empty() {
    echo "Usage tibim wiki {git|linux|play|software|sql}"
}

main() {
    app "$@"
}

### ..:: Fluxo normal do programa ::..

main "$@"

exit 0

## ..:: Fim da execução ::..
