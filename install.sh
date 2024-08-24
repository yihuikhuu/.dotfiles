#!/usr/bin/env zsh

source ./env.sh

pushd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "stow $folder"
    stow --dotfiles -D $folder
    stow --dotfiles $folder
done
popd
