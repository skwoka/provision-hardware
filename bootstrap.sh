#!/bin/sh
# Run this script to install tools needed to provision this machine.

# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Install Caskroom
brew tap caskroom/cask

ADMIN_HOME=~/administration
mkdir "$ADMIN_HOME"

# Install macOSX-defaults
git clone https://github.com/kevinSuttle/macOS-Defaults.git "$ADMIN_HOME/macOSX-defaults"

# Install rbenv
if [ ! -d ".rbenv" ] ; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
fi

cd ~/.rbenv && src/configure && make -C src

which rbenv
if [ $? != 0 ] ; then
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
fi

~/.rbenv/bin/rbenv init

# Install ruby build
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
