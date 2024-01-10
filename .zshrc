export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

PATH=$PATH:~/.local/bin

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias vi="nvim"

export PATH=/opt/homebrew/bin:$PATH

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# remove user name
prompt_context() { 
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then 
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER" 
  fi 
}

# place this after nvm initialization!
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
