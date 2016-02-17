#!/usr/bin/env zsh

# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew doctor
brew update
brew install ansible
brew install git
brew install git-lfs
brew install htop-osx
brew install node
brew install zsh-completions
brew cask install vagrant

defaults write -app 'sketch' ApplePersistence -bool no
