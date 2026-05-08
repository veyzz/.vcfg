vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_user_command('Symbols', vim.lsp.buf.document_symbol,
                                 {desc = 'Show all symbols in file'})

local clangd_ft = { c = true, cpp = true, objc = true, objcpp = true, cuda = true }

local function lsp_name_for_ft(ft)
  if ft == 'python' then return 'pylsp' end
  if clangd_ft[ft] then return 'clangd' end
end

vim.keymap.set('n', '<Leader>d', function()
  local ft = vim.bo.filetype
  local srv = lsp_name_for_ft(ft)
  if not srv then
    vim.notify('No LSP for filetype: ' .. ft, vim.log.levels.WARN)
    return
  end
  local bufnr = vim.api.nvim_get_current_buf()
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
    if client.name == srv then
      vim.lsp.enable(srv, false)
      return
    end
  end
  vim.lsp.enable(srv)
end, { desc = 'Toggle LSP' })
