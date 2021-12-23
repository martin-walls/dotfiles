#!/bin/bash

function maxwidth {
  declare -i max=0

  while IFS= read -r line ; do
    if [[ ${#line} -gt $max ]] ; then
      max="${#line}"
    fi
  done <<< "$1"
  return "$max"
}

function print_header {
  declare -i TERM_COLS="$(tput cols)"

  # get maximum width of header
  declare -i maxw=0
  while IFS= read -r line ; do
    if [[ ${#line} -gt $maxw ]] ; then
      maxw="${#line}"
    fi
  done < "$1"

  if [[ $maxw -ge $TERM_COLS ]] ; then
    printf "%s" "$(<"$1")"
    return 0
  fi

  # calculate how much padding is needed
  declare -i padding_len="$(( (TERM_COLS - maxw) / 2 ))"
  # padding="$(printf "a%.0s" {1.."$padding_len"})"
  padding=""
  for ((i=0; i < $padding_len; i++)); do
    padding="$padding "
  done

  # print header with padding
  while IFS= read -r line ; do
    printf "%s%s\n" "$padding" "$line"
  done < "$1"

  return 0
}

print_header "$HOME/.dotfiles/asciiheader.txt" | lolcat
echo
