#!/bin/bash

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

#TODO Ver uma melhor forma de colocar o sudo
#sudo

#TODO Rodar docker images e validar se a imagem já existe...

for image in "${IMAGES[@]}"
do

#TODO Ver como vou fazer o log...
#    log "Running image $image"

    pull $image
done