# Zsh aliases
alias ls="ls --color=auto --group-directories-first"
alias ll="ls -lha"
alias l="ls -lh"
alias cp="cp -i"                                                # Confirm before overwriting something
alias mv="mv -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
# alias free='free -m'                                            # Show sizes in MB
# pacman
alias psyu='sudo pacman -Syu'
alias ysyu='yay -Syu'
# full upgrade
alias sysupdate='sudo pacman -Syu && yay -Syu && pipx upgrade-all && zinit update --all && vim --headless +PlugUpdate +qall > /dev/null'
# mount gdrive
alias gdrivemount="rclone mount --daemon 'gdrive:' ~/data/gdrive"
# python venv
alias venv="python3 -m venv"
alias ae="[ -f venv/bin/activate ] && source venv/bin/activate || poetry shell"
alias de="deactivate"
alias ipy="ipython"
# python jupyter notebook
alias jup="jupyter notebook"
# config edits
alias czsh="$EDITOR $ZDOTDIR"
alias clf="$EDITOR ~/.config/lf/lfrc"
alias cwm="$EDITOR ~/.config/bspwm/bspwmrc"
alias chk="$EDITOR ~/.config/sxhkd/sxhkdrc"
alias cvim="$EDITOR ~/.config/nvim/init.vim"
# dotfile git
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# vimwiki
alias vimwiki="vim -c \"VimwikiIndex\""
# fasd
alias v='fasd -f -e vim'
# colors
alias diff="diff --color=auto"
alias grep="grep --colour=auto"
## git aliases
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gs="git status"
alias lg="lazygit"
# functions
edit () {
    $EDITOR $(which $1)
}
# globals
alias -g G="| grep"

# WORK RELATED
# beabp tunnel
beabp_tunnel () {
    ssh -A -t -l lcoyle afs -L "$1":localhost:"$1" ssh -A -t -l lcoyle cs-ccr-dev1 -L "$1":localhost:"$1" ssh -A -t -l lcoyle cs-ccr-beabp1 -L "$1":localhost:"$1"
}
# alias beabp_tun="ssh -A -t -l lcoyle afs -L 8901:localhost:8901 ssh -A -t -l lcoyle cs-ccr-dev1 -L 8901:localhost:8901 ssh -A -t -l lcoyle cs-ccr-beabp1 -L 8901:localhost:8901"
alias afs="kdestroy && kinit -kt /etc/krb5.keytab lcoyle -l 7d -r 1d ; aklog CERN.CH"

# Hash directories
# add a hash shortcut for afs work directories. Usage: `cd ~work`
hash -d work="/afs/cern.ch/work/l/lcoyle"
