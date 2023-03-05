#          _
#  _______| |__
# |_  / __| '_ \
#  / /\__ \ | | |
# /___|___/_| |_|

# Options section
setopt correct                                             # Auto correct mistakes
setopt extendedglob                                        # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                          # Case insensitive globbing
setopt rcexpandparam                                       # Array expension with parameters
setopt nocheckjobs                                         # Don't warn about running processes when exiting
setopt numericglobsort                                     # Sort filenames numerically when it makes sense
setopt nobeep                                              # No beep
setopt sharehistory                                        # Immediately append history instead of overwriting
setopt histignorealldups                                   # If a new command is a duplicate, remove the older one
setopt autocd                                              # If only directory path is entered, cd there.
setopt globdots                                            # Include .* files and folders in completion

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"    # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                         # Automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ':completion:*' menu select
# Disable highlighting of pasted text: https://www.reddit.com/r/zsh/comments/c160o2/comment/erbg6hy/
zle_highlight=('paste:none')

# Create folders
[ ! -d "$XDG_STATE_HOME/zsh" ] && mkdir -p "$XDG_STATE_HOME/zsh"
[ ! -d "$XDG_CACHE_HOME/zsh/zcompcache" ] && mkdir -p "$XDG_CACHE_HOME/zsh/zcompcache"
# Don't consider certain characters part of the word
WORDCHARS=${WORDCHARS//\/[&.;]}
# Don't trigger correction with these files
CORRECT_IGNORE_FILE='notebooks'
# History settings
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=10000

### Added by Zinit's installer
if [[ ! -f $HOME/.config/zsh/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.config/zsh/.zinit" && command chmod g-rwX "$HOME/.config/zsh/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.config/zsh/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$XDG_CONFIG_HOME/zsh/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit wait'0a' lucid light-mode for \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-bin-gem-node

# LS_COLORS
# zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
#     atpull'%atclone' pick"clrs.zsh" nocompile'!' \
#     atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
# zinit light trapd00r/LS_COLORS

# BEFORE COMPINIT
# Load some plugins and personal config
zinit wait'0b' lucid light-mode for \
        zsh-users/zsh-history-substring-search \
        hlissner/zsh-autopair \
        zdharma-continuum/fast-syntax-highlighting \
    atload"zicompinit; zicdreplay" \
        multisrc"*.zsh" pick"/dev/null" "$ZDOTDIR"

# AFTER COMPINIT
zinit wait'0c' lucid light-mode for \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    blockf atpull'zinit creinstall -q .' \
       zsh-users/zsh-completions 

# install lazyshell if OPENAI_API_KEY is set
if [ -n "$OPENAI_API_KEY" ]; then
    zinit wait'0c' lucid light-mode for \
        pick'lazyshell.zsh' \
            not-poma/lazyshell
fi

# add pure prompt
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light 'sindresorhus/pure'

# add to beginning of fpath
fpath=("$ZDOTDIR/completions" "${fpath[@]}")

# Plugin settings
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
