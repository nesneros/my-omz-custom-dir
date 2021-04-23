# By naming convention this is the last setup scripr processed. It (among others) defines some global aliases which could
# potentially make some plugins not load correctly

# Add scripts dir to PATH
PATH=$ZSH_CUSTOM/scripts:$PATH

# Inspired by Zoppo
# Create an alias for a command with some options.
# Either create new alias or add options to existing alias
alias+() {
    alias "$1"="${aliases[$1]:-$1} $argv[2,-1]"
}

alias+ df -h

# ### Disable glob for some commands
for e in find locate mdfind rsync scp; do
    alias "$e=noglob ${aliases[$e]:-$e}"
done

# Disable correction for some commands
for e in ag cp grep ln mv; do
    alias "$e=nocorrect ${aliases[$e]:-$e}"
done

function _makesudo {
    if type "$1" >/dev/null ; then
        alias "$1"="sudo $1"
    fi
}

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

alias -g F='|less +F'
alias -g GREP='|grep --ignore-case -E'
alias -g G='|rg'
alias -g H='|head'
alias -g L='|less'
alias -g S='|sort'
alias -g T='|tail -100f'
# Colorize json
alias -g J='|jq .'

# Remove duplicates from PATH
typeset -U path

[[ -d $CLOUDSDK_HOME/completion.zsh.inc ]] && source $CLOUDSDK_HOME/completion.zsh.inc

autoload -U compinit && compinit

# Override git alias
alias alias gr=gradle
