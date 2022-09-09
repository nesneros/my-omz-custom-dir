#! /usr/bin/env bash

set -e

cd $(dirname $0)/..

echo "OMZ Custom install dir: $(pwd)"

pushd setup
brew bundle
popd

dotFilesDir=$(pwd)/dotfiles

linkdot() {
    file=$1
    from=$dotFilesDir/$file
    to=$HOME/.$file
    echo " - linking $file ($to -> $from)"
    ln -sf $from $to
}

asdf-direnv-setup() {
    echo "### Setting up asdf and direnv"
    hash brew && brew install asdf
    mkdir -p $HOME/.config/direnv
    pushd $HOME
    asdf plugin-add direnv || :
    asdf direnv setup --version latest
    #asdf global direnv latest
    popd
    ln -s $dotFilesDir/direnvrc $HOME/.config/direnv/direnvrc || :
    ln -s $dotFilesDir/direnv.toml $HOME/.config/direnv/direnv.toml || :
    #touch $HOME/.envrc
}

#echo "Linking dot files..."
#linkdot "p10k.zsh"

echo "### Define global gitignore"
git config --global core.excludesfile $(
    cd $(dirname $0)
    pwd
)/gitignore_global

asdf-direnv-setup

if [ -d $HOME/.config/kitty ]; then
    echo "### Linking kitty config"
    ln -s $dotFilesDir/kitty.d $HOME/.config/kitty || :

    echo
    echo "### MANUAL ACTION ###"
    echo "Add 'globinclude kitty.d/*.conf' to $HOME/.config/kitty/kitty.conf"
fi
