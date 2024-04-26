#!/bin/bash

printlnColor "$BLUE" "Launch bash configuration"

function setPS1() {
    printlnColor "$GREEN" "TODO"
}

function setAlias() {
    echo "" | cat > ~/.bash_aliases
    echo "alias disconnect-headset=\"echo \\\"disconnect 88:C9:E8:C9:C1:7A\\\" | bluetoothctl\"" | cat >> ~/.bash_aliases
    echo "alias connect-headset=\"echo \\\"connect 88:C9:E8:C9:C1:7A\\\" | bluetoothctl\"" | cat >> ~/.bash_aliases
    echo "alias cg-local=\"java -jar /usr/local/bin/cg-local\"" | cat >> ~/.bash_aliases
    printlnColor "$GREEN" "TODO"
}

printSilentExecute "Setting PS1 variables" setPS1
printSilentExecute "Setting alias variables" setAlias
