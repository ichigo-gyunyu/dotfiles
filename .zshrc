# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History
HISTFILE=~/.cache/zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Options
zle_highlight=('paste:none')

# Zoxide
eval "$(zoxide init zsh)"

# Prompt
autoload -U colors && colors    # Load colors
source $HOME/.config/zsh/prompt.zsh

# Vim mode
bindkey -v
export KEYTIMEOUT=1

# Fix backspace bug when switching vi modes
bindkey "^?" backward-delete-char

# Compinit stuff
zstyle :compinstall filename '/home/ichigo/.zshrc'
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Aliases
source $HOME/.config/zsh/aliases.zsh

# Plugins I guess
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Cursor for vim mode
cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}
cursor_mode

# Yank to the system clipboard in vi mode
function vi-yank-xclip {
  zle vi-yank
  echo "$CUTBUFFER" | xclip -i -selection "clipboard"
}
zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

ulimit -s unlimited
