# set PATH variables
export PATH=~/.dotfiles/bin:~/bin:~/.local/bin${PATH}

export EDITOR='vim'
export VISUAL='vim'

# coloured manpages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

[ -f "$HOME/.zshenv_local" ] && source "$HOME/.zshenv_local"
