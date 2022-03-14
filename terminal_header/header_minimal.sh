#!/bin/bash

HEADER_FILE="$HOME/.dotfiles/terminal_header/asciiheader_small.txt"

printf "\n"

while IFS= read -r line ; do
  printf " %b\n" "$line"
done < "$HEADER_FILE"

printf "\n"
