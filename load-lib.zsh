# Load all of your custom configurations from custom/lib
for config_file ($ZSH_CUSTOM/lib/*.zsh(N)); do
  source $config_file
done
unset config_file