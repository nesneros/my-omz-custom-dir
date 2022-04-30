hash gpg &>/dev/null || return

[ -f ~/.github_token.asc ] && export GITHUB_TOKEN_ASC_FILE=~/.github_token.asc

github_token() {
    if [ -f "$GITHUB_TOKEN_ASC_FILE" ]; then
        gpg <"$GITHUB_TOKEN_ASC_FILE" 2>/dev/null
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
fi

if hash goreleaser &>/dev/null; then
    gorel() {
        token=$(github_token)
        if [ -z "$token" ]; then
            goreleaser "$@"
        else
            GITHUB_TOKEN=$token goreleaser "$@"
        fi
    }
fi
