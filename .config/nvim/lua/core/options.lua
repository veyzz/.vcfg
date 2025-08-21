-- Leader
vim.g.mapleader = ' '

-- Basic settings
vim.opt.mouse = ''
vim.opt.encoding = 'utf-8'
vim.opt.compatible = false
vim.opt.cmdheight = 1
vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.colorcolumn = '79'
vim.opt.ttimeoutlen = 10

-- Attach system clipboard
vim.opt.clipboard:append({'unnamed', 'unnamedplus'})

-- Theme
vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- Markdown
vim.g.markdown_folding = 1
vim.g.vim_markdown_conceal = 1
