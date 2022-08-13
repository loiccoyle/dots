#          _
#  _______| |__
# |_  / __| '_ \
#  / /\__ \ | | |
# /___|___/_| |_|
#  _
# | | _____ _   _ ___
# | |/ / _ \ | | / __|
# |   <  __/ |_| \__ \
# |_|\_\___|\__, |___/
#           |___/

# vi mode
bindkey -v
# Value in ms to wait for another key in the shortcut
export KEYTIMEOUT=1

# Use lf to switch directories and bind it to ctrl-o
lfcd() {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir" || return
    fi
}
zle -N lfcd
# shell commands
type lfcd >/dev/null && bindkey '^o' lfcd
type lazygit >/dev/null && bindkey -s '^G' 'lazygit^M'
# Home and end
bindkey '^[[F' end-of-line       # End key
bindkey '^[[H' beginning-of-line # Home key
# delete key
bindkey '^[[3~' delete-char
# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word     # forward word with ctrl-right
bindkey '^[Od' backward-word    # back word with ctrl-left
bindkey '^[[1;5C' forward-word  # forward word with ctrl-right
bindkey '^[[1;5D' backward-word # back word with ctrl-left
bindkey '^H' backward-kill-word # delete previous word with ctrl+backspace
bindkey '^[[3;5~' kill-word     # delete word with ctrl-delete
# easy history navigation
bindkey '^K' up-history
bindkey '^J' down-history
# Use vim keys in tab complete menu:
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey '^[[Z' reverse-menu-complete # Shift+tab
# fzf keys: ctrl + t, alt + c, ctrl + r
[ -f "/usr/share/fzf/key-bindings.zsh" ] && . /usr/share/fzf/key-bindings.zsh
# edit line in $EDITOR
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line # ctrl-e to edit line in editor
# history substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
