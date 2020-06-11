# vim: set ts=2 sts=2 sw=2 tw=0 et:
#

PROMPT='%F{green}%n@%m%f %F{blue}%~%f
$ '

if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

if [ -e $(brew --prefix)/share/zsh/site-functions ]; then
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi

if [ -r "/usr/local/opt/zsh-git-prompt/zshrc.sh" ]; then
  source "/usr/local/opt/zsh-git-prompt/zshrc.sh"
  ZSH_THEME_GIT_PROMPT_PREFIX="["
  ZSH_THEME_GIT_PROMPT_SUFFIX=" ]"
  ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[white]%}"
  ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{ %G%}"
  ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[magenta]%}%{x%G%}"
  ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[red]%}%{+%G%}"
  ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[red]%}%{-%G%}"
  ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[green]%}%{+%G%}"
  ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}%{✔%G%}"
  RPROMPT='$(git_super_status)'
fi

autoload -U compinit
compinit -u

# alias
#
if [ -x '/Applications/MacVim.app/Contents/MacOS/Vim' ]; then
  alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
  alias vi=vim
fi
