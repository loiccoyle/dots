#          _
#  _______| |__
# |_  / __| '_ \
#  / /\__ \ | | |
# /___|___/_| |_|
#        _ _
#   __ _| (_) __ _ ___  ___  ___
#  / _` | | |/ _` / __|/ _ \/ __|
# | (_| | | | (_| \__ \  __/\__ \
#  \__,_|_|_|\__,_|___/\___||___/

# Quality of life
alias ls="ls --color=auto --group-directories-first"
alias ll="ls -lha"
alias l="ls -lh"
alias cp="cp -i"  # Confirm before overwriting something
alias mv="mv -i"  # Confirm before overwriting something
alias rm="rm -i"  # Confirm on removal
alias df="df -h"  # Human-readable sizes
alias free="free -h"  # Human-readable sizes
alias open="$OPENER"
# pacman
alias psyu="sudo pacman -Syu"
alias pacdiff="sudo -E pacdiff"
# full upgrade
alias sysupdate="yay &&\
    pipx upgrade-all &&\
    zinit self-update && zinit update --all &&\
    vim --headless +PlugUpgrade +PlugUpdate +qall > /dev/null"
# python venv
alias venv="python3 -m venv"
alias de="deactivate"
alias ipy="ipython"
# python jupyter notebook
alias jup="jupyter notebook"
# dotfile git
alias dots="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias lgdots="lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
# vimwiki
alias vimwiki="vim +VimwikiIndex"
# fasd
alias v="fasd -f -e $EDITOR"
# colours
alias diff="diff --color=auto"
alias grep="grep --colour=auto"
# git
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gs="git status"
alias lg="lazygit"

# Functions
edit() {
    # Open command in EDITOR
    $EDITOR "$(which "$1")"
}
ae() {
    # Activate python venv
    local venv_dir="${1:-venv}"
    local venv_poetry
    if [ -f "$venv_dir/bin/activate" ]
    then
        source "$venv_dir/bin/activate"
    else
        venv_poetry="$(poetry env list --full-path | grep "Activated" | cut -d' ' -f1)"
        [ -z "$venv_poetry" ] || source "$venv_poetry/bin/activate"
    fi
}

# Globals
alias -g P="| $PAGER"
alias -g G="| grep"
alias -g H="| head"
alias -g T="| tail"
alias -g C="| wc -l"  # count lines
