vim.api.nvim_create_autocmd({'StdinReadPre', 'VimEnter'}, {
  pattern = '*',
  callback = function(args)
    if args.event == 'StdinReadPre' then
      vim.g.std_in = 1
      return
    end

    if vim.fn.argc() == 0 and not vim.g.std_in then
      vim.cmd.NERDTree()
    end
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'nerdtree',
  callback = function()
    vim.keymap.del('n', '<C-j>', {buffer = true})
    vim.keymap.del('n', '<C-k>', {buffer = true})
  end
})

vim.keymap.set('n', '<Leader>n', '<cmd>NERDTreeFocus<CR>',
               {noremap = true, silent = true, desc = 'Focus NERDTree'})
