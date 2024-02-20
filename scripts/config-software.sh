#!/bin/bash

printlnColor "$BLUE" "Launch software configuration"

printSilentExecute "Update system" sudo apt-get update
printSilentExecute "Upgrade system" sudo apt-get upgrade

printSilentExecute "Install docker and docker-compose" sudo apt-get install docker docker-compose
printSilentExecute "Install git" sudo apt-get install git
