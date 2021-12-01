# check if fasd is installed
if (( ! ${+commands[asdf]} )); then
  return
fi

ASDF_DIR=$(brew --prefix asdf)
source $ASDF_DIR/libexec/asdf.sh

# Use direnv instead of shims. Direnv asdf plugin must be added
hook="$(asdf exec direnv hook zsh)"
if [[ $? == 0 ]]; then
    # Hook direnv into your shell.

    eval $hook

    # A shortcut for asdf managed direnv.
    direnv() { asdf exec direnv "$@"; }

    #echo export PATH=$PATH:$ASDF_DIR/bin

    # In addition ~/.config/direnv/direnvrc is updated
fi
unset hook
