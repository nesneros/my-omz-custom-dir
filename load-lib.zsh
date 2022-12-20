# Auto detect some local configs

searchDirs=($HOME $HOME/Documents)

for dir in $searchDirs; do
  if [ -d "$dir" ] ; then
    [ -z "$QRYPT_DIR" ] && [ -d "$dir/.qrypt" ] && export QRYPT_DIR="$dir/.qrypt"
    [ -z "$GITHUB_TOKEN_ASC_FILE" ] && [ -f "$dir/.github_token.asc" ] && export GITHUB_TOKEN_ASC_FILE="$dir/.github_token.asc"
  fi
done

# Load all of your custom configurations from custom/lib
for config_file ($ZSH_CUSTOM/lib/*.zsh(N)); do
  source $config_file
done
unset config_file
