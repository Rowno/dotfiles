#!/usr/bin/env zsh

if [[ $SHELL != '/bin/zsh' ]]; then
    echo "● Switching shell to zsh"
    chsh -s /bin/zsh
fi

echo "● Checking for updates"
git pull
git submodule update --init --recursive --quiet
echo

echo "● Copying dotfiles"
rsync -aih --no-perms --exclude ".DS_Store" public/ ~ | cut -c 11-
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

echo "● Rebuild zcompdump"
rm -f ~/.zcompdump
autoload -Uz compinit && compinit
echo

echo "● Done, don't forget to reload the terminal!"
