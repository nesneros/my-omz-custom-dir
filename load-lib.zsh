# Auto detect some local configs

for dir ($HOME/.crypt $HOME/Documents/.qrypt); do
  if [ -d "$dir" ] ; then
     export QRYPT_DIR="$dir"
  fi
done

# Load all of your custom configurations from custom/lib
for config_file ($ZSH_CUSTOM/lib/*.zsh(N)); do
  source $config_file
done
unset config_file
