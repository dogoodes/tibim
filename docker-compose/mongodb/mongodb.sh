#!/bin/bash

################################################################################

## Name:
## Description:

################################################################################

source ../../commons/commons_log.sh

#TODO Definir se vai rodar em background...
#Se sim, mantem o -d
function run () {
    docker-compose up
#    docker-compose up -d
}

function main() {
#    write_log_info "Inicio do script."

    run

#    write_log_info "Fim do script."
}

################################################################################

### ..:: Fluxo normal do programa ::..

[ "$DEBUG" == "n" ] && main &> /dev/null || main

exit 0

################################################################################

## ..:: Fim da execução ::..