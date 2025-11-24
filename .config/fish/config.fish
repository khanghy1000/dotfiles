if status is-interactive
    set -g fish_greeting
    starship init fish | source
    zoxide init fish | source
    fzf --fish | source

    # VS Code Shell Integration
    if type -q cygpath; and test "$TERM_PROGRAM" = "vscode"
        source (cygpath -u (code --locate-shell-integration-path fish))
    end

end
