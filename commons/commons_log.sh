#!/bin/bash

################################################################################

## Nome: Commons log
## Descricao: Commons com funcoes de log em comum.

################################################################################

## Dados do arquivo de log
NAME_LOG="tibim"
HOME_LOG="../logs"

MAX_SIZE_LOG="10"
FILE_LOG="${HOME_LOG}/${NAME_LOG}.log"
FILE_LOG_OLD="${FILE_LOG}.tgz"

## Auxiliares
DTH_EXECUTION=$(date '+%d-%m-%Y - %H:%M:%S')

################################################################################

create_folder_if_not_exists() {
    if [ ! -d "$HOME_LOG" ]
    then
        mkdir $HOME_LOG
    fi
}

check_logs() {
    if [ "$(du -sm $FILE_LOG | cut -f 1)" -gt "$MAX_SIZE_LOG" ]
    then
        rm -f "$FILE_LOG_OLD" &> /dev/null
        tar -zcvf "$FILE_LOG_OLD" "$FILE_LOG"
        echo "Log rotated at ${DTH_EXECUTION}" > "$FILE_LOG"
    fi
    return 0
}

write_log() {
    create_folder_if_not_exists
    check_logs
    echo "${DTH_EXECUTION} - $@" | tee -a "$FILE_LOG"
}

write_log_debug() {
    write_log "[DEBUG] - $@"
}

write_log_info() {
    write_log "[INFO] - $@"
}

write_log_warn() {
    write_log "[WARN] - $@"
}

write_log_error() {
    write_log "[ERROR] - $@"
}

write_log_fatal() {
    write_log "[FATAL] - $@"
}