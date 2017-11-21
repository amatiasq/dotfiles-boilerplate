#!/usr/bin/env bash

function run() {
  bash "$HOME/.dotfiles/install/$1"
}

run brew.sh
run node.sh
run applications.sh

$HOME/.dotfiles/bin/sleepwatch-daemon

cat "$HOME/.dotfiles/install/messages.md"
