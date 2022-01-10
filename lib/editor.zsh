if (( $+commands[codium] )) ; then
    export EDITOR="$(which codium) -w"
    alias e=codium
elif (( $+commands[code] )) ; then
    export EDITOR="$(which code) -w"
    alias e=code
fi