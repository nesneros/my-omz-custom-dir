if (( ! ${+commands[lesspipe.sh]} )); then
  return
fi

lesspipe.sh | source /dev/stdin
