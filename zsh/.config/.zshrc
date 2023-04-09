# Dependencies
# - zsh-syntax-highlighting
# - git-prompt.sh (https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
# - autojump

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Put environment variables in ~/.localrc. So they stay out of
# dotfiles repo, cos they're only really useful on the local machine.
if [[ -a ~/.localrc ]]; then
	source ~/.localrc
fi

# all zsh files from dotfiles (one level deep, so we don't get files fron
# zsh plugin submodules)
typeset -U config_files
config_files=($HOME/.dotfiles/*/*.zsh)

# load path files
for file in ${(M)config_files:#*/path.zsh}
do
	source $file
done

# load general zsh files (everything other than path files)
for file in ${config_files:#*/path.zsh}
do
	source $file
done

unset config_files

fpath=($HOME/.dotfiles/functions $fpath)
autoload -U $HOME/.dotfiles/functions/*(:t)



# show terminal header
~/.dotfiles/zsh/terminal_header/header_minimal.sh

HISTFILE=~/.cache/zshhistory
HISTSIZE=10000
SAVEHIST=10000
setopt share_history

# enable colours
autoload -U colors && colors

eval "$(dircolors ~/.dotfiles/zsh/.dircolors)"

# use emacs keybindings
bindkey -e

# make these keys work
typeset -g -A key
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# set keybindings for them
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# make sure terminal is in application mode, when zle is active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

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
# [ -f "$HOME/.config/lf/lfcd.sh" ] && source "$HOME/.config/lf/lfcd.sh"
# bindkey -s '^f' 'lfcd\n'

# Tmux session switcher
bindkey -s "^f" "tmux-sessioniser\n"

# Better history searching
# See https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey $key[Up] up-line-or-beginning-search   # Up
bindkey $key[Down] down-line-or-beginning-search # Down

source /usr/share/fzf/shell/key-bindings.zsh
source /usr/share/fzf/shell/completion.zsh

# Load plugins (should be at end of .zshrc)
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/autojump/autojump.zsh 2>/dev/null

# source /home/martin/.config/broot/launcher/bash/br
