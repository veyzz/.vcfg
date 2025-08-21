vim.env.FZF_DEFAULT_OPTS = '--bind ' .. table.concat({
  'ctrl-y:preview-up',
  'ctrl-e:preview-down',
  'ctrl-b:preview-page-up',
  'ctrl-f:preview-page-down',
  'ctrl-u:preview-half-page-up',
  'ctrl-d:preview-half-page-down',
  'shift-up:preview-top',
  'shift-down:preview-bottom'
}, ',')

local function Ag(opts)
  local args = opts.args
  local fzf_options = {
    '--ignore=tags',
    '--ignore=cscope.out',
    '--skip-vcs-ignores',
    '--hidden'
  }

  vim.fn['fzf#vim#ag'](args, table.concat(fzf_options, ' '),
                       vim.fn['fzf#vim#with_preview'](),
                       opts.bang and 1 or 0)
end

local function ag_cword()
  local cword = vim.fn.expand('<cword>')
  vim.cmd('Ag ' .. cword)
end

vim.api.nvim_create_user_command('Ag', Ag,
                                 {bang = true,
                                  nargs = '*',
                                  desc = 'Fuzzy search with AG'})

vim.keymap.set('n', '<Leader>]', ag_cword,
               {silent = true,
                noremap = true,
                desc = 'Search current word'})
vim.keymap.set('n', '<Leader>g]', '<cmd>BTags<CR>',
               {silent = true,
                noremap = true,
                desc = 'Search buffer tags'})
