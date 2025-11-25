if status is-interactive
    set -g fish_greeting
    starship init fish | source
    zoxide init fish | source
    fzf --fish | source

    # VS Code Shell Integration
    if set -q MSYSTEM; and type -q cygpath; and test "$TERM_PROGRAM" = "vscode"
        source (cygpath -u (code --locate-shell-integration-path fish))
    end

    if set -q MSYSTEM; and type -q cygpath
        function __fish_update_cwd_osc --on-variable PWD --description 'Notify terminals when $PWD changes'
            set -l host $hostname
            if [ "$TERM" = dumb ]
                return
            end
            set -l win_path (cygpath -m -a "$PWD")
            printf \e\]7\;file://%s%s\a $host (string escape --style=url -- $win_path)
        end
    end
end
