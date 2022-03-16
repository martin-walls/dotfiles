#!/bin/bash
#
# This script mainly based from github.com/holman/dotfiles/script/bootstrap
#
# The MIT License
#
# Copyright (c) Zach Holman, http://zachholman.com
# (c) Martin Walls
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

DOTFILES_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)

# stop execution of the script immediately if a command has an error
set -e

echo ''

. "$DOTFILES_ROOT/link_file.sh"

install_dotfiles () {
  info 'installing dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

	for src in $(find -H "$DOTFILES_ROOT" -maxdepth 1 -name '*.symlink' -not -path '.git/*')
	do
		dst="$HOME/$(basename "${src%.*}")"
		link_file "$src" "$dst"
	done
}

install_configs () {
	info 'installing .config'

	local overwrite_all=false backup_all=false skip_all=false

	if [ ! -d "$HOME/.config" ] ; then
		mkdir -p "$HOME/.config"
		success "created directory $HOME/.config"
	fi

	for f in $DOTFILES_ROOT/.config/*; do
		link_file "$f" "$HOME/.config/$(basename $f)"
	done
}

# install submodules
info 'installing submodules'
git submodule update --init --recursive

install_dotfiles
install_configs

echo ''
echo '  All installed!'
