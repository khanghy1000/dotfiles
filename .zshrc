source ${ZDOTDIR:-~}/.antidote/antidote.zsh
# Set compstyle
zstyle ':plugin:ez-compinit' 'compstyle' 'ohmy'
# Load plugins
antidote load

# Setup custom configs
ZSH_CONFIG=$HOME/.config/zsh-custom
source $ZSH_CONFIG/func
source $ZSH_CONFIG/env
source $ZSH_CONFIG/alias
source $ZSH_CONFIG/keymap

if [ -f "$HOME/.secrets" ]; then
    source "$HOME/.secrets"
fi

source $HOME/.local/scripts/wezterm.sh

