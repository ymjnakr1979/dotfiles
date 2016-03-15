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
cp ../.bash_profile ~/
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/undo
#mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/dein
cp ../.vimrc ~/
cp ../.gvimrc ~/

# clone NeoBundle
#git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# install dein.vim
cd ~/.vim/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh .
