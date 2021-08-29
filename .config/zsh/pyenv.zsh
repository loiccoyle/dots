# Setup pyenv
if command -v pyenv 1>/dev/null 2>&1; then
    export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
    # export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi

# pyenv completions
# https://raw.githubusercontent.com/pyenv/pyenv/master/completions/pyenv.zsh
if [[ ! -o interactive ]]; then
    return
fi

compctl -K _pyenv pyenv

_pyenv() {
    local words completions
    read -cA words

    if [ "${#words}" -eq 2 ]; then
        completions="$(pyenv commands)"
    else
        completions="$(pyenv completions ${words[2,-2]})"
    fi

    reply=(${(ps:\n:)completions})
}
