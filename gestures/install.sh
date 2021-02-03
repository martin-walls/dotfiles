#!/bin/bash

ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)

# stop execution of the script immediately if a command has an error
set -e

echo ''

. "$ROOT/../link_file.sh"

install () {
  local overwrite_all=false backup_all=false skip_all=false
  link_file "$ROOT/libinput-gestures.conf" "$HOME/.config/libinput-gestures.conf"
}

install

echo ''
echo '  All installed!'