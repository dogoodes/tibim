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
KAFKA_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/kafka/kafka.sh"
KONG_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/kong/kong.sh"
MONGODB_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/mongodb/mongodb.sh"
MONITORING_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/monitoring/monitoring.sh"
MYSQL_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/mysql/mysql.sh"
NEXUS_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/nexus/nexus.sh"
NIFI_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/nifi/nifi.sh"
REDIS_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/redis/redis.sh"
RANCHER_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/rancher/rancher.sh"
SONARQUBE_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/sonarqube/sonarqube.sh"
SPARK_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/spark/spark.sh"
STREAM_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/stream/stream.sh"
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
    echo "      cerebro"
    echo "      devops"
    echo "      elasticsearch"
    echo "      grafana"
    echo "      influxdb"
    echo "      jenkins"
    echo "      kafka"
    echo "      kong"
    echo "      mongodb"
    echo "      monitoring"
    echo "      mysql"
    echo "      nexus"
    echo "      nifi"
    echo "      rancher"
    echo "      redis"
    echo "      sonarqube"
    echo "      spark"
    echo "      stream"
    echo "      zabbix"
    echo ""
    echo "Run '$COMMAND COMMAND help' for more information on a command."
    echo ""
}

call() {
    shift 1
    case $PARAMETER in
        cerebro)          sh $CEREBRO_PATH "$@" ;;
        devops)           sh $DEVOPS_PATH "$@" ;;
        elasticsearch)    sh $ELASTICSEARCH_PATH "$@" ;;
        grafana)          sh $GRAFANA_PATH "$@" ;;
        influxdb)         sh $INFLUXDB_PATH "$@" ;;
        jenkins)          sh $JENKINS_PATH "$@" ;;
        kafka)            sh $KAFKA_PATH "$@" ;;
        kong)             sh $KONG_PATH "$@" ;;
        mongodb)          sh $MONGODB_PATH "$@" ;;
        monitoring)       sh $MONITORING_PATH "$@" ;;
        mysql)            sh $MYSQL_PATH "$@" ;;
        nexus)            sh $NEXUS_PATH "$@" ;;
        nifi)             sh $NIFI_PATH "$@" ;;
        rancher)          sh $RANCHER_PATH "$@" ;;
        redis)            sh $REDIS_PATH "$@" ;;
        sonarqube)        sh $SONARQUBE_PATH "$@" ;;
        spark)            sh $SPARK_PATH "$@" ;;
        stream)           sh $STREAM_PATH "$@" ;;
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
