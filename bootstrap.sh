#!/bin/sh
# Run this script to install tools needed to provision this machine.

basedir=`pwd`

# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Install Caskroom
brew tap caskroom/cask

# Install various apps through Cask
brew cask install google-chrome
brew cask install firefox
brew cask install virtualbox
brew cask install slack
brew cask install eclipse-java
brew cask install intellij-idea-ce
brew cask install atom
brew cask install iterm2
brew cask install java
brew cask install fluid
brew cask install 1password
brew cask install quicksilver

brew install maven
brew install ant

brew tap petere/postgresql
brew install petere/postgresql/postgresql-common
brew install postgresql@9.5
brew install pyenv

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
fi
source ~/.bash_profile

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
rbenv global 2.2.5

# Install bash profile include files
BASH_PROFILE_INCLUDES_HOME=~/.bash_profile_includes
if [ ! -d "$BASH_PROFILE_INCLUDES_HOME" ] ; then
  mkdir "$BASH_PROFILE_INCLUDES_HOME"
fi
cp -i -v -r "$basedir/bash_profile_includes/" "$BASH_PROFILE_INCLUDES_HOME"
