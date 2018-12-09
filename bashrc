_osName="$(uname)"
_machineName="$(hostname)"
_localMachine="xmbp.local"

git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1] / '
}

if [[ $_machineName == $_localMachine ]]; then
    export PS1="\[$(tput bold)\]\[\033[38;5;15m\]\h$(tput sgr0)\] @ \[\033[32m\]\w\[\033[33m\]\$(git_branch)\[\033[00m\]\$ " 
else
    export PS1="\[$(tput bold)\]\[\033[38;5;28m\]\u:\H\[$(tput sgr0)\] @ \[\033[32m\]\w\[\033[33m\]\n\$(git_branch)\[\033[00m\]\$ " 
fi

alias ..='cd ..'
alias ll='ls -laG'
