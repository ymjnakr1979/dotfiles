# vim: set ts=2 sts=2 sw=2 tw=0 et:

# global settings
#
export TERM=xterm-256color

if [ -x '/usr/local/bin/nvim' ] ; then
  export EDITOR='/usr/local/bin/nvim'
fi

if [ -x '/opt/homebrew/bin/nvim' ]; then
  export EDITOR='/opt/homebrew/bin/nvim'
fi
