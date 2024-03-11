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
        set node_version (node -v)
        set nvmrc_node_version (nvm list | grep (cat .nvmrc))

        if set -q $nvmrc_node_version
            nvm install
        else if string match -q -- "*$node_version" $nvmrc_node_version
            # already current node version
        else
            nvm use
        end
    end
end

# starship setup
starship init fish | source
