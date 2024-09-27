set -gx EDITOR nvim
set -gx GIT_EDITOR nvim
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx YAZI_CONFIG_HOME $XDG_CONFIG_HOME/yazi
set -gx BAT_THEME "Visual Studio Dark+"
set -gx _ZO_RESOLVE_SYMLINKS ""

set -l fzf_color_scheme " \
  --color=fg:-1,fg+:#cec2aa,bg:-1,bg+:-1,gutter:-1 \
  --color=hl:#8893c8,hl+:#8aadf4,info:#afaf87,marker:#a6da95 \
  --color=prompt:#8aadf4,spinner:#ee99a0,pointer:#c6a0f6,header:#87afaf \
  --color=border:#262626,label:#aeaeae,query:#d9d9d9"

set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS $fzf_color_scheme"

fish_add_path -P $HOME/.local/scripts
fish_add_path -P $HOME/.local/bin
fish_add_path /opt/nvim-linux-x86_64/bin
fish_add_path $HOME/.local/share/JetBrains/Toolbox/scripts
fish_add_path $HOME/.dotnet/tools
fish_add_path $HOME/.cargo/bin

if type -q go
    fish_add_path -P (go env GOPATH)/bin
end

# pnpm
set -gx PNPM_HOME "/home/hy/.local/share/pnpm"
fish_add_path $PNPM_HOME
