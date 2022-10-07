# General aliases

alias rm='rmtrash'
alias rmdir='rmdirtrash'

# allow using sudo with aliases
alias sudo='sudo '

# paste screenshot to file
clip2png () {
  filename="$(date +%Y.%m.%d.%T).png"
  if [ $# -ge 1 ]; then
    filename=$1
  fi
  wl-paste -t image/png > $filename
}
