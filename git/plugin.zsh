# source forgit plugin

# disable default aliases; added the aliases I use in ./aliases.zsh
export FORGIT_NO_ALIASES=1
export FORGIT_LOG_FORMAT="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"
# add forgit to path so I can manually set aliases
export PATH="$PATH:$HOME/.dotfiles/git/forgit/bin"
source ~/.dotfiles/git/forgit/forgit.plugin.zsh
