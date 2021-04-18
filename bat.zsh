if (( ! ${+commands[batpipe]} )); then
  return
fi

eval $(batpipe)

alias man=batman
