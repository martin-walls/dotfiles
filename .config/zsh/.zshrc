# Dependencies
# - zsh-syntax-highlighting
# - git-prompt.sh (https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
# - autojump

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# show terminal header
~/.dotfiles/terminal_header/header_minimal.sh

HISTFILE=~/.cache/zshhistory
HISTSIZE=10000
SAVEHIST=10000
setopt share_history

# enable colours
autoload -U colors && colors

eval "$(dircolors ~/.dircolors)"

# use emacs keybindings
bindkey -e


# Basic Completion
# case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit
# include hidden files in completion results without explicitly
# specifying the dot (TODO not working?)
_comp_options+=(globdots)

source ~/.git-prompt.sh

precmd () { echo -ne "\033]0;$(print -P '%(3~|.../%2~|%~)')\007" }

# Prompt config
setopt prompt_subst
PROMPT='%B%F{blue}%(3~|.../%2~|%~)%f%b %(!.#.:) '
# __git_ps1 optionally takes two args, pre and post, to show before
# and after the git prompt
RPROMPT='$(__git_ps1 "(%%F{green}%%f %s)")'
# config git prompt
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="verbose"

# Load aliases
[ -f "$HOME/.config/zsh/aliases" ] && source "$HOME/.config/zsh/aliases"

# set tabstop to 2
tabs -2

# ctrl + arrow keys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# ctrl + backspace to delete last word
bindkey "^H" backward-kill-word

# use lf to also switch directories, bind it to ctrl-o
[ -f "$HOME/.config/lf/lfcd.sh" ] && source "$HOME/.config/lf/lfcd.sh"
bindkey -s '^f' 'lfcd\n'

# use ctrl-n to clear screen, cos ctrl-l is used by vim-kitty-navigator
bindkey "^N" clear-screen

# ssh handler
source ~/.config/zsh/ssh_agent_handler.zsh

# Better history searching
# See https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey $key[Up] up-line-or-beginning-search   # Up
bindkey $key[Down] down-line-or-beginning-search # Down

# Load plugins (should be at end of .zshrc)
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/autojump/autojump.zsh 2>/dev/null
