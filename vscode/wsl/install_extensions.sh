#!/bin/bash

extensions_file="extensions.txt"

echo "[?] Checking for extensions to be removed ..."

extensions_to_be_removed=$(diff <(code --list-extensions | sort) <(cat $extensions_file | sort) | grep "^< " | sed 's/^< //')

if [[ ! -z "${extensions_to_be_removed}" ]]; then
    printf "\n[!] Removing extensions ...\n\n"

    for extension in $extensions_to_be_removed; do
        code --uninstall-extension $extension
        echo
    done
else
    echo "[.] No extensions to be removed."
fi

printf "\n[+] Installing extensions ...\n\n"

if [[ -s $extensions_file ]]; then

    while IFS= read -r extension; do
        code --force --install-extension $extension
        echo
    done < "$extensions_file"

else
    echo "[-] File $extensions_file might not exist or is empty."
fi