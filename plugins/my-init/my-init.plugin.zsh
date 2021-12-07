# Create an alias for a command with some options.
# Either create new alias or add options to existing alias
# Credit: Inspired by Zoppo
alias+() {
    alias "$1"="${aliases[$1]:-$1} $argv[2,-1]"
}

# Look for brew installations and init
if [[ -z "$HOMEBREW_PREFIX" ]] ; then
  brewLocations=(/opt/homebrew /home/linuxbrew/.linuxbrew)
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

# Spefify where gcloud is installed. This is used by ohmyzsh gcloud plugin
# The logic below is heavy inspired by the glcoud plugin

# Set CLOUDSDK_HOME
if [[ -z "${CLOUDSDK_HOME}" ]]; then
  search_locations=(
    $HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk
    #    $HOME/.asdf/installs/gcloud/$(asdf current gcloud | awk '{ print $2 }')
  )

  for gcloud_sdk_location in $search_locations; do
    if [[ -d "${gcloud_sdk_location}" ]]; then
      CLOUDSDK_HOME="${gcloud_sdk_location}"
      break
    fi
  done
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
