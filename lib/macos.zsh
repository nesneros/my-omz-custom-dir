# Return if not on macOS
[[ "$OSTYPE" != darwin* ]] && return

alias afk="open -a /System/Library/CoreServices/ScreenSaverEngine.app"
