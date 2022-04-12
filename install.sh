#!/bin/bash

cd
mkdir -p ~/.vim/ftplugin

ln -sft ~ ~/.vcfg/.bashrc
ln -sft ~ ~/.vcfg/.vimrc
ln -sft ~ ~/.vcfg/.tmux.conf
ln -sft ~ ~/.vcfg/.tmux.conf.local
ln -sft ~/.vim/ftplugin ~/.vcfg/.vim/ftplugin/python.vim

# git config modifications
git config --global alias.lg "log --graph --date-order --abbrev-commit --date=relative \
  --pretty=format:'%C(auto)%h -%d%C(reset) %s %C(cyan)(%cr) %C(bold black)<%an>%C(reset)'"

