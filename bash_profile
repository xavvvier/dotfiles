_osName="$(uname)"
_machineName="$(hostname)"
_localMachine="xmbp.local"

if [[ $_machineName == $_localMachine ]]; then
    export PS1="[\W] 🍁  $ "
    alias ll='ls -lGaf'
else
    export PS1="[\W] ☁️  $ "
fi

alias conaws='cd ~/Develop/aws/ && ssh -i "ket_pair_aws.pem" ubuntu@52.91.195.76'
alias ..='cd ..'
