#!/bin/bash

[ $(id -u) != "0" ] && exec sudo "$0" "$@"

USER_HOME=$PWD
USER_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
export USER_HOME

echo "Load utils files !"
source ./scripts/utils.sh

function loadConfig() {
    ./scripts/config-bash.sh
    ./scripts/config-fs.sh
    ./scripts/config-software.sh
}

printlnColor "$YELLOW" "Load configuration files."
loadConfig
printlnColor "$YELLOW" "Finish !"
