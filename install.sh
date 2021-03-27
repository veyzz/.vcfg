#!/bin/bash

cd
mkdir -p ~/.vim/ftplugin

ln -sft ~ ~/.vcfg/.bashrc
ln -sft ~ ~/.vcfg/.vimrc
ln -sft ~ ~/.vcfg/.tmux.conf
ln -sft ~ ~/.vcfg/.tmux.conf.local
ln -sft ~/.vim/ftplugin ~/.vcfg/.vim/ftplugin/python.vim

