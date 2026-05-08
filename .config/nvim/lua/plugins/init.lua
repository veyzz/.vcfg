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
  { 'tanvirtin/monokai.nvim', priority = 1000,
    config = function() require('plugins.monokai') end },
  { 'nvim-lualine/lualine.nvim', dependencies = {'tanvirtin/monokai.nvim'},
    config = function() require('plugins.lualine') end },
  {'jiangmiao/auto-pairs'},
  { 'easymotion/vim-easymotion', config = function() require('plugins.vim-easymotion') end },
  {'tpope/vim-abolish'},
  {'roxma/vim-tmux-clipboard'},
  { 'christoomey/vim-tmux-navigator',
    config = function() require('plugins.vim-tmux-navigator') end },
  {'tpope/vim-fugitive'},
  { 'junegunn/fzf.vim', dependencies = {'junegunn/fzf'},
    config = function() require('plugins.fzf') end },
  { 'preservim/nerdtree', config = function() require('plugins.nerdtree') end },
  { 'neovim/nvim-lspconfig', config = function() require('plugins.nvim-lspconfig') end },
  {'akinsho/git-conflict.nvim', version = '*', config = true},
  {'lewis6991/gitsigns.nvim'},
  {'kdheepak/lazygit.nvim'},
  { 'hrsh7th/nvim-cmp', dependencies = { 'hrsh7th/cmp-nvim-lsp',
                                         'hrsh7th/cmp-buffer',
                                         'hrsh7th/cmp-path',
                                         'L3MON4D3/LuaSnip',
                                         'saadparwaiz1/cmp_luasnip',
                                       },
    config = function() require('plugins.nvim-cmp') end },
})
