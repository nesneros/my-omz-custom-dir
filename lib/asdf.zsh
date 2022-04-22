if (( ! ${+commands[asdf]} )); then
  return
fi

export ASDF_CONFIG_FILE=$ZSH_CUSTOM/dotfiles/asdfrc
export ASDF_GOLANG_DEFAULT_PACKAGES_FILE=$ZSH_CUSTOM/dotfiles/default-golang-pkgs
