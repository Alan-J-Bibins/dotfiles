#!/bin/bash

#List of applications to install:
programs=("atuin","fzf","yazi","zoxide","eza","oh-my-posh","jq", "lazygit", "btop", "python-pywal", "python-pip")

for program in "${programs[@]}"; do
	if yay -Qs "$program" > /dev/null 2?&1; then
		echo "$program is already installed."
	else
		yay -S "$program"
	fi
done

echo "Installation of essential terminal programs completed! :D"

# other applications that are not on yay or pacman : nvm
