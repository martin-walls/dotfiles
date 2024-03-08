alias v23='nvim'

function vv() {
    if [ -f "Session.vim" ]; then
        # restore session
        NVIM_APPNAME="nvim-2024" nvim -S
    else
        # no session to restore
        NVIM_APPNAME="nvim-2024" nvim .
    fi
}

alias v='NVIM_APPNAME="nvim-2024" nvim'
