# Setup Work Station

Various items for set up a new work station.

Supported OS :

- Ubuntu 20.04.3 LTS

Features :

- Install divers software
    - git
    - curl
    - docker
    - docker-compose
    - google-chrome
    - jetbrains-toolbox
    - guake
- Config file system
    - Create repertories dev/project
    - Create ssh key
    - Updata guake settings
    - Set favorite apps on gnome
    - Update swap file size to 8Go
- Create dev/project repertories
- Configure Bash
    - Modify PS1
    - Add Alias

## Installation

Just clone this repo :

```
cd ~
sudo apt-get install git
git clone https://gitlab.com/boris.bodin/setup-work-station.git
```

or download the source and extract it to ~.

## Usage

For set up a new work station, enter the followed command :

```
cd ~/setup-work-station
./setup-fresh-station.sh
```

## Tips

For export the guake_prefs file :

```
 guake --save-preferences guake_prefs
```
