if status is-interactive
    set -g fish_greeting
    starship init fish | source
    zoxide init fish | source
    fzf --fish | source
end
