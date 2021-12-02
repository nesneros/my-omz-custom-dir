# check if fasd is installed
if (( ! ${+commands[asdf]} )); then
  return
fi

export ASDF_CONFIG_FILE=$ZSH_CUSTOM/dotfiles/asdfrc
ASDF_DIR=$(brew --prefix asdf)
source $ASDF_DIR/libexec/asdf.sh

export DIRENV_BIN=$(asdf where direnv)/bin/direnv

[[ -x "$DIRENV_BIN" ]] || return

# Use direnv instead of shims. Direnv asdf plugin must be added
hook="$($DIRENV_BIN hook zsh)"
if [[ $? == 0 ]]; then
  # Hook direnv into your shell.

  eval $hook

  # A shortcut for asdf managed direnv.
  direnv() { $DIRENV_BIN "$@"; }

  #echo export PATH=$PATH:$ASDF_DIR/bin

  # In addition ~/.config/direnv/direnvrc is updated
fi
unset hook
