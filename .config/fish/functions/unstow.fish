function unstow --description 'unstow dotfiles to target directory'
    if not set -q DOTFILES_DIR
        echo 'set target dotfiles directory in DOTFILES_DIR envvar'
        return 1
    end

    if not set -q SECRETS_DIR
        echo 'set secrets directory in SECRETS_DIR envvar'
        return 1
    end

    pushd $DOTFILES_DIR
    git pull
    find . -name '.DS_Store' -depth -exec rm {} \;
    stow --target ~ (cat ./stow_dirs)
    popd

    pushd $SECRETS_DIR
    find . -name '.DS_Store' -depth -exec rm {} \;
    stow --target ~ bin ssh pass # gpg
    popd

    echo 'dotfiles updated!'
end
