#! /usr/bin/env bash

set +e

gc() {
    git config --global "$1" "$2"
}

alias() {
    gc "alias.$1" "$2"
}
if hash delta >/dev/null; then
    gc color.ui auto
    gc core.pager cat
        
    git config --global pager.diff delta
    git config --global pager.show delta
    git config --global pager.log delta
    git config --global pager.blame delta
    git config --global pager.reflog delta
    git config --global interactive.diffFilter delta --color-only

    git config --global delta.features decorations
    git config --global delta.line-numbers true
    git config --global delta.side-by-side false
    git config --global delta.interactive.keep-plus-minus-markers false

    alias aliases "!git config --get-regexp alias | sed -re 's/alias\\.(\\S*)\\s(.*)$/\\1 = \\2/g'"
    alias s status
    alias lg "log --graph --date=relative --pretty=tformat:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ad)%Creset'"
fi

#git config --global mergetool.smerge.cmd 'smerge mergetool "$BASE" "$LOCAL" "$REMOTE" -o "$MERGED"'
#git config --global mergetool.smerge.trustExitCode true
#git config --global merge.tool smerge
