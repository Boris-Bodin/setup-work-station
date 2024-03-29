#!/bin/bash

printlnColor "$BLUE" "Launch file system configuration"

printColor "$GREEN" "Check if dev directory exist... "
if [ ! -d "$USER_HOME"/dev ]; then
    printlnColor "$GREEN" "Create dev directory"
    mkdir "$USER_HOME"/dev
    chown "$SUDO_USER:$SUDO_USER" "$USER_HOME"/dev
else
    printlnColor "$GREEN" "OK !"
fi

printColor "$GREEN" "Check if project directory exist... "
if [ ! -d "$USER_HOME"/dev/projects ]; then
    printlnColor "$GREEN" "Create project directory"
    mkdir "$USER_HOME"/dev/projects
    chown "$SUDO_USER:$SUDO_USER" "$USER_HOME"/dev/projects
else
    printlnColor "$GREEN" "OK !"
fi

printColor "$GREEN" "Check if ssh key exist... "
if [ ! -d "$USER_HOME"/.ssh ]; then
    printlnColor "$GREEN" "Create ssh key"
    mkdir "$USER_HOME"/.ssh
    chown "$SUDO_USER:$SUDO_USER" "$USER_HOME"/.ssh
fi
if [ ! -f "$USER_HOME"/.ssh/id_rsa ]; then
    printlnColor "$GREEN" "Create ssh key"
    ssh-keygen -q -f "$USER_HOME"/.ssh/id_rsa -P ""
    chown "$SUDO_USER:$SUDO_USER" "$USER_HOME"/.ssh/id_rsa*
else
    printlnColor "$GREEN" "OK !"
fi

printSilentExecute "Update guake settings" guake --restore-preferences ./resources/guake_prefs

printSilentExecute "Set favorite apps on gnome" gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'google-chrome.desktop', 'jetbrains-toolbox.desktop']"

function updateSwapFileSize() {
    if [ -f /swapfile ]; then
        swapoff /swapfile
        rm /swapfile
        fallocate -l 8G /swapfile
        chmod 600 /swapfile
        mkswap /swapfile
        swapon /swapfile
    fi
}
printSilentExecute "Set size of swap file to 8Go, if swaf file exist" updateSwapFileSize
