alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'

alias v "nvim"
alias gg "lazygit"
alias yadmauto "yadm add -u; and yadm commit -m 'Sync dotfiles'; and yadm push"
# Note: Fish handles globbing differently. The quotes prevent immediate expansion.
alias tree "tree -Ca --dirsfirst -I 'node_modules|dist|build|out|target|.venv|bin|obj|.idea|.git/'"
alias ts "tmux-sessionizer"
alias yadmgg 'lazygit -ucf $HOME/.config/lazygit/config.yml -w ~ -g ~/.local/share/yadm/repo.git'

alias rshada "rm -rf $HOME/AppData/Local/nvim-data/shada $HOME/.local/share/nvim/shada"

# Eza (ls replacement)
alias ls 'eza -al --color=always --group-directories-first --icons'
alias la 'eza -a --color=always --group-directories-first --icons'
alias ll 'eza -l --color=always --group-directories-first --icons'
alias lt 'eza -aT -I "node_modules|dist|build|out|target|.venv|bin|obj|.idea|.git" --color=always --group-directories-first --icons | less -FRi'
alias l. "eza -a | grep -e '^\.'"

if type -q batcat
    alias bat "batcat"
end

