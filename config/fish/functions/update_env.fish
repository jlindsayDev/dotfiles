function update_env --description 'Update all the usual things'
    brew update
    brew upgrade
    brew upgrade --cask --greedy
    brew cleanup

    bun upgrade

    # tldr --update
    pnpm -g update
    # sync-dotfiles
end
