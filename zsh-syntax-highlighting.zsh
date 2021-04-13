initfile=$MY_TOOLS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ -e $initfile ]]; then
    source $initfile
    ZSH_HIGHLIGHT_STYLES[globbing]='fg=red'
fi
