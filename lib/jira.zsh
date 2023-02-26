(( ${+commands[jira]} )) || return

if tmp=$(api-token jira 2> /dev/null) ; then
    export JIRA_API_TOKEN=$tmp
fi

jira() {
    if [ -z "$JIRA_PROJECT" ]; then
        command jira "$@"
    else 
        command jira --project "$JIRA_PROJECT" "$@"
    fi
}

alias j=jira

alias jmyopen='jira issue list -a$(command jira me) --order-by rank --reverse -s~done'