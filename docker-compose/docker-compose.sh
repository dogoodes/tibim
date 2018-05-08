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

NAME_SCRIPT="docker-compose"
PARAMETER=$1
COMMAND="tibim $NAME_SCRIPT"

CAMPIMETRO_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/products/campimetro/campimetro.sh"
CEREBRO_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/cerebro/cerebro.sh"
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
    echo "      campimetro"
    echo "      cerebro"
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
        campimetro)       sh $CAMPIMETRO_PATH "$@" ;;
        cerebro)          sh $CEREBRO_PATH "$@" ;;
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
        *)                help ;;
    esac
}

main() {
    app "$@"
}

### ..:: Fluxo normal do programa ::..

main "$@"

exit 0

## ..:: Fim da execução ::..
