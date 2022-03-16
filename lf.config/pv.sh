#!/bin/bash

# Command to run for preview pane in lf, depending
# on file extension

file=$1
w=$2
h=$3
x=$4
y=$5

preview_image () {
  kitty +icat --silent --transfer-mode file --place "${w}x${h}@${x}x${y}" "$file"
  exit 1
}

case "$1" in
  *.tar*) tar tf "$file";;
  *.zip) unzip -l "$file";;
  *.rar) unrar l "$file";;
  *.7z) 7z l "$file";;
  *.jpg|*.png)
    preview_image;;
  *.pdf) pdftotext "$file" -;;
  *) highlight -O ansi --force "$file";;
esac
