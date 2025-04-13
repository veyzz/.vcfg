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

-- Leader
vim.g.mapleader = ' '

-- Attach system clipboard
vim.opt.clipboard:append({'unnamed', 'unnamedplus'})

-- Plugins
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
  {'tmux-plugins/vim-tmux-focus-events'},
  {'roxma/vim-tmux-clipboard'},
  {'christoomey/vim-tmux-navigator'},
  {'tpope/vim-fugitive'},
  {'nvim-telescope/telescope.nvim', dependencies = {'nvim-lua/plenary.nvim'}},
})

-- Main theme
vim.opt.termguicolors = true
vim.opt.background = 'dark'
local custom_palette = {
  name = 'sublime',
  base0 = '#191515',
  base1 = '#211c1c',
  base2 = '#1c1c1c', -- background
  base3 = '#303030', -- borders
  base4 = '#3a3a3a', -- visual
  base5 = '#72696a',
  base6 = '#8f908a', -- comments
  base7 = '#c3b7b8',
  base8 = '#fff1f3',
  border = '#a1b5b1',
  brown = '#352e2e',
  white = '#e8e8e3',
  grey = '#8f908a',
  black = '#272822',
  pink = '#f92772',
  green = '#a6e22d',
  aqua = '#66d9ef',
  yellow = '#e6db74',
  orange = '#fd9720',
  purple = '#ae81ff',
  red = '#e73c50',
  diff_add = '#5f875f',
  diff_add_fg = '#d7ffaf',
  diff_remove = '#f75f5f',
  diff_remove_fg = '#272822',
  diff_change = '#5f5f87',
  diff_change_fg = '#d7d7ff',
  diff_text = '#66d9ef',
  diff_text_fg = '#272822',
}
local custom_hlgroups = {
  DiffAdd = {
    bg = custom_palette.diff_add,
    fg = custom_palette.diff_add_fg,
  },
  DiffDelete = {
    bg = custom_palette.diff_remove,
    fg = custom_palette.diff_remove_fg,
  },
  DiffChange = {
    bg = custom_palette.diff_change,
    fg = custom_palette.diff_change_fg,
  },
  DiffText = {
    bg = custom_palette.diff_text,
    fg = custom_palette.diff_text_fg,
  },
}
require('monokai').setup {
  palette = custom_palette,
  custom_hlgroups = custom_hlgroups,
  italics = false,
}

-- Status bar
local custom_powerline_dark = require('lualine.themes.powerline_dark')
custom_powerline_dark.normal.c.bg = custom_palette.base2
require('lualine').setup {
  options = {
    theme = custom_powerline_dark,
    icons_enabled = false,
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {{'filename', path = 1, newfile_status = true}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{'filename', path = 1, newfile_status = true}},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- Toggle relative and absolute line numbers
local numbertoggle = vim.api.nvim_create_augroup('numbertoggle',
                                                 {clear = true})
vim.api.nvim_create_autocmd({'BufEnter', 'FocusGained', 'InsertLeave',
                             'WinEnter'}, {
  group = numbertoggle,
  callback = function ()
    if vim.opt.nu:get() and vim.fn.mode() ~= 'i' then
      vim.opt.relativenumber = true
    end
  end
})
vim.api.nvim_create_autocmd({'BufLeave', 'FocusLost', 'InsertEnter',
                             'WinLeave'}, {
  group = numbertoggle,
  callback = function()
    if vim.opt.nu:get() then
      vim.opt.relativenumber = false
    end
  end
})

-- .h is c-file, not cpp
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
  pattern = {'*.h', '*.c'},
  callback = function()
    vim.bo.filetype = 'c'
  end
})

-- Swap C-j and C-m
vim.keymap.set('i', '<C-j>', '<CR>')
vim.keymap.set('i', '<C-m>', '<NL>')

-- Tmux-like windows management
vim.api.nvim_set_keymap('n', '<C-W>_', ':vsplit<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-W>-', ':split<CR>',
                        {noremap = true, silent = true})

-- Easymotion
vim.g.EasyMotion_do_mapping = 0
vim.g.EasyMotion_smartcase = 1
vim.g.EasyMotion_verbose = 0

local map = vim.keymap.set
map('n', '<Leader>f', '<Plug>(easymotion-overwin-f)')
map('n', '<Leader>s', '<Plug>(easymotion-overwin-f2)')
map('n', '<Leader>j', '<Plug>(easymotion-j)')
map('n', '<Leader>k', '<Plug>(easymotion-k)')
map('n', '<Leader>h', '<Plug>(easymotion-linebackward)')
map('n', '<Leader>l', '<Plug>(easymotion-lineforward)')

-- Telescope (замена FZF)
local telescope = require('telescope.builtin')
map('n', '<Leader>]', function()
  require('telescope.builtin').grep_string({
    additional_args = '--ignore=tags --ignore=cscope.out'
  })
end)
map('n', '<Leader>g]', telescope.current_buffer_tags)

-- Toggle keeping cursor in the middle all the time
local center_mode = false
local original_scrolloff = vim.o.scrolloff
local augroup = vim.api.nvim_create_augroup('CenterMode', {})

local function toggle_center_mode()
    center_mode = not center_mode
    if center_mode then
        vim.o.scrolloff = math.floor(vim.fn.winheight(0) / 2)
        vim.cmd('normal! zz')
        vim.api.nvim_create_autocmd('VimResized', {
            group = augroup,
            callback = function()
                vim.o.scrolloff = math.floor(vim.fn.winheight(0) / 2)
            end
        })
        print('Centering cursor: on')
    else
        vim.o.scrolloff = original_scrolloff
        vim.api.nvim_clear_autocmds({group = augroup})
        print('Centering cursor: off')
    end
end

vim.keymap.set('n', '<Leader>zz', toggle_center_mode,
               {silent = true, desc = 'toggle centering mode'})

-- Markdown
vim.g.markdown_folding = 1
vim.g.vim_markdown_conceal = 1
vim.api.nvim_create_user_command('Glow', 'vert term glow %', {})
