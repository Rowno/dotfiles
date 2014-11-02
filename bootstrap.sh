#!/usr/bin/env bash

git pull
git submodule update --init --recursive --quiet

function doIt() {
    rsync -avh --no-perms --exclude ".DS_Store" public/ ~
    echo

    for file in $(find private -type f -exec ls {} \; 2> /dev/null | sed 's/private\///'); do
        if [[ $file != '.gitignore' ]]; then
            echo "Adding private config to $file"
            cat ./private/$file >> ~/$file
        fi
    done
    unset file

    source ~/.bash_profile
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
