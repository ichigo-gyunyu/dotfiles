source $HOME/.config/zsh/aliases.zsh

dotfiles add \
    ~/.config/alacritty \
    ~/.config/bspwm \
    ~/.config/chromium-flags.conf \
    ~/.config/dunst \
    ~/.config/gtk-3.0 \
    ~/.config/mpv/*.conf \
    ~/.config/mpv/script* \
    ~/.config/neofetch \
    ~/.config/polybar \
    ~/.config/sx \
    ~/.config/sxhkd \
    ~/.config/tmux \
    ~/.config/transmission-daemon/*.json \
    ~/.config/zsh \
    ~/.gitconfig \
    ~/.zshenv \
    ~/.zshrc \
    ~/scripts

dotfiles status
dotfiles commit -m "push script"
dotfiles push
