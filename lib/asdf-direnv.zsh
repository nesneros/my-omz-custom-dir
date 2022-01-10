# check if fasd is installed
if (( ! ${+commands[asdf]} || ! ${+commands[direnv]} )); then
  return
fi

export ASDF_CONFIG_FILE=$ZSH_CUSTOM/dotfiles/asdfrc
source $(brew --prefix asdf)/libexec/asdf.sh


# Uncomment the following line to make direnv silent by default.
# export DIRENV_LOG_FORMAT=""

# Use direnv instead of shims. Direnv asdf plugin must be added
hook="$(asdf exec direnv hook zsh)"
if [[ $? == 0 ]]; then
  # Hook direnv into your shell.

  eval $hook

  # A shortcut for asdf managed direnv.
  direnv() { asdf exec direnv "$@"; }

  # In addition ~/.config/direnv/direnvrc is updated
fi
unset hook
