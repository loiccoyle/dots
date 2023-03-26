#!/bin/sh
# Profile file. Runs on login. Environmental variables are set here.

for file in ~/.config/profile.d/*.sh; do
    [ -r "$file" ] && [ -f "$file" ] && . "$file"
done

# set PATH so it includes user's private bin if it exists
# add script dir and any subdirectories
[ -d "$HOME/.local/bin" ] && export PATH="$PATH:$(find "$HOME/.local/bin" -type d -printf ":%p")"
# Gem executables
if type ruby >/dev/null; then
    export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
    export PATH="$PATH:$GEM_HOME/bin"
fi

# XDG paths
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export XDG_TEMPLATES_DIR="$HOME/templates"
export XDG_DOCUMENTS_DIR="$HOME/documents"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_PICTURES_DIR="$HOME/pictures"
export XDG_VIDEOS_DIR="$HOME/videos"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_HOME="$HOME/.local/share"

# Programs
export EDITOR="vim"
export VISUAL="vim"
export BROWSER="firefox"
_PAGER="less"
type "nvimpager" >/dev/null && _PAGER="nvimpager"
export PAGER="$_PAGER"
export OPENER="xdg-open"
export TERM="alacritty"
export TERMINAL="alacritty"

# Some paths
export WALLPAPER_DIR="$XDG_PICTURES_DIR/walls"

# Settings
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export _JAVA_AWT_WM_NONREPARENTING=1
# Wayland
if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    export MOZ_ENABLE_WAYLAND=1
    export QT_QPA_PLATFORM="wayland"
    export XCURSOR_SIZE=24
    # https://wiki.hyprland.org/Configuring/Environment-variables/
    export QT_QPA_PLATFORM="wayland;xcb"
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export SDL_VIDEODRIVER=wayland
    export GDK_BACKEND="wayland,x11"
    export CLUTTER_BACKEND=wayland
fi

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

# Themes
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK_THEME="Adwaita:dark"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export FLAVOURS_THEME_MODE="dark"

# Desktop settings
export PRIMARY_MONITOR="DP-0"
export BAR_HEIGHT=16

# Cleanup home folder, see: https://wiki.archlinux.org/title/XDG_Base_Directory#Support
# Pass storage location
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
# zsh config folder
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# Rust config
export CARGO_HOME="$XDG_DATA_HOME/cargo"
# rustup home
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
# fasd location
export _FASD_DATA="$XDG_STATE_HOME/fasd"
# less histfile
export LESSHISTFILE="-"
# gnupg location
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
# ipython config files
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
# jupyter config dir
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
# Go env
export GOPATH="$XDG_DATA_HOME/go"
# pylint
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
# nvidia folder location
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nv"
# sqlite history
export SQLITE_HISTORY="$XDG_STATE_HOME/sqlite_history"
# node history
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node_history"
# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
# dart pub cache
export PUB_CACHE="$XDG_CACHE_HOME/pub-cache"
# gradle home
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
# android emulators
export ANDROID_SDK_HOME="$XDG_DATA_HOME/android"
# zoom folder
export SSB_HOME="$XDG_DATA_HOME/zoom"

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
