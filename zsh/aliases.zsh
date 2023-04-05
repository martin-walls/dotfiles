# General aliases

if [ -f "/usr/local/bin/rmtrash" ]; then
    alias rm='rmtrash'
fi
if [ -f "/usr/local/bin/rmdirtrash" ]; then
    alias rmdir='rmdirtrash'
fi

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

find-rpi-ip () {
    sudo nmap -sP 192.168.1.0/24 | awk '/^Nmap/{ip=$NF}/B8:27:EB/{print ip}'
}
