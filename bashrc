_osName="$(uname)"
_machineName="$(hostname)"
_localMachine="xmbp.local"

git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

export PS1="\[$(tput bold)\]\[\033[38;5;34m\]\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \W\$(git_branch) \\$ \[$(tput sgr0)\]"

export ERL_AFLAGS="-kernel shell_history enabled"

alias ..='cd ..'
alias ll='ls -laG'

function changeMac() {
  local mac=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
  sudo ifconfig en0 ether $mac
  sudo ifconfig en0 down
  sudo ifconfig en0 up
  echo "Your new physical address is $mac"
}
# run as "changeMac" on terminal
