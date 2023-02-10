(( ${+commands[jira]} )) || return

if [ -f "$JIRA_TOKEN_ASC_FILE" ]; then
    export JIRA_API_TOKEN=$(gpg -d "$JIRA_TOKEN_ASC_FILE" 2>/dev/null)
fi