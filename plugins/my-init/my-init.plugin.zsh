# Create an alias for a command with some options.
# Either create new alias or add options to existing alias
# Credit: Inspired by Zoppo
alias+() {
    alias "$1"="${aliases[$1]:-$1} $argv[2,-1]"
}

# Look for brew installations and init
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

# Set fzf base, used for fzf plugin
if [[ -z "$FZF_BASE" ]] && (( ${+commands[fzf]} )); then
  case $OSTYPE in
    linux*)
       export FZF_BASE=$HOMEBREW_PREFIX/var/homebrew/linked/fzf
        ;;
    #   darwin*)
    #     FZF_BASE=$(
    #       cd $(which fzf)/../..
    #       pwd
    #     )
    #     ;;
  esac
fi
