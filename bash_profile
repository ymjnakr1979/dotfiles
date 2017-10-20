# vim: set ts=2 sts=2 sw=2 tw=0 et:

# global settings
# --------------------------------------------------------------------
# terminal
export TERM=xterm-256color

# path
export PATH=/usr/local/bin:$PATH

# export EDITOR
if [ -x '/Applications/MacVim.app/Contents/MacOS/Vim' ] ; then
  export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'
fi

# read ~/.bashrc
# ------------------------------------------------------------------
test -r ~/.bashrc && . ~/.bashrc
