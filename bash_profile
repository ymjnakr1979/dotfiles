# --------------------------------------------------------------------
# terminal
# --------------------------------------------------------------------
export TERM=xterm-256color

readonly kPlatform="$(uname -s)"
if [ ${kPlatform} = 'Darwin' ] ; then
  # echo 'loading "Darwin" settings ...'

  # ------------------------------------------------------------------
  # path
  # ------------------------------------------------------------------
  if [ -d '/Applications/MacVim.app/Contents/MacOS' ] ; then
    export PATH=/Applications/MacVim.app/Contents/MacOS:/usr/local/bin:${PATH}
  else
    export PATH=/usr/local/bin:$PATH
  fi

  # ------------------------------------------------------------------
  # bash-completion
  # ------------------------------------------------------------------
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

  # ------------------------------------------------------------------
  # git-completion
  # ------------------------------------------------------------------
  if [ -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh ]; then
    source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
    GIT_PS1_SHOWDIRTYSTATE=true
    export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '
  fi

  if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
    source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
  fi
# elif [ "$(expr substr ${kPlatform} 1 10)" == 'MINGW32_NT' ] ; then
  # echo 'loading "MINGW32_NT" settings ...'
#elif [ "$(expr substr ${kPlatform} 1 10)" == 'MINGW64_NT' ] ; then
#  # echo 'loading "MINGW64_NT" settings ...'
fi

# --------------------------------------------------------------------
# others
# --------------------------------------------------------------------
readonly bash_d_path="${HOME}/.bash.d"
if [ -d "${bash_d_path}" ] ; then
  files="${bash_d_path}/*.sh"
  for file in ${files} ; do
    if [ -f "${file}" ] ; then
      # echo "loading \"${file}\" ..."
      . "${file}"
    fi
  done
fi

# echo 'done.'

# --------------------------------------------------------------------
# vim: set ts=2 sts=2 sw=2 tw=0 et:
