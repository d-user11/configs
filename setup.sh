#!/bin/bash

echo "Linking dotfiles ..."

dotfiles=$(find . -maxdepth 1 -type f -printf "%f\n" | grep "^\.")

for dotfile in $dotfiles; do
   ln -vfs $PWD/$dotfile ~/$dotfile
done

echo "Do you want to set up GitHub key?"
select yn in "Yes" "No"; do
    case $yn in

        Yes )
            echo "Create ssh key for GitHub ..."

            if [[ -f ~/.ssh/id_ed25519.pub ]]; then
                echo "Key exists."
            else
                echo "Creating ..."
                ssh-keygen -t ed25519
            fi

            printf "Please follow the link and set the GitHub ssh key: "
            echo "https://github.com/settings/keys"
            break;;

        No ) exit;;

    esac
done
