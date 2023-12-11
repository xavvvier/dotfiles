
function git_branch() {
	branch=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
   if [[ $branch == "" ]]; then
       echo ''
   else
       echo '('$branch') '
   fi
}

export PS1="\w\$(git_branch) \\$\[$(tput sgr0)\] "

export ERL_AFLAGS="-kernel shell_history enabled"

export HISTCONTROL=ignoreboth:erasedups

alias ..='cd ..'
alias ll='ls -laG'
alias mt='mix test'
alias mto='mix test --only only'
alias mps='mix phx.server'
alias vim='nvim'
alias e='nvim'
alias gl='git log --oneline --graph --decorate --all'

function changeMac() {
  local mac=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
  sudo ifconfig en0 ether $mac
  sudo ifconfig en0 down
  sudo ifconfig en0 up
  echo "Your new physical address is $mac"
}
# run as "changeMac" on terminal



[ -d "/usr/local/opt/asdf" ] && . /usr/local/opt/asdf/libexec/asdf.sh
[ -d "/opt/homebrew/opt/asdf" ] && . /opt/homebrew/opt/asdf/asdf.sh

export VIMINIT='let $MYVIMRC="$HOME/.vimrc" | source $MYVIMRC'
