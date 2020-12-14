#!/bin/bash

cd
mkdir -p ~/.config/ranger

ln -sft ~ ~/.vcfg/.bashrc
ln -sft ~ ~/.vcfg/.vimrc
ln -sft ~ ~/.vcfg/.tmux.conf
ln -sft ~ ~/.vcfg/.tmux.conf.local
ln -sft ~/.config/ranger ~/.vcfg/.config/ranger/commands.py
ln -sft ~/.config/ranger ~/.vcfg/.config/ranger/commands_full.py
ln -sft ~/.config/ranger ~/.vcfg/.config/ranger/rc.conf
ln -sft ~/.config/ranger ~/.vcfg/.config/ranger/rifle.conf
ln -sft ~/.config/ranger ~/.vcfg/.config/ranger/scope.sh

