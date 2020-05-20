#!/bin/bash

DOTFILES="$HOME/.dotfiles"

INSTALL_MODE="none"

# get install mode from flags
# -s: snap
while getopts "s" OPTION
do
    case $OPTION in
        s)
            INSTALL_MODE="snap"
            ;;
    esac
done

# if no flags passed, prompt user to choose install mode.
# s/S: snap
if [ "$INSTALL_MODE" = "none" ]; then
    echo "Choose install mode (snap)"
    read resp
    case $resp in
        s)
            INSTALL_MODE="snap"
            ;;
        S)
            INSTALL_MODE="snap"
            ;;
    esac
fi

case $INSTALL_MODE in
    snap)
        # link files to snap dir
        ln -svf $DOTFILES/appconfigs/mailspring/keymap.json ~/snap/mailspring/common/keymap.json

        echo "Symlinked config files to ~/snap/mailspring"
        ;;
esac
