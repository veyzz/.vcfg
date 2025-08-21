vim.g.EasyMotion_do_mapping = 0
vim.g.EasyMotion_smartcase = 1
vim.g.EasyMotion_verbose = 0

vim.keymap.set('n', '<Leader>f', '<Plug>(easymotion-overwin-f)',
               {noremap = false, silent = true,
                desc = 'EasyMotion: jump to 1 char across windows'})
vim.keymap.set('n', '<Leader>s', '<Plug>(easymotion-overwin-f2)',
               {noremap = false, silent = true,
                desc = 'EasyMotion: jump to 2 chars across windows'})
vim.keymap.set('n', '<Leader>j', '<Plug>(easymotion-j)',
               {noremap = true, silent = true,
                desc = 'EasyMotion: jump to line below'})
vim.keymap.set('n', '<Leader>k', '<Plug>(easymotion-k)',
               {noremap = true, silent = true,
                desc = 'EasyMotion: jump to line above'})
vim.keymap.set('n', '<Leader>h', '<Plug>(easymotion-linebackward)',
               {noremap = true, silent = true,
                desc = 'EasyMotion: edge of word linebackward'})
vim.keymap.set('n', '<Leader>l', '<Plug>(easymotion-lineforward)',
               {noremap = true, silent = true,
                desc = 'EasyMotion: edge of word lineforward '})
