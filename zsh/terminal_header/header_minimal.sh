#!/bin/bash

HEADER_FILE="$HOME/.dotfiles/zsh/terminal_header/asciiheader_small.txt"

while IFS= read -r line ; do
  printf " %b\n" "$line"
done < "$HEADER_FILE"
