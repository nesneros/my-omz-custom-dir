upgrade-all() {
    print "Upgrading brews..."
    hash brew &> /dev/null && brew upgrade --cask

    print "Upgrading asdf plugins"
    hash asdf &> /dev/null && asdf plugin-update --all

    print "Upgrade OH MY ZSH"
    type omz &> /dev/null && omz update

    type upgrade_oh_my_zsh_custom &> /dev/null && upgrade_oh_my_zsh_custom
}