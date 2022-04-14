_golang-setup() {
    asdf plugin-add golang
    asdf install golang latest
    asdf global golang latest
    go install golang.org/x/tools/...@latest
}

upgrade-all() {
    if hash apt-get &>/dev/null; then
        print "\n--- Upgrading APT packages ---"
        sudo apt-get update && sudo apt-get upgrade
    fi

    if hash brew &>/dev/null; then
        print "\n--- Upgrading brews ---"
        brew upgrade --cask
        brew upgrade
        brew cleanup
    fi

    if hash asdf >/dev/null; then
        print "\n--- Upgrading asdf plugins ---"
        asdf plugin-update --all | grep -v "Already on '\|Your branch is up to date with"

        # print "\n--- Upgrading asdf install system tools ---"
        # for e in direnv; do
        #     asdf install $e latest && asdf global $e latest
        # done

        print "\n--- GO setup ---"
        _golang-setup
    fi

    print "\n--- Upgrade OH MY ZSH ---"
    type omz &>/dev/null && omz update

    print "\n--- Upgrade Custom OH MY ZSH ---"
    type upgrade_oh_my_zsh_custom &>/dev/null && upgrade_oh_my_zsh_custom
}
