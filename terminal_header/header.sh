#!/bin/bash

HEADER_FILE="$HOME/.dotfiles/terminal_header/asciiheader.txt"
QUOTE_FILE="$HOME/.dotfiles/terminal_header/quotes.txt"
declare -i TERM_COLS="$(tput cols)"

function print_header {
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

function print_quote {
  declare -i MAXWIDTH="$(( TERM_COLS / 2 ))"
  if [[ $TERM_COLS -lt 80 ]] ; then
    MAXWIDTH="$(( $TERM_COLS - 4 ))"
  elif [[ $TERM_COLS -lt 120 ]] ; then
    MAXWIDTH="$(( TERM_COLS * 4 / 5 ))"
  fi

  quote="#"
  # ignore commented lines
  while [[ "$quote" == \#* ]] ; do
    quote="$(printf "$(shuf -n 1 $QUOTE_FILE)")"
  done
  readarray -t rawquotelines <<<"$quote"

  quotelines=()
  declare -i maxw=0
  for line in "${rawquotelines[@]}" ; do
    while [[ ${#line} -gt $MAXWIDTH ]] ; do
      declare -i lastspace=0
      for ((i=$MAXWIDTH; i > 0; i--)) ; do
        if [[ ${line:i:1} == [[:space:]] ]] ; then
          lastspace=i
          break
        fi
      done
      if [[ $lastspace == 0 ]] ; then
        lastspace=$MAXWIDTH
      fi
      quotelines=("${quotelines[@]}" "${line:0:$lastspace}")
      line="${line:(($lastspace+1)):((${#line} - $lastspace - 1))}"
    done
    quotelines=("${quotelines[@]}" "$line")
  done

  declare -i padding_len="$(( (TERM_COLS - ${#quotelines[0]}) / 2 ))"
  padding=""
  for ((i=0; i < $padding_len; i++)); do
    padding="$padding "
  done

  for line in "${quotelines[@]}" ; do
    if [[ "$line" == ~* ]] ; then
      # print quote author on the right
      declare -i extrapadding_len="$(( ${#quotelines[0]} - ${#line} ))"
      extrapadding=""
      for ((i=0; i < $extrapadding_len; i++)) ; do
        extrapadding="$extrapadding "
      done
      printf "%s%s%s\n" "$padding" "$extrapadding" "$line"
    else
      printf "%s%s\n" "$padding" "$line"
    fi
  done


  return 0
}

print_header "$HEADER_FILE" | lolcat
print_quote | lolcat
echo
