#/bin/bash
# Profile file. Runs on login. Environmental variables are set here.

# set PATH so it includes user's private bin if it exists
# add script dir and any subdirectories
[ -d "$HOME/.local/bin" ] && export PATH=$PATH$( find $HOME/.local/bin -type d -printf ":%p" )

# XDG paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export XDG_TEMPLATES_DIR="$HOME/templates"
export XDG_DOCUMENTS_DIR="$HOME/projects"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_PICTURES_DIR="$HOME/pictures"
export XDG_VIDEOS_DIR="$HOME/videos"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# pyenv setup
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# add poetry to the path
export POETRY_HOME="$XDG_DATA_HOME/poetry"
[ -d "$POETRY_HOME/bin" ] && export PATH="$POETRY_HOME/bin:$PATH"

# Programs
export EDITOR="vim"
export VISUAL="vim"
export BROWSER="qutebrowser"
export PAGER="less"
export OPENER="xdg-open"
export TERM="xterm-termite"
export TERMINAL="termite"

# Some path
export STOWDIR="$HOME/data/stow"
export WALLDIR="$XDG_PICTURES_DIR/walls"
export BOOKMARKS="$XDG_CONFIG_HOME/qutebrowser/bookmarks/urls"
export PASSWORD_STORE_DIR="$XDG_CONFIG_HOME/pass-store"

# Settings
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"

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
export FLAVOURS_THEME_MODE="dark"

# zsh config folder
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Rust config
export CARGO_HOME="$XDG_CONFIG_HOME/cargo/"

# Go env
export GOPATH="$XDG_DATA_HOME/go"

# nvidia folder location
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nv/"

# fasd .fasd location
export _FASD_DATA="$XDG_CONFIG_HOME/fasd"

# less histfile
export LESSHISTFILE="-"

# gnupg location
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"

# sqlite history
export SQLITE_HISTORY="$XDG_CACHE_HOME/sqlite/hist"

# ipython config files
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"

# jupyter config dir
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"

# pylint
export PYLINTHOME="$XDG_CACHE_HOME/pylint"

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
