#!/bin/bash

export RESET_COLOR="\e[0m"
export RED="\e[31m"
export GREEN="\e[32m"
export YELLOW="\e[33m"
export BLUE="\e[34m"

function print() {
    echo -n "$@"
}

function println() {
    print "$@"
    echo
}

function printlnColor() {
    printColor "$@"
    echo
}
function printColor() {
    print -e "$1""$2""$RESET_COLOR"
}

function silentExecute() {
    "$@" &> /dev/null
}

function printSilentExecute() {
    printColor "$GREEN" "$1... "
    silentExecute "${@:2}"
    printlnColor "$GREEN" "Done !"
}

export -f print
export -f printColor
export -f println
export -f printlnColor
export -f silentExecute
export -f printSilentExecute
