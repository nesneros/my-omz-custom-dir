(( ${+commands[glab]} )) || return

glab() {
    token=$(api_token gitlab)
    if [ -z "$token" ]; then
        command glab "$@"
    else
        GITLAB_TOKEN=$token command glab "$@"
    fi
}
