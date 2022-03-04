#!/bin/bash

# don't need this with autorandr
# ~/.config/screenlayout/main.sh
# autorandr --change
autorandr --force

flameshot

# network manager tray icon
nm-applet
