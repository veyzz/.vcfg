#!/bin/bash

cd

# add dirs
mkdir -p ~/.vim/ftplugin
mkdir -p ~/.config/nvim/lua/core
mkdir -p ~/.config/nvim/lua/plugins
mkdir -p ~/.local/share/bash-completion/completions
mkdir -p ~/.fzf/shell
mkdir -p ~/.config/extrakto
mkdir -p ~/.config/lazygit

# bash
ln -sft ~ ~/.vcfg/.bashrc
ln -sft ~ ~/.vcfg/.inputrc

# vim
ln -sft ~ ~/.vcfg/.vimrc
ln -sft ~/.vim/ftplugin ~/.vcfg/.vim/ftplugin/python.vim

# nvim
ln -sft ~/.config/nvim/ ~/.vcfg/.config/nvim/init.lua
ln -sft ~/.config/nvim/ ~/.vcfg/.config/nvim/lazy-lock.json
ln -sft ~/.config/nvim/lua/core/ ~/.vcfg/.config/nvim/lua/core/options.lua
ln -sft ~/.config/nvim/lua/core/ ~/.vcfg/.config/nvim/lua/core/commands.lua
ln -sft ~/.config/nvim/lua/core/ ~/.vcfg/.config/nvim/lua/core/autocmds.lua
ln -sft ~/.config/nvim/lua/core/ ~/.vcfg/.config/nvim/lua/core/keymaps.lua
ln -sft ~/.config/nvim/lua/core/ ~/.vcfg/.config/nvim/lua/core/colors.lua
ln -sft ~/.config/nvim/lua/plugins/ ~/.vcfg/.config/nvim/lua/plugins/init.lua

# nvim plugins
ln -sft ~/.config/nvim/lua/plugins/ \
  ~/.vcfg/.config/nvim/lua/plugins/monokai.lua
ln -sft ~/.config/nvim/lua/plugins/ \
  ~/.vcfg/.config/nvim/lua/plugins/lualine.lua
ln -sft ~/.config/nvim/lua/plugins/ \
  ~/.vcfg/.config/nvim/lua/plugins/vim-easymotion.lua
ln -sft ~/.config/nvim/lua/plugins/ \
  ~/.vcfg/.config/nvim/lua/plugins/vim-tmux-navigator.lua
ln -sft ~/.config/nvim/lua/plugins/ \
  ~/.vcfg/.config/nvim/lua/plugins/fzf.lua
ln -sft ~/.config/nvim/lua/plugins/ \
  ~/.vcfg/.config/nvim/lua/plugins/nerdtree.lua
ln -sft ~/.config/nvim/lua/plugins/ \
  ~/.vcfg/.config/nvim/lua/plugins/nvim-lspconfig.lua
ln -sft ~/.config/nvim/lua/plugins/ \
  ~/.vcfg/.config/nvim/lua/plugins/gen.lua

# tmux
ln -sft ~ ~/.vcfg/.tmux.conf
ln -sft ~ ~/.vcfg/.tmux.conf.local

# fzf
ln -sft ~/.local/share/bash-completion/completions \
  ~/.vcfg/bash-completion/completions/tmux
ln -sft ~ ~/.vcfg/.fzf.bash
ln -sft ~/.fzf/shell ~/.vcfg/.fzf/shell/completion.bash
ln -sft ~/.fzf/shell ~/.vcfg/.fzf/shell/key-bindings.custom.bash

# extrakto
ln -sft ~/.config/extrakto ~/.vcfg/.config/extrakto/extrakto.conf

# lazygit
ln -sft ~/.config/lazygit ~/.vcfg/.config/lazygit/config.yml

# git
git config --global alias.lg "log --graph --date-order --abbrev-commit \
--date=relative --pretty=format:\
'%C(auto)%h -%d%C(reset) %s %C(cyan)(%cr) %C(bold black)<%an>%C(reset)'"
git config --global alias.dt "difftool --tool=nvimdiff"
git config --global alias.mt "mergetool"
git config --global merge.tool nvimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.keepBackup false
