_osName="$(uname)"
_machineName="$(hostname)"
_localMachine="xmbp.local"

if [[ $_machineName == $_localMachine ]]; then
    export PS1="[\W] 🍁  $ "
else
    export PS1="[\W] ☁️  $ "
fi

alias ..='cd ..'
alias ll='ls -laG'
alias conaws='ssh -i ~/Develop/aws/ket_pair_aws.pem ubuntu@ec2_52_21_185_118.compute-1.amazonaws.com'
alias emacs='emacs -nw'
