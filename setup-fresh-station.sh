#!/bin/bash

echo "Load utils files !"
source ./scripts/utils.sh

function loadConfig() {
    ./scripts/config-apt.sh
    ./scripts/config-fs.sh
    ./scripts/config-docker.sh
    ./scripts/config-alias.sh
    ./scripts/config-ps1.sh
}

printlnColor "$YELLOW" "Load configuration files."
loadConfig
printlnColor "$YELLOW" "Finish !"
