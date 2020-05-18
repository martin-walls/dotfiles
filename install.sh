#!/bin/bash

# location of dotfiles repo
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# symlink to dotfiles repo
DOTFILES="$HOME/.dotfiles"

	
echo "This script will symlink the files in this repo to their corresponding locations on the system."
echo "Proceed? (Y/n)"
read resp
if [ "$resp" = 'y' -o "$resp" = 'Y' -o "$resp" = '' ]; then
	# if symlink to dotfiles doesn't exist, create it
	if [ ! -L "$DOTFILES" ]; then
		ln -sf $REPO_DIR $DOTFILES
	fi

	# ~/.bashrc
	ln -sf $DOTFILES/bashrc ~/.bashrc

	# ~/.bash_aliases
	ln -sf $DOTFILES/bash_aliases ~/.bash_aliases

	# ~/.gitconfig
	ln -sf $DOTFILES/gitconfig ~/.gitconfig

	# ~/.gitignore_global
	ln -sf $DOTFILES/gitignore_global ~/.gitignore_global

	# libinput-gestures.conf
	ln -sf $DOTFILES/config/libinput-gestures.conf ~/.config/libinput-gestures.conf

	# bundled.desktop
	ln -sf $DOTFILES/applications/bundled.desktop ~/.local/share/applications/bundled.desktop

	echo "Symlinks created."
else 
	echo "Cancelled."
fi
