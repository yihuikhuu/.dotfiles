#!/usr/bin/env zsh

source ./env.sh

pushd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "Removing $folder"
    stow --dotfiles --target=$HOME -D $folder
done
popd
