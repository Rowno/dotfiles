#!/usr/bin/env zsh

# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew doctor
brew update
brew install bat
brew install git
brew install micro
brew install node
brew install yarn
brew cask install aerial
brew cask install keybase
brew cask install ngrok
brew cask install caskroom/fonts/font-hack
brew cask install caskroom/fonts/font-roboto

# brew cask install 1password
# brew cask install arq
# brew cask install daisydisk
# brew cask install dropbox
# brew cask install firefox
# brew cask install flux
# brew cask install google-chrome
# brew cask install imageoptim
# brew cask install insomnia
# brew cask install istat-menus
# brew cask install kap
# brew cask install logitech-options
# brew cask install moom
# brew cask install postico
# brew cask install sketch
# brew cask install steam
# brew cask install visual-studio-code

defaults write -app 'sketch' ApplePersistence -bool no
