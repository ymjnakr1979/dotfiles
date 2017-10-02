# vim: set ts=2 sts=2 sw=2 tw=0 et:

readonly platform_name="$(uname -s)"
if [ ${platform_name} = 'Darwin' ] ; then
  # echo 'loading "Darwin" settings ...'

  # bash-completion
  # ------------------------------------------------------------------
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

  # git-completion
  # ------------------------------------------------------------------
  if [ -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh ]; then
    source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
    GIT_PS1_SHOWDIRTYSTATE=true
  fi

  if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
    source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
  fi
# elif [ "$(expr substr ${platform_name} 1 10)" == 'MINGW32_NT' ] ; then
#  # echo 'loading "MINGW32_NT" settings ...'
#elif [ "$(expr substr ${platform_name} 1 10)" == 'MINGW64_NT' ] ; then
#  # echo 'loading "MINGW64_NT" settings ...'
fi

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
