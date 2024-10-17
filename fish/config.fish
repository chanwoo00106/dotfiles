# alias
function vi
    nvim $argv
end

function ls
    eza --icons=always $argv
end

alias sd "cd ~ && cd (find * -type d | fzf)"

# starship setup
starship init fish | source

# the fuck setup
thefuck --alias | source

# zoxide
zoxide init fish | source
alias cd=z

