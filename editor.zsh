if (( $+commands[codium] )) ; then
    export VISUAL="$(which codium) -w"
    alias e=codium
fi