if (( ${+commands[gh]} )); then
    # eval $(gh completion -s zsh)
    alias gh_auth="github_token | gh auth login --with-token && gh auth status"
fi

(( ${+commands[gpg]} )) || return

alias github_token='api_token github
'
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
