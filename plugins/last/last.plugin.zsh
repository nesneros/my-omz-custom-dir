# Load this as the latest plugin. It defines some global aliases which could
# potentially make some plugins not load correctly

# Add scripts dir to PATH
PATH=$ZSH_CUSTOM/scripts:~/bin/share:~/bin:$PATH

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

alias -g F='|less +F'
alias -g G='|grep --ignore-case -E'
alias -g H='|head'
alias -g L='|less'
alias -g S='|sort'
alias -g T='|tail -100f'

# Remove duplicates from PATH
typeset -U path
