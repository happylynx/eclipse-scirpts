#!/bin/bash

if [[ ($# -lt 1) || ($# -gt 2) ]] ; then
    echo "Usage: init.sh <dir-to-init> [eclipse-dir]"
    exit 2
fi

if [[ ! -e $1 ]] ; then
    if mkdir -p "$1" ; then 
        DIR_TO_INIT=$1;
    else
        echo "Dir to init '$1' does not exist and can't be created."
        exit 2
    fi
elif [[ -d $1 && -w $1 && $(ls -A $1 | wc -l) -eq 0 ]] ; then
    DIR_TO_INIT=$1;
else
    echo "Dir to init '$1' is not accessable or not empty."
    exit 2
fi

ECLIPSE_DIR=${2:-'/opt/eclipse/eclipse'}
ECLIPSE_EXE=${ECLIPSE_DIR}/eclipse
CONFIG_DIR=${DIR_TO_INIT}/configuration/config

mkdir -p "${CONFIG_DIR}"
${ECLIPSE_EXE} -initialize -configuration "${CONFIG_DIR}"
