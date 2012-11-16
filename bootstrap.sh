#!/bin/bash
#
cd "$(dirname "$0")"

git pull
git submodule update --init --recursive --quiet

function doIt() {
    rsync --exclude ".DS_Store" -av ./public/ ~

    for file in $(ls -A ./private/); do
        if [[ $file != '.gitignore' ]]; then
            echo "Appending private config to $file"
            cat ./private/$file >> ~/$file
        fi
    done
    unset file
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi

unset doIt
source ~/.bash_profile
