#!/bin/bash

################################################################################

## Name: Docker compose
## Description: Docker compose

################################################################################

### ..:: Valid Path ::..

APP_ROOT_PATH=$APP_ROOT_PATH
if [ "$APP_ROOT_PATH" = "" ]; then
    # echo $APP_ROOT_PATH 1
    APP_ROOT_PATH=$(pwd)
# else
    # echo $APP_ROOT_PATH 2
fi

################################################################################

### ..:: Execution key ::..

SCRIPT="kubernetes"
ELASTICSEARCH_PATH="$APP_ROOT_PATH/$SCRIPT/elasticsearch/elasticsearch.sh"
JENKINS_PATH="$APP_ROOT_PATH/$SCRIPT/jenkins/jenkins.sh"
MONGODB_PATH="$APP_ROOT_PATH/$SCRIPT/mongodb/mongodb.sh"
MYSQL_PATH="$APP_ROOT_PATH/$SCRIPT/mysql"
NEXUX_PATH="$APP_ROOT_PATH/$SCRIPT/nexus"
PARAMETER=$1
COMMAND="tibim $SCRIPT"

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
