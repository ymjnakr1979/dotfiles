# vim: set ts=2 sts=2 sw=2 tw=0 et:

# terminal
# --------------------------------------------------------------------
export TERM=xterm-256color

# path
# ------------------------------------------------------------------
if [ -d '/Applications/MacVim.app/Contents/MacOS' ] ; then
  export PATH=/Applications/MacVim.app/Contents/MacOS:/usr/local/bin:$PATH
else
  export PATH=/usr/local/bin:$PATH
fi

# git-completion
# ------------------------------------------------------------------
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '

# read ~/.bashrc
# ------------------------------------------------------------------
test -r ~/.bashrc && . ~/.bashrc
