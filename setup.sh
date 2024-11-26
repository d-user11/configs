#!/bin/bash

dotfiles=$(find . -maxdepth 1 -type f -printf "%f\n" | grep "^\.")

for dotfile in $dotfiles; do
   ln -vfs $PWD/$dotfile ~/$dotfile
done
