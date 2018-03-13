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

NAME_SCRIPT="docker-compose"
DEVOPS_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/devops/devops.sh"
ELASTICSEARCH_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/elasticsearch/elasticsearch.sh"
GRAFANA_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/grafana/grafana.sh"
INFLUXDB_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/influxdb/influxdb.sh"
JENKINS_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/jenkins/jenkins.sh"
MONGODB_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/mongodb/mongodb.sh"
MONITORING_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/monitoring/monitoring.sh"
MYSQL_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/mysql/mysql.sh"
NEXUS_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/nexus/nexus.sh"
SONARQUBE_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/sonarqube/sonarqube.sh"
ZABBIX_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/zabbix/zabbix.sh"
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
    echo "      devops"
    echo "      elasticsearch"
    echo "      grafana"
    echo "      jenkins"
    echo "      mongodb"
    echo "      monitoring"
    echo "      mysql"
    echo "      nexus"
    echo "      sonarqube"
    echo "      zabbix"
    echo ""
    echo "Run '$COMMAND COMMAND help' for more information on a command."
    echo ""
}

call() {
    shift 1
    case $PARAMETER in
        devops)           sh $DEVOPS_PATH "$@" ;;
        elasticsearch)    sh $ELASTICSEARCH_PATH "$@" ;;
        grafana)          sh $GRAFANA_PATH "$@" ;;
        influxdb)         sh $INFLUXDB_PATH "$@" ;;
        jenkins)          sh $JENKINS_PATH "$@" ;;
        mongodb)          sh $MONGODB_PATH "$@" ;;
        monitoring)       sh $MONITORING_PATH "$@" ;;
        mysql)            sh $MYSQL_PATH "$@" ;;
        nexus)            sh $NEXUS_PATH "$@" ;;
        sonarqube)        sh $SONARQUBE_PATH "$@" ;;
        zabbix)           sh $ZABBIX_PATH "$@" ;;
        *)                empty ;;
    esac
}

empty() {
    echo "Usage $COMMAND {devops|elasticsearch|influxdb|jenkins|mongodb|mysql|nexus|sonarqube|zabbix}"
}

main() {
    app "$@"
}

### ..:: Fluxo normal do programa ::..

main "$@"

exit 0

## ..:: Fim da execução ::..
