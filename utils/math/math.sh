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
    echo "      expression, expr, -e"
    echo "      addition, -a, +"
    echo "      division, -d, /"
    echo "      mod"
    echo "      multiplication, -m, x"
    echo "      subtraction, -s, -"
    echo ""
    echo "Run '$COMMAND COMMAND help' for more information on a command."
    echo ""
}

expression() {
    echo `expr $@`
}

addition() {
    EXPRESSION=$(echo $@ | tr " " "\n")
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

division() {
    EXPRESSION=$(echo $@ | tr " " "\n")
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
}

mod() {
    echo "Building..."
}

multiplication() {
    EXPRESSION=$(echo $@ | tr " " "\n")
    RESULT=0
    CONT=0

    for N in ${EXPRESSION}
    do
        if [ ${CONT} -eq 0 ]
        then
            RESULT=${N}
            CONT=`expr ${CONT} + 1`
        else
            RESULT=`expr ${RESULT} \* ${N}`
        fi
    done

    echo ${RESULT}
}

random() {
    MIN="$(echo $@ | cut -d' ' -f1)"
    MAX="$(echo $@ | cut -d' ' -f2)"

    shuf -i ${MIN}-${MAX} -n 1
}

subtraction() {
    EXPRESSION=$(echo $@ | tr " " "\n")
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

call() {
    shift 1
    case ${PARAMETER} in
        addition | -a | +)          addition "$@" ;;
        division | -d | /)          division "$@" ;;
        expression | expr | -e)     expression "$@" ;;
        mod)                        mod "$@" ;;
        multiplication | -m | x)    multiplication "$@" ;;
        random | -r)                random "$@" ;;
        subtraction | -s | -)       subtraction "$@" ;;
        *)                          help ;;
    esac
}

main() {
    app "$@"
}

### ..:: Fluxo normal do programa ::..

main "$@"

exit 0

## ..:: Fim da execução ::..
