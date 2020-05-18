#!/bin/bash

# location of dotfiles repo
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# symlink to dotfiles repo
DOTFILES="$HOME/.dotfiles"

	
echo "This script will symlink the files in this repo to their corresponding locations on the system."
echo "Proceed? (Y/n)"
read resp
if [ "$resp" = 'y' -o "$resp" = 'Y' -o "$resp" = '' ]; then
	# if symlink to dotfiles already exists, unlink it first
	if [ -L "$DOTFILES" ]; then
		unlink "$DOTFILES"
	fi
	ln -svf $REPO_DIR $DOTFILES

	# ~/.bashrc
	ln -svf $DOTFILES/bashrc ~/.bashrc

	# ~/.bash_aliases
	ln -svf $DOTFILES/bash_aliases ~/.bash_aliases

	# ~/.gitconfig
	ln -svf $DOTFILES/gitconfig ~/.gitconfig

	# ~/.gitignore_global
	ln -svf $DOTFILES/gitignore_global ~/.gitignore_global

	# libinput-gestures.conf
	ln -svf $DOTFILES/config/libinput-gestures.conf ~/.config/libinput-gestures.conf

	# bundled.desktop
	ln -svf $DOTFILES/applications/bundled.desktop ~/.local/share/applications/bundled.desktop

	echo "Symlinks created."
else 
	echo "Cancelled."
fi
