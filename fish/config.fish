# alias
function vi
    nvim $argv
end

function ls
    eza --icons=always $argv
end

alias sd "cd ~ && cd (find * -type d | fzf)"

# nvm setup
function __check_nvm --on-variable PWD --description 'Do nvm stuff'
    if test -f .nvmrc
        set node_version_target (cat .nvmrc)
        set nvmrc_node_version (nvm list | grep $node_version_target)

        if not test -n "$nvmrc_node_version"
            # install
            nvm install $node_version_target
        else
            nvm use $node_version_target
        end
    end
end
__check_nvm

# starship setup
starship init fish | source

# the fuck setup
thefuck --alias | source

# zoxide
zoxide init fish | source
alias cd=z
