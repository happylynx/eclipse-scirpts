#!/bin/bash

if [[ ($# -lt 1) || ($# -gt 2) ]] ; then
    echo "Usage: run.sh <dir-conf-and-workspace> [eclipse-dir]"
    exit 2
fi

if [[ ! -d $1 || ! -d $1/configuration/config ]] ; then
    echo "Configuration dir '$1' does not exist."
    exit 2
fi

DIR_CONF_N_WORKSPACE="$1"
ECLIPSE_DIR=${2:-'/opt/eclipse/eclipse'}
ECLIPSE_EXE=${ECLIPSE_DIR}/eclipse
CONFIG_DIR=${DIR_CONF_N_WORKSPACE}/configuration/config
WORKSPACE_DIR=${DIR_CONF_N_WORKSPACE}/workspace

${ECLIPSE_EXE} -data "${WORKSPACE_DIR}" -configuration "${CONFIG_DIR}"
