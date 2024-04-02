#!/bin/bash

printlnColor "$BLUE" "Launch bash configuration"

function setPS1() {
    printlnColor "$GREEN" "TODO"
}

function setAlias() {
    echo "alias connect_headset=\"echo \\\"connect 88:C9:E8:C9:C1:7A\\\" | bluetoothctl\"" | cat > ~/.bash_aliases
    printlnColor "$GREEN" "TODO"
}

printSilentExecute "Setting PS1 variables" setPS1
printSilentExecute "Setting alias variables" setAlias
