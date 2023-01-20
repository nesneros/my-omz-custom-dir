(( ${+commands[glab]} )) || return

glab() {
    token=$(gitlab_token)
    if [ -z "$token" ]; then
        command glab "$@"
    else
        GITLAB_TOKEN=$token command glab "$@"
    fi
}
