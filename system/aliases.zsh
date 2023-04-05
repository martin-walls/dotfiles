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
