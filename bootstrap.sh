#!/usr/bin/env bash

#chsh -s /bin/zsh
echo "● Checking for updates"
git pull
git submodule update --init --recursive --quiet
echo

echo "● Copying dotfiles"
rsync -aih --no-perms --exclude ".DS_Store" public/ ~
echo

echo "● Adding private config to dotfiles"
for file in $(find private -type f -exec ls {} \; 2> /dev/null | sed 's/private\///'); do
    if [[ $file != '.gitignore' ]] && [[ $file != '.DS_Store' ]]; then
        echo $file
        cat ./private/$file >> ~/$file
    fi
done
unset file
echo

echo "● Done"
