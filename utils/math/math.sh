#!/bin/bash

################################################################################

## Name: Math Utils
## Description: Math Utils

################################################################################

### ..:: Valid Path ::..

APP_ROOT_PATH=$APP_ROOT_PATH
if [ "$APP_ROOT_PATH" = "" ]; then
    APP_ROOT_PATH="$(dirname "$(realpath "$0")")"
fi

################################################################################

### ..:: Execution key ::..

NAME_SCRIPT="utils"
PARAMETER=$1
COMMAND="tibim $NAME_SCRIPT"

################################################################################

app() {
    if [ "${PARAMETER}" != "" ]; then
        case ${PARAMETER} in
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
    echo "      minus, -"
    echo "      obelus, /"
    echo "      plus, +"
    echo "      times, *"
    echo ""
    echo "Run '$COMMAND COMMAND help' for more information on a command."
    echo ""
}

expression() {
    echo `expr $@`
}

subtraction() {
    EXPRESSION=$(echo $@ | tr "-" "\n")
    RESULT=0
    CONT=0

    for N in ${EXPRESSION}
    do
        if [ ${CONT} -eq 0 ]
        then
            RESULT=${N}
            CONT=`expr ${CONT} + 1`
        else
            RESULT=`expr ${RESULT} - ${N}`
        fi
    done

    echo ${RESULT}
}

division() {
    EXPRESSION=$(echo $@ | tr "/" "\n")
    RESULT=0
    CONT=0

    for N in ${EXPRESSION}
    do
        if [ ${CONT} -eq 0 ]
        then
            RESULT=${N}
            CONT=`expr ${CONT} + 1`
        else
            RESULT=`expr ${RESULT} / ${N}`
        fi
    done

    echo ${RESULT}

addition() {
    EXPRESSION=$(echo $@ | tr "+" "\n")
    RESULT=0
    CONT=0

    for N in ${EXPRESSION}
    do
        if [ ${CONT} -eq 0 ]
        then
            RESULT=${N}
            CONT=`expr ${CONT} + 1`
        else
            RESULT=`expr ${RESULT} + ${N}`
        fi
    done

    echo ${RESULT}
}

multiplication() {
    EXPRESSION=$(echo $@ | tr "*" "\n")
    I=0
    for N in ${EXPRESSION}
    do
        I=`expr ${I} - ${N}`
    done

    echo ${I}
}

call() {
    shift 1
    case ${PARAMETER} in
        expr)         expression "$@" ;;
        minus | -)    subtraction "$@" ;;
        obelus | /)   division "$@" ;;
        plus | +)     addition "$@" ;;
        times | x)    multiplication "$@" ;;
        *)        help ;;
    esac
}

main() {
    app "$@"
}

### ..:: Fluxo normal do programa ::..

main "$@"

exit 0

## ..:: Fim da execução ::..
