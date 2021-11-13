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

p10kSrc=$dotFilesDir/p10k.zsh
p10kTarget=$HOME/.p10k.zsh

echo "Overwriting $p10kTarget with $p10kSrc"
cp $p10kSrc $p10kTarget

#echo "Linking dot files..."
#linkdot "p10k.zsh"
 