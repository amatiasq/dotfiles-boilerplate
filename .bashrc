cb() {
  # get current branch
  git branch | grep '*' | awk '{print $2}'
}

if [ -d "/usr/local/opt/nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  source "/usr/local/opt/nvm/nvm.sh"
fi

export PATH="$HOME/bin:/usr/local/bin:$PATH"
export DOT=$($HOME/.dotfiles/bin/command)

alias dot="$DOT"
