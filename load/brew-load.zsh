if [[ -z "$HOMEBREW_PREFIX" ]] ; then
  brewLocations=(/opt/homebrew /usr/local /home/linuxbrew/.linuxbrew)
  for e in $brewLocations; do
    brewBin=$e/bin/brew
    if [[ -x "$brewBin" ]] ; then
      eval $($brewBin shellenv)
      break
    fi
    unset brewBin
  done
  unset brewLocations
fi

if (( ${+commands[brew]} )) ; then
  [[ -z "$HOMEBREW_PREFIX" ]] && echo "HOMEBREW_PREFIX not defined"
  FPATH=${HOMEBREW_PREFIX}/share/zsh/site-functions:$FPATH
fi
