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

