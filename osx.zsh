#!/usr/bin/env zsh

# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew doctor
brew update
brew install ansible
brew install git
brew install gnupg
brew install htop
brew install keybase
brew install node
brew install homebrew/dupes/less # Latest less supports emoji!
brew cask install ngrok
brew cask install vagrant
brew cask install caskroom/fonts/font-hack
brew cask install caskroom/fonts/font-roboto

# brew cask install 1password
# brew cask install android-file-transfer
# brew cask install arq
# brew cask install atom
# brew cask install caskroom/versions/google-chrome-canary
# brew cask install daisydisk
# brew cask install dropbox
# brew cask install firefox
# brew cask install flux
# brew cask install gitup
# brew cask install google-chrome
# brew cask install google-drive
# brew cask install imagealpha
# brew cask install imageoptim
# brew cask install istat-menus
# brew cask install iterm2
# brew cask install logitech-options
# brew cask install moom
# brew cask install radio-silence
# brew cask install sketch
# brew cask install steam
# brew cask install tunnelblick
# brew cask install virtualbox
# brew cask install vlc

defaults write -app 'sketch' ApplePersistence -bool no
