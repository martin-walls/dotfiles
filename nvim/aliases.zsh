alias v='nvim'

function vv() {
    if [ -f "Session.vim" ]; then
        # restore session
        nvim -S
    else
        # no session to restore
        nvim .
    fi
}
