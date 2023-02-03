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
alias cp="cp -i"     # Confirm before overwriting something
alias mv="mv -i"     # Confirm before overwriting something
alias rm="rm -i"     # Confirm on removal
alias df="df -h"     # Human-readable sizes
alias free="free -h" # Human-readable sizes
alias open="$OPENER"
# pacman
alias pacman="sudo pacman"
alias pacdiff="sudo -E pacdiff"
# full upgrade
# TODO: figure out how to run PackerUpdate without fully starting vim.
alias sysupdate="paru;\
    { type qutebrowser > /dev/null && qutebrowser ':adblock-update' 2>/dev/null; };\
    { type pipx > /dev/null && pipx upgrade-all; };\
    zinit self-update && zinit update --all;\
    vim --headless +TSUpdate  +qall > /dev/null;\
    vim -c PackerUpdate"
# python venv
alias venv="python3 -m venv"
alias de="deactivate"
alias ipy="ipython"
# python jupyter notebook
alias jup="jupyter notebook"
# dotfile git
# alias dots="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias lgdots="lazygit --git-dir=\"$HOME/.dotfiles/\" --work-tree=\"$HOME\""
# vimwiki
alias vimwiki="vim -c VimwikiIndex"
# colours
alias diff="diff --color=auto"
alias grep="grep --colour=auto"
# git
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gs="git status"
alias lg="lazygit"
type docker >/dev/null && alias docker="sudo docker"
type lazydocker >/dev/null && alias lazydocker="sudo lazydocker"
# other
alias wifiqr="nmcli dev wifi show-password"

# Functions

# Dots git management.
dots() {
    if [ "$#" = 0 ]; then
        dots edit
    else
        git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" "$@"
    fi
}
# Open command in $EDITOR
edit() {
    $EDITOR "$(which "$1")"
}
# Find package that owns a command.
pacwhich() {
    sudo pacman -Qo "$(which "$1")"
}
# List current explicit packages with package information preview.
pacinspect() {
    pacman -Q "$@" | fzf -m --preview 'pacman -Qi {1} && echo "Pactree:" && pactree {1}' \
        --preview-window '80%:wrap' --height 100%
}
# Activate python venv
ae() {
    local venv_dir
    venv_dir="${1:-venv}"
    if [ -f "$venv_dir/bin/activate" ]; then
        source "$venv_dir/bin/activate"
    elif type poetry >/dev/null 2>&1; then
        local venv_poetry
        venv_poetry="$(poetry env list --full-path | grep "Activated" | cut -d' ' -f1)"
        [ -n "$venv_poetry" ] && source "$venv_poetry/bin/activate"
    fi
}
if type rga >/dev/null; then
    # Interactive rga:
    # https://github.com/phiresky/ripgrep-all#integration-with-fzf
    rga-fzf() {
        RG_PREFIX="rga --files-with-matches"
        local file
        file="$(
            FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
                fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
                --phony -q "$1" \
                --bind "change:reload:$RG_PREFIX {q}" \
                --preview-window="70%:wrap"
        )" &&
            echo "opening $file" &&
            xdg-open "$file"
    }
fi

# Function completions
compdef dots=git
compdef edit=which
compdef pacwhich=which
compdef '_files -/' ae # folders

# Globals
alias -g P='| $PAGER'
alias -g G="| grep"
alias -g H="| head"
alias -g T="| tail"
alias -g C="| wc -l" # count lines
alias -g N="> /dev/null"
alias -g PING="; notify-send 'PING'"

# Directory shortcuts
# hash -d config="$XDG_CONFIG_HOME"
# hash -d cache="$XDG_CACHE_HOME"
hash -d state="$XDG_STATE_HOME"
hash -d data="$XDG_DATA_HOME"
hash -d bin="$HOME/.local/bin/"
hash -d usb="/run/media/$USER" # udiski usb mount location
