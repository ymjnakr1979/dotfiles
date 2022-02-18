# vim: set ts=2 sts=2 sw=2 tw=0 et:
#

export PATH=$HOME/.rbenv/shims:$PATH

if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

if [ -e $(brew --prefix)/share/zsh/site-functions ]; then
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi

autoload -U compinit
compinit -u

autoload -U promptinit; promptinit
prompt pure

# alias
#
if [ -x '/usr/local/bin/nvim' ]; then
  alias vi=nvim
fi
