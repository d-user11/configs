#!/bin/bash
# TODO: Make use of code --list-extensions
extensions_file="extensions.txt"

if [[ -f $extensions_file ]]; then

    while IFS= read -r extension; do
        echo "Installing $extension ..."
        code --force --install-extension $extension
        echo
    done < "$extensions_file"

else
    echo "File $extensions_file does not exist."
    exit 1
fi