#!/bin/sh

readonly script_dir=`cd \`dirname "$0"\`; pwd`
readonly backup_dir="${HOME}/dotfiles_bak_`date '+%Y%m%d_%H%M%S'`"

# backup
if [ -d "${backup_dir}" ]; then
  echo "\"${backup_dir}\"\nis already exists."
  exit 1
fi
mkdir -p "${backup_dir}"
mv "${HOME}/.bash_profile" "${backup_dir}/_bash_profile_bak"
mv "${HOME}/.bashrc" "${backup_dir}/_bashrc_bak"
mv "${HOME}/.vim" "${backup_dir}/_vim_bak"

# copy dotfiles
mkdir -p "${HOME}/.vim/swap"
mkdir -p "${HOME}/.vim/backup"
mkdir -p "${HOME}/.vim/undo"
mkdir -p "${HOME}/.vim/plugged"
mkdir -p "${HOME}/.vim/autoload"

# create symbolic link
ln -fs "${script_dir}/bash_profile" "${HOME}/.bash_profile"
ln -fs "${script_dir}/bashrc" "${HOME}/.bashrc"
ln -fs "${script_dir}/vimrc" "${HOME}/.vimrc"
ln -fs "${script_dir}/gvimrc" "${HOME}/.gvimrc"

# install vim-plug
curl -fLo "${HOME}/.vim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# start vim and install plugins
vim -c PlugInstall -c q -c q
