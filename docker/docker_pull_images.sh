#!/bin/bash

################################################################################

## Name: 
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

function sudo () {
    logInfo "Executando o sudo."
    echo sudo -S docker -v
}

function pull () {
    docker pull $1
}

#TODO Rodar docker images e validar se a imagem ja existe...
function loop () {
    for image in "${IMAGES[@]}"
    do
        pull $image
    done
}

function main() {
	write_log "-----------------------------------------------------------------"
	write_log "[INFO] - Inicio do script."

    sudo
    loop

    write_log "[INFO] - Fim do script."
    write_log "-----------------------------------------------------------------"
}

################################################################################

### ..:: Fluxo normal do programa ::..

[ "$DEBUG" == "n" ] && main &> /dev/null || main

exit 0

################################################################################

## ..:: Fim da execução ::..