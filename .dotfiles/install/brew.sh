#!/usr/bin/env bash

# Copy dotfiles

# Instal Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Homebrew cask
brew tap caskroom/cask

# Update homebrew
brew update

# Install homebrew pacakges
brew insatll python3
brew install wget
