#!/usr/bin/env zsh

STOW_FOLDERS="bin,nvim,tmux,zsh"

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "stow $folder"
    stow -D $folder
    stow $folder
done
