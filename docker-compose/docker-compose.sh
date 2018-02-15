#!/bin/bash

################################################################################

## Name: Docker compose
## Description: Docker compose

################################################################################

### ..:: Valid Path ::..

APP_ROOT_PATH=$APP_ROOT_PATH
if [ "$APP_ROOT_PATH" = "" ]; then
    APP_ROOT_PATH=$(pwd)
fi

################################################################################

### ..:: Execution key ::..

ELASTICSEARCH_PATH=$APP_ROOT_PATH"/docker-compose/elasticsearch/elasticsearch.sh"
JENKINS_PATH=$APP_ROOT_PATH"/docker-compose/jenkins/jenkins.sh"
MONGODB_PATH=$APP_ROOT_PATH"/docker-compose/mongodb/mongodb.sh"
MYSQL_PATH=$APP_ROOT_PATH"/docker-compose/mysql"
NEXUX_PATH=$APP_ROOT_PATH"/docker-compose/nexus"
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
        elasticsearch)    sh $ELASTICSEARCH_PATH "$@" ;;
        jenkins)          sh $JENKINS_PATH "$@" ;;
        mongodb)          sh $MONGODB_PATH "$@" ;;
        mysql)            sh $MYSQL_PATH "$@" ;;
        nexus)            sh $NEXUX_PATH "$@" ;;
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
