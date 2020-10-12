#!/bin/bash

DOTFILES="$HOME/.dotfiles"

echo "This script will symlink the files in this repo to their corresponding locations on the system."
echo "Proceed? (Y/n)"
read resp
if [ "$resp" = 'y' -o "$resp" = 'Y' -o "$resp" = '' ]; then
	sudo ln -svf $DOTFILES/appconfigs/firefox/autoconfig.js /usr/lib/firefox/defaults/pref/local-settings.js

	sudo ln -svf $DOTFILES/appconfigs/firefox/firefox.cfg /usr/lib/firefox/firefox.cfg

	echo "Symlinks created."
else 
	echo "Cancelled."
fi
