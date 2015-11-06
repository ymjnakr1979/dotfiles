#!/bin/sh

readonly backupDir="${HOME}/_dotfiles_bak"

# backup
if [ -d ${backupDir} ]; then
  echo "\"${backupDir}\"\nis already exists."
  exit 1
fi
mkdir -p "${backupDir}"
mv ~/.bash_profile ${backupDir}/_bash_profile_bak
mv ~/.vimrc ${backupDir}/_vimrc_bak
mv ~/.gvimrc ${backupDir}/_gvimrc_bak
mv ~/.vim ${backupDir}/_vim_bak

# copy dotfiles
cp .bash_profile ~/
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/bundle
cp ../.vimrc ~/
cp ../.gvimrc ~/

# create symbolic link
if [ -d "${HOME}/Library/Application Support/Karabiner" ]; then
  ln -s -f "${HOME}/dotfiles/mac/karabiner/private.xml" "${HOME}/Library/Application Support/Karabiner/private.xml"
fi

# clone NeoBundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
