# path
export PATH=/usr/local/bin:$PATH

# terminal
export TERM=xterm-256color

# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# git-completion
if [ -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh ]; then
  source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=true
  export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '
fi

if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
  source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

# alias
alias vi=vim

# other settings
readonly bash_d_path="${HOME}/.bash.d"
if [ -d "${bash_d_path}" ] ; then
  files="${bash_d_path}/*.sh"
  for file in ${files} ; do
    . "${file}"
  done
fi
