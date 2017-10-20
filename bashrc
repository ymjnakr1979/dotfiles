# vim: set ts=2 sts=2 sw=2 tw=0 et:

SetSettingsByPlatform() {
  local readonly platform_name="$(uname -s)"
  if [ ${platform_name} = 'Darwin' ] ; then
    # echo 'loading "Darwin" settings ...'

    # vim
    # ------------------------------------------------------------------
    if [ -x '/Applications/MacVim.app/Contents/MacOS/Vim' ] ; then
      alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
      alias vi=vim
    fi

    # bash-completion
    # ------------------------------------------------------------------
    if [ -f $(brew --prefix)/etc/bash_completion ] ; then
      . $(brew --prefix)/etc/bash_completion
    fi

    # git-completion
    # ------------------------------------------------------------------
    if [ -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh ] ; then
      export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '
      source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
      GIT_PS1_SHOWDIRTYSTATE=true
    fi

    if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ] ; then
      source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
    fi
  #elif [ "$(expr substr ${platform_name} 1 10)" == 'MINGW32_NT' ] ; then
  #  # echo 'loading "MINGW32_NT" settings ...'
  #elif [ "$(expr substr ${platform_name} 1 10)" == 'MINGW64_NT' ] ; then
  #  # echo 'loading "MINGW64_NT" settings ...'
fi
}
SetSettingsByPlatform

# read other settings
# --------------------------------------------------------------------
ReadOtherSettings() {
  local readonly bash_d_path="${HOME}/.bash.d"
  if [ -d "${bash_d_path}" ] ; then
    local readonly files="${bash_d_path}/*.sh"
    for file in ${files} ; do
      test -r "${file}" && . "${file}"
    done
  fi
}
ReadOtherSettings
