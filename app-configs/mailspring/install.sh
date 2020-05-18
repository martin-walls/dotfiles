#!/bin/bash

DOTFILES="$HOME/.dotfiles"

INSTALL_MODE="none"

while getopts "s" OPTION
do
    case $OPTION in
        s)
            INSTALL_MODE="snap"
            ;;
    esac
done

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
        ln -svf $DOTFILES/app-configs/mailspring/keymap.json ~/snap/mailspring/common/keymap.json

        echo "Symlinked config files to ~/snap/mailspring"
        ;;
esac