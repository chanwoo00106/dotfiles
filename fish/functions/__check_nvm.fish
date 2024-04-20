function __check_nvm --on-variable PWD --description 'Do nvm stuff'
    if not test -f .nvmrc
        return
    end

    set node_version_target (cat .nvmrc)
    set nvmrc_node_version (nvm list | grep $node_version_target)

    if not test -n "$nvmrc_node_version"
        nvm install $node_version_target
    else
        nvm use $node_version_target
    end
end
