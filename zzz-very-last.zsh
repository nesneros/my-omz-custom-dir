# By naming convention this is the last setup script processed. It (among others) defines some global aliases which could
# potentially make some plugins not load correctly

# Inspired by Zoppo
# Create an alias for a command with some options.
# Either create new alias or add options to existing alias
alias+() {
    alias "$1"="${aliases[$1]:-$1} $argv[2,-1]"
}

alias+ df -h

# ### Disable glob for some commands
for e in find fd mdfind rsync scp; do
    alias "$e=noglob ${aliases[$e]:-$e}"
done

# Disable correction for some commands
for e in ag cp grep ln mv; do
    alias "$e=nocorrect ${aliases[$e]:-$e}"
done

alias myip='echo $(curl -s http://whatismyip.akamai.com/)'
# alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

function _makesudo {
    if type "$1" >/dev/null ; then
        alias "$1"="sudo $1"
    fi
}

# Always use sudo with a few commands
case "$OSTYPE" in
    (linux*)
        for p in apt aptitude snap systemctl; do
            _makesudo $p
        done
        ;;
    (darvin*)
        ;;
    (*)
esac

# Convenient function to create a dir and cd into it
function mcd {
    mkdir -p $1
    cd $1
}

# gor alias is define for golang plugin. Redefined it here to use parsepanic
if typeset -f gorunpp > /dev/null ; then
    alias gor=gorunpp
fi
# Some global aliases
alias -g B='| bat'
alias -g F='| less +F'
alias -g GREP='| grep --ignore-case -E'
alias -g G='| rg --smart-case'
alias -g H='| head'
alias -g L='| less'
alias -g S='| sort'
alias -g T='| tail -100f'
alias -g P='| peco'
alias -g Z='| fzf --tac'
# Colorize json
alias -g J='|jq .'

alias+ pgrep -fli

# Remove duplicates from PATH
typeset -U path

# autoload -U compinit && compinit
# Define some aliases. Note gr overrides a git alias
# alias gr=gradle

unsetopt correctall
