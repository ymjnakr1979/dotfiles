# vim: set ts=2 sts=2 sw=2 tw=0 et:
#

export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

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
