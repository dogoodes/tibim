#!/bin/bash

################################################################################

## Name: Docker compose
## Description: Docker compose

################################################################################

### ..:: Execution key ::..

APP_ROOT_PATH=$(pwd)
ELASTICSEARCH_PATH="/docker-compose/elasticsearch/elasticsearch.sh"
JENKINS_PATH="/docker-compose/jenkins/jenkins.sh"
MONGODB_PATH="/docker-compose/mongodb/mongodb.sh"
MYSQL_PATH="/docker-compose/mysql"
NEXUX_PATH="/docker-compose/nexus"
PARAMETER=$1
COMMAND="tibim docker-compose"

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
    echo "      elasticsearch"
    echo "      jenkins"
    echo "      mongodb"
    echo "      mysql"
    echo "      nexus"
    echo ""
    echo "Run '$COMMAND COMMAND help' for more information on a command."
    echo ""
}

call() {
    shift 1
    case $PARAMETER in
        elasticsearch)    sh $APP_ROOT_PATH$ELASTICSEARCH_PATH "$@" ;;
        jenkins)          sh $APP_ROOT_PATH$JENKINS_PATH "$@" ;;
        mongodb)          sh $APP_ROOT_PATH$MONGODB_PATH "$@" ;;
        mysql)            sh $APP_ROOT_PATH$MYSQL_PATH "$@" ;;
        nexus)            sh $APP_ROOT_PATH$NEXUX_PATH "$@" ;;
        *)                empty ;;
    esac
}

empty() {
    echo "Usage $COMMAND {elasticsearch|jenkins|mongodb|mysql|nexus}"
}

main() {
    app "$@"
}

### ..:: Fluxo normal do programa ::..

main "$@"

exit 0

## ..:: Fim da execução ::..
