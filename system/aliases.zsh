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
alias stassh='ssh mrw24@mrw24.teaching.cs.st-andrews.ac.uk'
alias stajump='ssh -J mrw24@jump.cs.st-andrews.ac.uk mrw24@mrw24.teaching.cs.st-andrews.ac.uk'
# Create an ssh tunnel to the teaching service; $1 is the remote port, $2 is the local port.
function statunnel() {
    echo "Forwarding local port $2 to remote port $1"
    ssh -J mrw24@jump.cs.st-andrews.ac.uk mrw24@mrw24.teaching.cs.st-andrews.ac.uk -L "$2":localhost:"$1" -N
}
