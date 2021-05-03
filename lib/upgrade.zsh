upgrade-all() {
    if hash apt-get &> /dev/null ; then
        print "\n--- Upgrading APT packages ---"
        sudo apt-get update && sudo apt-get upgrade
    fi

    print "Upgrading brews..."
    hash brew &> /dev/null && brew upgrade --cask

    print "Upgrading brews..."
    hash brew &> /dev/null && brew upgrade --cask

    print "Upgrading asdf plugins"
    hash asdf &> /dev/null && asdf plugin-update --all

    print "Upgrade OH MY ZSH"
    type omz &> /dev/null && omz update

    type upgrade_oh_my_zsh_custom &> /dev/null && upgrade_oh_my_zsh_custom
}