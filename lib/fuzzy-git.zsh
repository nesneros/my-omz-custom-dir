if [[ -f $MY_TOOLS_DIR/git-fuzzy/bin/git-fuzzy ]]; then
    export PATH="$MY_TOOLS_DIR/git-fuzzy/bin:$PATH"
    alias fuz="git fuzzy"
fi
