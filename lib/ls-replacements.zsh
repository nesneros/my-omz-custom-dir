if (( ${+commands[lsd]} )) ; then
    alias+ lsd -hA --group-dirs first 
fi

if (( ${+commands[exa]} )) ; then
    alias+ exa --git -a --icons --group-directories-first
    # Change color of date column (da), git modified (gm) in long listings
    export EXA_COLORS="da=3:gm=1"
    alias ls=exa
fi
