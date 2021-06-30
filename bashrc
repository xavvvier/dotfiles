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
alias mt='mix test'
alias mto='mix test --only only'
alias mps='mix phx.server'
alias e='nvim'
alias badchrome='/Users/jgonzalez/Downloads/chrome-mac/Chromium79.app/Contents/MacOS/Chromium --no-first-run --activate-on-launch --no-default-browser-check --allow-file-access-from-files --disable-web-security --disable-translate --proxy-auto-detect --proxy-bypass-list=127.0.0.1 --enable-blink-features=ShadowDOMV0 --enable-blink-features=CustomElementsV0 --user-data-dir=/tmp/dir'

function changeMac() {
  local mac=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
  sudo ifconfig en0 ether $mac
  sudo ifconfig en0 down
  sudo ifconfig en0 up
  echo "Your new physical address is $mac"
}
# run as "changeMac" on terminal


# ANDROID paths
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/opt/webOS_TV_SDK/CLI/bin
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
    PATH=$PATH:~/code/chromium/depot_tools
fi


export TIZEN_TOOLS=/Users/jgonzalez/tizen-studio/tools/
export TIZEN_PATH=/Users/jgonzalez/tizen-studio/tools/ide/bin
export PATH=$PATH:$TIZEN_TOOLS
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$TIZEN_PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
