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

    print "\n--- Upgrading asdf plugins ---"
    hash asdf &>/dev/null && asdf plugin-update --all | grep -v "Already on '\|Your branch is up to date with"

    print "\n--- Upgrading asdf install system tools ---"
    type upgrade_asdf_system_tools &>/dev/null && upgrade_asdf_system_tools

    print "\n--- Upgrade OH MY ZSH ---"
    type omz &>/dev/null && omz update

    print "\n--- Upgrade Custom OH MY ZSH ---"
    type upgrade_oh_my_zsh_custom &>/dev/null && upgrade_oh_my_zsh_custom
}
