#!/bin/bash

printlnColor "$BLUE" "Launch software configuration"

printSilentExecute "Update system" apt-get update
printSilentExecute "Upgrade system" apt-get upgrade -y

printSilentExecute "Install curl" apt-get install -y curl
printSilentExecute "Install git" apt-get install -y git
printSilentExecute "Install docker and docker-compose" apt-get install -y docker docker-compose

function installJetBrainsToolbox() {
    DIR="/opt/jetbrains-toolbox"
    if [ ! -d ${DIR} ]; then

        USER_AGENT=('User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36')
        URL=$(curl 'https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release' -H 'Origin: https://www.jetbrains.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.8' -H "${USER_AGENT[@]}" -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://www.jetbrains.com/toolbox/download/' -H 'Connection: keep-alive' -H 'DNT: 1' --compressed | grep -Po '"linux":.*?[^\\]",' | awk -F ':' '{print $3,":"$4}'| sed 's/[", ]//g')
        FILE=$(basename "${URL}")
        DEST=$USER_HOME/$FILE

        if [ ! -f "${DEST}" ]; then
            wget -cO  "${DEST}" "${URL}" --read-timeout=5 --tries=0
        fi

        mkdir ${DIR}
        tar -xzf "${DEST}" -C ${DIR} --strip-components=1

        chmod -R +rwx ${DIR}
        if [ ! -f ${DIR}/jetbrains-toolbox.sh ]; then
            touch ${DIR}/jetbrains-toolbox.sh
            echo "#!/bin/bash" >> $DIR/jetbrains-toolbox.sh
            echo "$DIR/jetbrains-toolbox" >> $DIR/jetbrains-toolbox.sh
        fi

        if [ ! -f /usr/local/bin/jetbrains-toolbox ]; then
            ln -s ${DIR}/jetbrains-toolbox.sh /usr/local/bin/jetbrains-toolbox
        fi
        chmod -R +rwx /usr/local/bin/jetbrains-toolbox
        rm "${DEST}"
    fi
}
printSilentExecute "Install jetbrains-toolbox" installJetBrainsToolbox
jetbrains-toolbox

function installChrome() {
    if [ ! command -v google-chrome ]; then
        URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
        FILE=$(basename "${URL}")
        DEST=$USER_HOME/$FILE

        if [ ! -f "${DEST}" ]; then
            wget -cO  "${DEST}" "${URL}" --read-timeout=5 --tries=0
        fi
        apt-get install -y "${DEST}"
        rm "${DEST}"
    fi
}
printSilentExecute "Install chrome" installChrome
google-chrome

printSilentExecute "Install guake" apt-get install -y guake