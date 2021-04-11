# Use direnv instead of shims. Direnv asdf plugin must be added
hook="$(asdf exec direnv hook zsh)"
if [[ $? == 0 ]]; then
    # Hook direnv into your shell.

    eval $hook

    # A shortcut for asdf managed direnv.
    direnv() { asdf exec direnv "$@"; }

    # In addition ~/.config/direnv/direnvrc is updated
fi
