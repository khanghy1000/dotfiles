source ${ZDOTDIR:-~}/.antidote/antidote.zsh
# Set compstyle
zstyle ':plugin:ez-compinit' 'compstyle' 'ohmy'
# Load plugins
antidote load

# Setup custom configs
ZSH_CONFIG=$HOME/.config/zsh-custom
source $ZSH_CONFIG/env
source $ZSH_CONFIG/alias

source $HOME/.local/scripts/wezterm.sh

# pnpm
export PNPM_HOME="/home/hy/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
