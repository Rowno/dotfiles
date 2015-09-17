#!/usr/bin/env zsh

# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew doctor
brew update
brew install ansible
brew install git
brew install htop-osx
brew install node
brew install openssh
brew install zsh-completions

defaults write -app 'sketch' ApplePersistence -bool no
