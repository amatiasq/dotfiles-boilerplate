#!/usr/bin/env bash

brew install nvm

mkdir ~/.nvm
export NVM_DIR="$HOME/.nvm"
source "/usr/local/opt/nvm/nvm.sh"

nvm install stable
nvm install lts/*
nvm use stable

npm install -g eslint
