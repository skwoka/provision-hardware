#!/bin/sh
# Run this script to install tools needed to provision this machine.

# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Install Caskroom
brew tap caskroom/cask
