#!/bin/bash

################################################################################

## Name: Docker compose
## Description: Docker compose

################################################################################

### ..:: Execution key ::..

APP_ROOT_PATH=$(pwd)
JENKINS_PATH="/docker-compose/jenkins/jenkins.sh"
MONGODB_PATH="/docker-compose/mongodb/mongodb.sh"
MYSQL_PATH="/docker-compose/mysql"
NEXUX_PATH="/docker-compose/nexus"

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
    echo "See 'tibim docker-compose help'."
    echo ""
    echo "Usage: tibim docker-compose COMMAND"
    echo ""
    echo "Options:"
    echo "      jenkins"
    echo "      mongodb"
    echo "      mysql"
    echo "      nexus"
    echo ""
    echo "Run 'tibim docker-compose COMMAND help' for more information on a command."
    echo ""
}

call() {
    shift 1
    case $PARAMETER in
        jenkins)    sh $APP_ROOT_PATH$JENKINS_PATH "$@" ;;
        mongodb)    sh $APP_ROOT_PATH$MONGODB_PATH "$@" ;;
        mysql)      echo "$@" ;;
        nexus)      echo "$@" ;;
        *)          empty ;;
    esac
}

empty() {
    echo "Usage tibim docker-compose {jenkins|mongodb|mysql|nexus}"
}

main() {
    app "$@"
}

### ..:: Fluxo normal do programa ::..

main "$@"

exit 0

## ..:: Fim da execução ::..
