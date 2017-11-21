#!/usr/bin/env bash


######################
## GIT INSTALLATION ##
######################

# This will request XCode command line tools installation
git --version > /dev/null

echo 'Press [Enter] when git is fully installed.'
read < /dev/tty

RSA="$HOME/.ssh/id_rsa.pub"

if [ ! -f $RSA ]
then
  echo 'Generating RSA...'
  ssh-keygen -t rsa -C > /dev/null
fi

cat $RSA | pbcopy
cat $RSA

echo '\nCopied to clipboard.'
echo 'Add key to Github, press [Enter] when done.'
open 'https://github.com/settings/ssh'
read < /dev/tty


####################
## DOTFILES SETUP ##
####################

DOT="git --git-dir=$HOME/.dot/ --work-tree=$HOME"

git clone --bare --depth=1 "git@github.com:$USER/dotfiles" $HOME/.dot

$DOT checkout

if [ $? -ne 0 ]; then
  mkdir -p .config-backup
  $DOT checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/.config-backup/{}
  $DOT checkout
fi

if [ -f "$HOME/README.md" ]; then
  rm $HOME/README.md
fi

$DOT config --local status.showUntrackedFiles no
$DOT remote add boilerplate git@github.com:amatiasq/dotfiles-boilerplate

mkdir -p ~/.dotfiles/logs

$DOT submodule update --init --recursive
$DOT fetch --unshallow > ~/.dotfiles/logs/fetch.txt 2>&1 &

# Install dotsync command
# mkdir -p $HOME/bin
# ln -s "$HOME/.dotfiles/bin/dotsync" "$HOME/bin/dotsync"

# Set post commit hook to push on commit
HOOK="$HOME/.dot/hooks/post-commit"
echo '#!/bin/sh' > $HOOK
echo 'git push origin master' >> $HOOK
chmod +x $HOOK

bash "$HOME/.dotfiles/install/start.sh"
