#!/bin/bash

# output messages
info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_file () {
	local src=$1 dst=$2

	local overwrite= backup= skip=
	local action=

  # if destination file exists, or exists and is a directory, or exists and is a symlink
	if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink "$dst")"

      # if pointing to the same location we want it to
      if [ "$currentSrc" == "$src" ]
      then
        skip=true
      else
        user "File already exists: $dst ($(basename "$src")), what do you want to do\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"

        # reading from /dev/tty seems to make this work
        read -n 1 action </dev/tty

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            # if invalid input, skip so the script doesn't fail
            info "Invalid action: skipping"
            skip=true
            ;;
        esac
      fi
    fi

    # if overwrite is unset, set it to value of overwrite_all
    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  # if not skipping this file
  if [ "$skip" != "true" ] # "false" or empty
  then
    ln -s "$src" "$dst"
    success "linked $src to $dst"
  fi
}
