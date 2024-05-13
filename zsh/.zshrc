# alias
alias vi="nvim"
alias ls="eza --icons=always"

# rustup
export PATH="$HOME/.cargo/bin:$PATH"

# starship
eval "$(starship init zsh)"

# brew
eval $(/opt/homebrew/bin/brew shellenv)

# fnm
eval "$(fnm env --use-on-cd)"

# zoxide
eval "$(zoxide init zsh)"
alias cd="z"

# thefuck
eval $(thefuck --alias)

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
