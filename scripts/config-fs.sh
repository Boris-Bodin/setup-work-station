#!/bin/bash

printlnColor "$BLUE" "Launch file system configuration"

printColor "$GREEN" "Check if dev directory exist... "
if [ ! -d ~/dev ]; then
    printlnColor "$GREEN" "Create dev directory"
    mkdir ~/dev
else
    printlnColor "$GREEN" "OK !"
fi

printColor "$GREEN" "Check if project directory exist... "
if [ ! -d ~/dev/projects ]; then
    printlnColor "$GREEN" "Create project directory"
    mkdir ~/dev/projects
else
    printlnColor "$GREEN" "OK !"
fi
