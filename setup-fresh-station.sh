#!/bin/bash
[ $(id -u) != "0" ] && exec sudo "$0" "$@"

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
