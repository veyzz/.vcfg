#!/bin/bash

cd

# add missing dirs
mkdir -p ~/.config/nvim
mkdir -p ~/.vim/ftplugin
mkdir -p ~/.config/extrakto
mkdir -p ~/.local/share/bash-completion/completions

# configs
ln -sft ~ ~/.vcfg/.bashrc
ln -sft ~ ~/.vcfg/.inputrc
ln -sft ~ ~/.vcfg/.vimrc
ln -sft ~/.config/nvim/ ~/.vcfg/.config/nvim/init.lua
ln -sft ~ ~/.vcfg/.tmux.conf
ln -sft ~ ~/.vcfg/.tmux.conf.local
ln -sft ~/.local/share/bash-completion/completions \
  ~/.vcfg/bash-completion/completions/tmux
ln -sft ~/.vim/ftplugin ~/.vcfg/.vim/ftplugin/python.vim
ln -sft ~/.config/extrakto ~/.vcfg/.config/extrakto/extrakto.conf

# git config modifications
git config --global alias.lg "log --graph --date-order --abbrev-commit \
--date=relative --pretty=format:\
'%C(auto)%h -%d%C(reset) %s %C(cyan)(%cr) %C(bold black)<%an>%C(reset)'"
git config --global alias.dt "difftool --tool=vimdiff"
git config --global alias.mt "mergetool --tool=vimdiff"
git config --global mergetool.keepBackup false

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --bin
ln -sft ~/.fzf/shell ~/.vcfg/.fzf/shell/key-bindings.custom.bash
ln -sft ~ ~/.vcfg/.fzf.bash
