if (( ! ${+commands[kitty]} )); then
  return
fi

export KITTY_CONFIG_DIRECTORY="$ZSH_CUSTOM/dotfiles/kitty"
