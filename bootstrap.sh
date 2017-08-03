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
MACOS_DEFAULTS_HOME="$ADMIN_HOME/macOSX-defaults"
if [ ! -d "$MACOS_DEFAULTS_HOME" ] ; then
  git clone https://github.com/kevinSuttle/macOS-Defaults.git "$MACOS_DEFAULTS_HOME"
else
  cd "$MACOS_DEFAULTS_HOME" && git pull --rebase
fi

# Install rbenv
if [ ! -d ".rbenv" ] ; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  cd ~/.rbenv && src/configure && make -C src
fi

which rbenv
if [ $? -ne 0 ] ; then
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
else
  source ~/.bash_profile
fi

~/.rbenv/bin/rbenv init

# Install ruby build
RUBY_BUILD_HOME=~/.rbenv/plugins/ruby-build
if [ ! -d "$RUBY_BUILD_HOME" ] ; then
  git clone https://github.com/rbenv/ruby-build.git "$RUBY_BUILD_HOME"
fi

# Install common ruby versions
rbenv install 2.4.1
rbenv install 2.3.3
rbenv install 2.2.5
