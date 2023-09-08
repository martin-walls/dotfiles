# General system aliases

# enable colors of commands
alias ls='ls --color'
alias grep='grep --color'

# ls aliases
# long list without owner, hide group, show almost all, show type, human readable sizes
alias l='ls -gGAFh'
# long list, show almost all, show type, human readable sizes
alias ll='ls -lAFh'

# parent directory
alias ..='cd ..'

# confirmation before deleting
alias rm='rm -I'
# confirmation before overwrite
alias mv='mv -i'
alias cp='cp -i'

# nicer cat output
if [ -f "/usr/bin/bat" ]; then
    alias cat='bat --tabs=2'
fi

# St Andrews SSH
alias sta-ssh='ssh mrw24@mrw24.teaching.cs.st-andrews.ac.uk'
alias sta-jump='ssh -J mrw24@jump.cs.st-andrews.ac.uk mrw24@mrw24.teaching.cs.st-andrews.ac.uk'
