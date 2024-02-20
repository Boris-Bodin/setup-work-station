#!/bin/bash

printlnColor "$BLUE" "Launch Apt configuration"

printSilentExecute "Update system" sudo apt-get update
printSilentExecute "Upgrade system" sudo apt-get upgrade
