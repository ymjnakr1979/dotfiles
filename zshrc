# vim: set ts=2 sts=2 sw=2 tw=0 et:
#

PROMPT='%F{green}%n@%m%f %F{blue}%~%f
$ '

if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
  autoload -U compinit
  compinit -u
fi

# alias
#
if [ -x '/Applications/MacVim.app/Contents/MacOS/Vim' ]; then
  alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
  alias vi=vim
fi
