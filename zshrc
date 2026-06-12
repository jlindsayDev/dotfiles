
# Created by `pipx` on 2025-01-02 15:19:31
export PATH="$PATH:/Users/josh/.local/bin"

# Created by `bun install --global`
export PATH="$PATH:/Users/josh/.bun/bin"

# Add SSH key to Apple Keychain
eval `ssh-agent -s`
ssh-add -q --apple-use-keychain ~/.ssh/id_ed25519

# Pibox
alias pibox-syncthing='ssh -L 9090:localhost:8384 pibox.local'
alias rsyncmv='rsync -avzPh --progress --stats --remove-source-files'
alias rmdirr='rmdir -p **/*/'

#
# https://alexwlchan.net/2016/a-shell-alias-for-tallying/
# https://alexwlchan.net/2025/github-actions-audit/
# https://news.ycombinator.com/item?id=43473623
alias tally='sort | uniq -c | sort'

# Better shell history search
# https://news.ycombinator.com/item?id=43476793

source ~/.orbstack/shell/init.zsh

# curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
source ~/.config/iterm2/iterm2_shell_integration.zsh

# bun completions
[ -s "/Users/josh/.bun/_bun" ] && source "/Users/josh/.bun/_bun"


# eval "$(zellij setup --generate-auto-start zsh)"
# zellij options --simplified-ui true
