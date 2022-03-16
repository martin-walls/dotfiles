# set up ssh-agent
# makes sure there is one shared instance of ssh-agent between all shells
# kills the agent when the last shell is exited
SSH_ENV="$HOME/.ssh/agent.env"
# add ssh identities that should be added to agent automatically here
ssh_identities=( "$HOME/.ssh/id_ed25519" )

start_ssh_agent () {
    echo "Initialising new SSH agent..."
    touch $SSH_ENV
    chmod 600 "${SSH_ENV}"
    ssh-agent | sed 's/^echo/#echo/' >> "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    ssh-add "${ssh_identities[@]}"
}

kill_ssh_agent () {
    zsh_count=$(pgrep -c zsh)
    if [ $zsh_count -gt 2 ]; then
        # don't kill agent when there's still a bash shell running;
        # because this function is executed from inside a zsh shell,
        # 2 zsh processes will be found when the last real zsh shell is exited
        true
    else
        # kill agent since this is the last zsh shell
        eval $(ssh-agent -k)
        rm "${SSH_ENV}"
    fi
}

# source SSH settings if applicable
ssh-init () {
    if [ -f "${SSH_ENV}" ]; then
        . "${SSH_ENV}" > /dev/null
        kill -0 $SSH_AGENT_PID 2>/dev/null || {
            start_ssh_agent
        }
    else
        start_ssh_agent
    fi
}

trap kill_ssh_agent EXIT
