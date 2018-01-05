#!/bin/bash

################################################################################

## Name: Docker Pull Images
## Description: Script para atualizar as imagens docker

################################################################################

IMAGES=("cassandra"
        "elasticsearch"
        "haproxy"
        "harisekhon/hbase"
        "jenkins"
        "jordan/rundeck"
        "kibana"
        "kong"
        "logstash"
        "mongo"
        "puppet/puppetserver"
        "rabbitmq"
        "rancher/server"
        "redis"
        "sonarqube"
        "sonatype/nexus"
        "wurstmeister/kafka"
        "xemuliam/nifi"
       )

sudo () {
    echo sudo -S docker -v
}

pull () {
    docker pull $1
}

loop () {
    for image in "${IMAGES[@]}"
    do
        pull $image
    done
}

main() {
#	write_log "-----------------------------------------------------------------"
#	write_log "[INFO] - Inicio do script."

    sudo
    loop

#    write_log "[INFO] - Fim do script."
#    write_log "-----------------------------------------------------------------"
}

### ..:: Fluxo normal do programa ::..

[ "$DEBUG" == "n" ] && main &> /dev/null || main

exit 0

## ..:: Fim da execução ::..