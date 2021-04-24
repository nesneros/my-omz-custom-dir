hash brew &>/dev/null || return

[[ -z "$HOMEBREW_PREFIX" ]] && echo "HOMEBREW_PREFIX not defined"

FPATH=${HOMEBREW_PREFIX}/share/zsh/site-functions:$FPATH
