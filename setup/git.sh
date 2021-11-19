#! /usr/bin/env bash

set +e

if hash delta >/dev/null; then
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
fi

#git config --global mergetool.smerge.cmd 'smerge mergetool "$BASE" "$LOCAL" "$REMOTE" -o "$MERGED"'
#git config --global mergetool.smerge.trustExitCode true
#git config --global merge.tool smerge
