if (( $+commands[kubectl] )); then
    __KUBECTL_COMPLETION_FILE="${ZSH_CACHE_DIR}/kubectl_completion_$(kubectl version --client 2> /dev/null | sha1sum | base64)"

    if [[ ! -f $__KUBECTL_COMPLETION_FILE || ! -s $__KUBECTL_COMPLETION_FILE ]]; then
        kubectl completion zsh >! $__KUBECTL_COMPLETION_FILE
    fi

    [[ -f $__KUBECTL_COMPLETION_FILE ]] && source $__KUBECTL_COMPLETION_FILE

    unset __KUBECTL_COMPLETION_FILE

    alias kc=kubectl

    if [ -d $HOME/.krew/bin ] ; then
        export PATH="${HOME}/.krew/bin:$PATH"
        eval $(kubectl krew completion zsh)
    fi
fi