#!/bin/bash

################################################################################

## Name:
## Description:

################################################################################

#Aux
#ln -s tibim.sh tibim
#sudo mv tibim /usr/local/bin/

################################################################################

app() {
    if [ "$1" != "" ]; then
        case $1 in
            -help)          help ;;
            -version | -v)  version ;;
            *)              call $@ ;;
        esac
    else
      call
    fi
}

help() {
    echo ""
    echo "See 'tibim -help'."
    echo ""
    echo "Usage: tibim COMMAND"
    echo ""
    echo "Options:"
    echo "      -commons"
    echo "      -docker"
    echo "      -docker-compose"
    echo "      -installer"
    echo "      -version"
    echo "      -wiki"
    echo ""
    echo "Run 'tibim COMMAND --help' for more information on a command."
    echo ""
}

version() {
    echo "Tibim version 1.0.0"
}

call() {
    case $1 in
        -commons | -c)          echo "$@" ;;
        -docker | -d)           echo "$@" ;;
        -docker-compose | -dc)  echo "$@" ;;
        -installer | -i)        echo "$@" ;;
        -wiki | -w)             echo "$@" ;;
        *)                      echo "Usage tibim {commons|docker|docker-compose|installer|wiki}" ;;
    esac
}

main() {
    app "$@"
}

### ..:: Fluxo normal do programa ::..

[ "$DEBUG" == "n" ] && main "$@" &> /dev/null || main "$@"

exit 0

## ..:: Fim da execução ::..
