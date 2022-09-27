if (( ${+commands[gh]} )); then
    # eval $(gh completion -s zsh)
    alias gh_auth="github_token | gh auth login --with-token && gh auth status"
fi

(( ${+commands[gpg]} )) || return

[ -f ~/.github_token.asc ] && export GITHUB_TOKEN_ASC_FILE=~/.github_token.asc

github_token() {
    if [ -f "$GITHUB_TOKEN_ASC_FILE" ]; then
        gpg -d "$GITHUB_TOKEN_ASC_FILE" 2>/dev/null
    fi
}

if hash hub &>/dev/null; then
    hub() {
        token=$(github_token)
        if [ -z "$token" ]; then
            command hub "$@"
        else
            GITHUB_TOKEN=$token command hub "$@"
        fi
    }
    alias g=hub
fi

if hash goreleaser &>/dev/null; then
    github_gorel() {
        token=$(github_token)
        if [ -z "$token" ]; then
            goreleaser "$@"
        else
            GITHUB_TOKEN=$token goreleaser "$@"
        fi
    }
fi
