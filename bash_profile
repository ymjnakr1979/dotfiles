# vim: set ts=2 sts=2 sw=2 tw=0 et:

# global settings
# --------------------------------------------------------------------
# terminal
export TERM=xterm-256color

# path
export PATH=/usr/local/bin:$PATH

# git-completion
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '

# export EDITOR
if [ "$(uname -s)" = 'Darwin' ] ; then
  if [ -x '/Applications/MacVim.app/Contents/MacOS/Vim' ] ; then
    export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'
  fi
fi

# read ~/.bashrc
# ------------------------------------------------------------------
test -r ~/.bashrc && . ~/.bashrc
