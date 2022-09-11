if (( ! ${+commands[kitty]} )); then
  return
fi

alias icat="kitty +kitten icat"
