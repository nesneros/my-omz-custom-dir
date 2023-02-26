searchDirs=($HOME $HOME/Documents)
for dir in $searchDirs; do
  if [ -d "$dir" ] ; then
    [ -z "$QRYPT_DIR" ] && [ -d "$dir/.qrypt" ] && export QRYPT_DIR="$dir/.qrypt"
  fi
done

# Load all of your custom configurations from custom/lib
for config_file ($ZSH_CUSTOM/lib/*.zsh(N)); do
  source $config_file
done
unset config_file
