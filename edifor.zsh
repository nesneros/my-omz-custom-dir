if [[ ! -z "$+commands[code]" ]] ; then
    export VISUAL="$(type code) -w"
fi