# Change cursor shape for different vi modes.
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] \
        || [[ $1 == 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] \
        || [[ ${KEYMAP} == viins ]] \
        || [[ ${KEYMAP} == '' ]] \
        || [[ $1 == 'beam' ]]; then
        echo -ne '\e[5 q'
    fi
}
zle -N zle-keymap-select

_fix_cursor() {
    echo -ne '\e[5 q'
}
# run it to force the correct cursor
_fix_cursor
precmd_functions+=(_fix_cursor)
