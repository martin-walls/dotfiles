# ls aliases
alias ll='ls -AlFh'
alias la='ls -A'
alias l='ls -CF'
alias lll='ll'

alias ..='cd ..'

# ech $PATH with line breaks
alias showpath='echo $PATH | tr ":" "\n"'

alias trash='trashy'
alias cat='batcat'

# interact with git in dotfiles repo from anywhere
alias dotgit='git -C ~/.dotfiles'

# mkdir and cd into it
mcd () {
	mkdir -p $1
	cd $1
}

# cd to dir and list contents
cdl () {
	cd $1
	ll
}
