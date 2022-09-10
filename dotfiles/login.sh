# Sourced during login
# echo "LOGIN ${LOGIN_FLAG} $(date) ${OSTYPE} --- ${ZSH_CUSTOM}" >> /tmp/login.log

# Set env vars that will be be set when launching apps on macos
setenv() {
    if [ -z "$2" ]; then
        echo "Usage: setenv <name> <value>"
    else
#        if [ "$OSTYPE" == darwin* ]; then
            launchctl setenv "$1" "$2"
#        fi
        export $1="$2"
    fi
}


kittyConf=$ZSH_CUSTOM/dotfiles/kitty
if [ -d "$kittyConf" ]; then
    setenv KITTY_CONFIG_DIRECTORY "$kittyConf"
fi