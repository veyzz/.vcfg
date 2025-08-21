local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {'tanvirtin/monokai.nvim'},
  {'nvim-lualine/lualine.nvim'},
  {'jiangmiao/auto-pairs'},
  {'easymotion/vim-easymotion'},
  {'tpope/vim-abolish'},
  {'roxma/vim-tmux-clipboard'},
  {'christoomey/vim-tmux-navigator'},
  {'tpope/vim-fugitive'},
  {'junegunn/fzf.vim', dependencies = {'junegunn/fzf'}},
  {'preservim/nerdtree'},
  {'neovim/nvim-lspconfig'},
  {'akinsho/git-conflict.nvim', version = "*", config = true},
  {'lewis6991/gitsigns.nvim'},
  {'kdheepak/lazygit.nvim'},
  {'David-Kunz/gen.nvim'},
  {'nvim-telescope/telescope.nvim', tag = '0.1.8',
   dependencies = {'nvim-lua/plenary.nvim'}},
  --{'nvim-telescope/telescope-ui-select.nvim'},
})

require('plugins.monokai')
require('plugins.lualine')
require('plugins.vim-easymotion')
require('plugins.vim-tmux-navigator')
require('plugins.fzf')
require('plugins.nerdtree')
require('plugins.nvim-lspconfig')
require('plugins.gen')
