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

BITWARDEN_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/bitwarden/bitwarden.sh"
CEREBRO_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/cerebro/cerebro.sh"
DEVOPS_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/devops/devops.sh"
ELASTICSEARCH_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/elasticsearch/elasticsearch.sh"
GITLAB_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/gitlab/gitlab.sh"
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
PASSBOLT_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/passbolt/passbolt.sh"
POSTGRES_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/postgres/postgres.sh"
REDIS_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/redis/redis.sh"
RANCHER_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/rancher/rancher.sh"
SONARQUBE_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/sonarqube/sonarqube.sh"
SPARK_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/spark/spark.sh"
STREAM_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/stream/stream.sh"
TRAEFIK_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/traefik/traefik.sh"
TYK_PATH="$APP_ROOT_PATH/$NAME_SCRIPT/tyk/tyk.sh"
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
    echo "      bitwarden"
    echo "      cerebro"
    echo "      devops"
    echo "      elasticsearch"
    echo "      grafana"
    echo "      gitlab"
    echo "      influxdb"
    echo "      jenkins"
    echo "      kafka"
    echo "      kong"
    echo "      mongodb"
    echo "      monitoring"
    echo "      mysql"
    echo "      nexus"
    echo "      nifi"
    echo "      passbolt"
    echo "      postgres"
    echo "      rancher"
    echo "      redis"
    echo "      sonarqube"
    echo "      spark"
    echo "      stream"
    echo "      traefik"
    echo "      tyk"
    echo "      zabbix"
    echo ""
    echo "Run '$COMMAND COMMAND help' for more information on a command."
    echo ""
}

call() {
    shift 1
    case $PARAMETER in
        bitwarden)        sh $BITWARDEN_PATH "$@" ;;
        cerebro)          sh $CEREBRO_PATH "$@" ;;
        devops)           sh $DEVOPS_PATH "$@" ;;
        elasticsearch)    sh $ELASTICSEARCH_PATH "$@" ;;
        grafana)          sh $GRAFANA_PATH "$@" ;;
        gitlab)           sh $GITLAB_PATH "$@" ;;
        influxdb)         sh $INFLUXDB_PATH "$@" ;;
        jenkins)          sh $JENKINS_PATH "$@" ;;
        kafka)            sh $KAFKA_PATH "$@" ;;
        kong)             sh $KONG_PATH "$@" ;;
        mongodb)          sh $MONGODB_PATH "$@" ;;
        monitoring)       sh $MONITORING_PATH "$@" ;;
        mysql)            sh $MYSQL_PATH "$@" ;;
        nexus)            sh $NEXUS_PATH "$@" ;;
        nifi)             sh $NIFI_PATH "$@" ;;
        passbolt)         sh $PASSBOLT_PATH "$@" ;;
        postgres)         sh $POSTGRES_PATH "$@" ;;
        rancher)          sh $RANCHER_PATH "$@" ;;
        redis)            sh $REDIS_PATH "$@" ;;
        sonarqube)        sh $SONARQUBE_PATH "$@" ;;
        spark)            sh $SPARK_PATH "$@" ;;
        stream)           sh $STREAM_PATH "$@" ;;
        traefik)          sh $TRAEFIK_PATH "$@" ;;
        tyk)              sh $TYK_PATH "$@" ;;
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
