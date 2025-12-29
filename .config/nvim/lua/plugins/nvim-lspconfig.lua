vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_user_command('Symbols', vim.lsp.buf.document_symbol,
                                 {desc = 'Show all symbols in file'})

vim.keymap.set('n', '<Leader>d', function()
  if not vim.lsp.buf_is_attached() then
    --vim.cmd.LspStart()
    vim.lsp.enable('clangd')
    --vim.lsp.enable('pylsp')
  else
    vim.lsp.enable('clangd', false)
    --vim.lsp.enable('pylsp', false)
    --vim.diagnostic.enable(not vim.diagnostic.is_enabled())
  end
end, {desc = 'Start LSP on first running and toggle diagnostic'})
