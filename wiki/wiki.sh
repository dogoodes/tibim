#!/bin/bash

################################################################################

## Name: Wiki
## Description: Wiki

################################################################################

### ..:: Valid Path ::..

APP_ROOT_PATH=$APP_ROOT_PATH
if [ "$APP_ROOT_PATH" = "" ]; then
    APP_ROOT_PATH=$(pwd)
fi

################################################################################

### ..:: Execution key ::..

GIT_PATH=$APP_ROOT_PATH"/wiki/git"
LINUX_PATH=$APP_ROOT_PATH"/wiki/linux"
PLAY_PATH=$APP_ROOT_PATH"/wiki/play"
SOFTWARE_PATH=$APP_ROOT_PATH"/wiki/software"
SQL_PATH=$APP_ROOT_PATH"/wiki/sql"
PARAMETER=$1
COMMAND="tibim wiki"

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
    echo "See '$COMMAND help'."
    echo ""
    echo "Usage: $COMMAND COMMAND"
    echo ""
    echo "Options:"
    echo "      git"
    echo "      linux"
    echo "      play"
    echo "      software"
    echo "      sql"
    echo ""
    echo "Run '$COMMAND COMMAND help' for more information on a command."
    echo ""
}

call() {
    case $PARAMETER in
        git)       cat $GIT_PATH ;;
        linux)     cat $LINUX_PATH ;;
        play)      cat $PLAY_PATH ;;
        software)  cat $SOFTWARE_PATH ;;
        sql)       cat $SQL_PATH ;;
        *)         empty ;;
    esac
}

empty() {
    echo "Usage $COMMAND {git|linux|play|software|sql}"
}

main() {
    app "$@"
}

### ..:: Fluxo normal do programa ::..

main "$@"

exit 0

## ..:: Fim da execução ::..
