typeset -U PATH path
# paths
export PATH=$PATH:~/scripts/dmenu-scripts
export PATH=$PATH:~/scripts/bspwm
export PATH=$PATH:~/scripts/run
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/.local/bin

# XDG Paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# Defaults
export TERMINAL="alacritty"
export EDITOR="nvim"
export BROWSER="chromium"
export VIDEO="mpv"
export WM="bspwm"

# pip
PIP_TARGET="/usr/lib/python3.10/site-packages"
