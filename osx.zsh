#!/usr/bin/env zsh

# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew doctor
brew update
brew install ansible
brew install git
brew install git-lfs
brew install htop
brew install node
brew cask install vagrant
brew cask install caskroom/fonts/font-hack
brew cask install caskroom/fonts/font-roboto

brew cask install 1password
brew cask install android-file-transfer
brew cask install atom
brew cask install caskroom/versions/atom-beta
brew cask install caskroom/versions/google-chrome-canary
brew cask install caskroom/versions/iterm2-beta
brew cask install crashplan
brew cask install discord
brew cask install divvy
brew cask install dropbox
brew cask install firefox
brew cask install google-chrome
brew cask install imagealpha
brew cask install imageoptim
brew cask install istat-menus
brew cask install licecap
brew cask install logitech-options
brew cask install sketch
brew cask install steam
brew cask install tunnelblick
brew cask install virtualbox

defaults write -app 'sketch' ApplePersistence -bool no
