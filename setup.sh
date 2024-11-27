#!/bin/bash

echo "Setting dotfiles ..."

dotfiles=$(find . -maxdepth 1 -type f -printf "%f\n" | grep "^\.")

for dotfile in $dotfiles; do
   ln -vfs $PWD/$dotfile ~/$dotfile
done

echo "Create ssh key for GitHub ..."

if [[ -f ~/.ssh/id_ed25519.pub ]]; then
    echo "Key exists."
else
    echo "Creating ..."
    ssh-keygen -t ed25519
fi

echo "Link the key with GitHub"
echo "https://github.com/settings/keys"
