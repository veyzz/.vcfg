local group = vim.api.nvim_create_augroup('MyAutoCmds', {clear = true})

-- Toggle relative and absolute line numbers
vim.api.nvim_create_autocmd({'BufEnter', 'FocusGained',
                             'InsertLeave', 'WinEnter'}, {
  group = group,
  callback = function()
    if vim.opt.nu:get() and vim.fn.mode() ~= 'i' then
      vim.opt.relativenumber = true
    end
  end
})

vim.api.nvim_create_autocmd({'BufLeave', 'FocusLost',
                             'InsertEnter', 'WinLeave'}, {
  group = group,
  callback = function()
    if vim.opt.nu:get() then
      vim.opt.relativenumber = false
    end
  end
})

-- .h is c-file, not cpp
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
  group = group,
  pattern = {'*.h', '*.c'},
  callback = function()
    vim.bo.filetype = 'c'
  end
})
