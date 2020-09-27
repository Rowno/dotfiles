#!/usr/bin/env zsh

npm config set sign-git-tag true
yarn config set version-sign-git-tag true

cat ./public/.dotfiles/nvm/default-packages | xargs npm install -g
