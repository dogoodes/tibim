#!/bin/bash

################################################################################

## Name:
## Description:

################################################################################

source ../../commons/commons_log.sh

run () {
    docker-compose up -d
}

main() {
    run
}

### ..:: Fluxo normal do programa ::..

main

exit 0

## ..:: Fim da execução ::..
