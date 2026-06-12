# from oh-my-fish
# https://github.com/oh-my-fish/plugin-foreign-env

function fenv -d "Run bash scripts and import variables modified by them"
    # define fenv.main if not already defined
    if not functions -q fenv.main
        function fenv.main --no-scope-shadowing
            bash -c "$argv && env -0 >&31" 31>| while read -l -z env_var
                set -l kv (string split -m 1 = $env_var); or continue
                # Skip read-only or special variables
                contains $kv[1] _ SHLVL PWD; and continue
                string match -rq '^BASH_.*%%$' $kv[1]; and continue
                # Import into Fish if missing, different, or not exported
                if not set -q $kv[1]; or test "$$kv[1]" != $kv[2]; or not set -qx $kv[1]
                    set -gx $kv
                end
            end
            return $pipestatus[1]
        end
    end

    # wrapper logic
    if count $argv >/dev/null
        if string trim -- $argv | string length -q
            fenv.main $argv
            return $status
        end
        return 0
    else
        echo (set_color red)'error:' (set_color normal)'parameter missing'
        echo (set_color cyan)'usage:' (set_color normal)'fenv <bash command>'
        return 23  # EINVAL
    end
end
