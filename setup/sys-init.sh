#! /usr/bin/env bash

set -e 

cd $(dirname $0)/..

echo "OMZ Custom install dir: $(pwd)"

cd brew
brew bundle