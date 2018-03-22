#!/bin/bash

################################################################################

## Name: Docker compose
## Description: Docker compose

################################################################################

### ..:: Valid Path ::..

APP_ROOT_PATH=$APP_ROOT_PATH
if [ "$APP_ROOT_PATH" = "" ]; then
    APP_ROOT_PATH="$(dirname "$(realpath "$0")")"
fi

################################################################################

### ..:: Execution key ::..

SCRIPT="kubernetes"
PARAMETER=$1
COMMAND="tibim $SCRIPT"

JENKINS_PATH="$APP_ROOT_PATH/$SCRIPT/jenkins/jenkins.sh"
NEXUS_PATH="$APP_ROOT_PATH/$SCRIPT/nexus/nexus.sh"

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
    echo "      jenkins"
    echo ""
    echo "      nexus"
    echo ""
    echo "Run '$COMMAND COMMAND help' for more information on a command."
    echo ""
}

call() {
    shift 1
    case $PARAMETER in
        elasticsearch)    sh $ELASTICSEARCH_PATH "$@" ;;
        jenkins)          sh $JENKINS_PATH "$@" ;;
        mongodb)          sh $MONGODB_PATH "$@" ;;
        mysql)            sh $MYSQL_PATH "$@" ;;
        nexus)            sh $NEXUX_PATH "$@" ;;
        *)                empty ;;
    esac
}

main() {
    app "$@"
}

### ..:: Fluxo normal do programa ::..

main "$@"

exit 0

## ..:: Fim da execução ::..
