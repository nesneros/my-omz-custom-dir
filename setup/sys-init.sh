#! /usr/bin/env bash

set -e 

cd $(dirname $0)/..

echo "OMZ Custom install dir: $(pwd)"

( cd brew ; brew bundle )

dotFilesDir=$(pwd)/dotfiles

linkdot() {
    file=$1
    from=$dotFilesDir/$file
    to=$HOME/.$file
    echo " - linking $file ($to -> $from)"
    ln -sf $from $to    
}

#echo "Linking dot files..."
#linkdot "p10k.zsh"

echo "Define global gitignore"
git config --global core.excludesfile $(cd $(dirname $0) ; pwd)/gitignore_global
 