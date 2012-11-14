#!/bin/bash
#
cd "$(dirname "$0")"
#git pull

function doIt() {
	rsync --exclude-from "exclude" -av ./public/ ~

    for file in $(ls -A ./private/); do
        cat ./private/$file >> ~/$file
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
