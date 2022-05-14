#!/bin/bash

current_theme=`cat ~/.dotfiles/theme/CURRENT_THEME`

# LIGHT=""
# LIGHT=""
# DARK=""
LIGHT=""
DARK=""
# LIGHT="  "
# DARK="  "

if [[ $current_theme == "light" ]]; then
  echo "$LIGHT"
else
  echo "$DARK"
fi
