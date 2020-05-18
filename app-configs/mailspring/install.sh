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

        if [ -f ~/snap/mailspring/common/config.json ]; then
            mv ~/snap/mailspring/common/config.json ~/snap/mailspring/common/config.json.original
        fi

        ln -svf $DOTFILES/app-configs/mailspring/config.json ~/snap/mailspring/common/config.json

        echo "Linked config files to ~/snap/mailspring"
        ;;
esac