#!/bin/bash

cd
mkdir -p ~/.vim/ftplugin
mkdir -p ~/.config/extrakto

# configs
ln -sft ~ ~/.vcfg/.bashrc
ln -sft ~ ~/.vcfg/.vimrc
ln -sft ~ ~/.vcfg/.tmux.conf
ln -sft ~ ~/.vcfg/.tmux.conf.local
ln -sft ~/.vim/ftplugin ~/.vcfg/.vim/ftplugin/python.vim
ln -sft ~/.config/extrakto ~/.vcfg/.config/extrakto/extrakto.conf

# git config modifications
git config --global alias.lg "log --graph --date-order --abbrev-commit --date=relative \
  --pretty=format:'%C(auto)%h -%d%C(reset) %s %C(cyan)(%cr) %C(bold black)<%an>%C(reset)'"

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc

