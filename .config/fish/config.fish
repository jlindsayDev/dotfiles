fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path ~/.local/bin
fish_add_path ~/.bun/bin

# Must run this once to add the key to the keychain
# ssh-add --apple-use-keychain ~/.ssh/id_ed25519

ssh-add --apple-load-keychain -q

########## GLOBAL VARIABLES ##########

# https://fishshell.com/docs/current/language.html#variables
# alias fish_temp_var 'set -gx' # session variable (--global --export)
# alias fish_set_var 'set -Ux' # path variable (--universal --export)
# alias fish_unset_var 'set -e' # unset variable (--erase)

set -gx BREW_HOME (brew --prefix)
set -gx PNPM_HOME $HOME/Library/pnpm

set -gx CONFIG_HOME $HOME/.config
set -gx XDG_CONFIG_HOME $HOME/.config

set configs $CONFIG_HOME/iterm2/iterm2_shell_integration.fish
set -a configs $CONFIG_HOME/orbstack/shell/init2.fish
set -a configs $CONFIG_HOME/iterm/iterm2_shell_integration.fish

for file in $configs
    if test -e $file
        source $file
    end
end

set completions $BREW_HOME/share/fish/completions
set -a completions $BREW_HOME/share/fish/vendor_completions.d # (--append)

for file in $completions
    if test -d $file
        set -p fish_complete_path $file
    end
end

if status is-interactive
    # eval (zellij setup --generate-auto-start fish | string collect)
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

function fish_greeting
end
