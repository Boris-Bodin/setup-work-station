#!/bin/bash

printlnColor "$BLUE" "Launch Docker configuration"

printSilentExecute "Install Docker and Docker compose" sudo apt-get install docker docker-compose
