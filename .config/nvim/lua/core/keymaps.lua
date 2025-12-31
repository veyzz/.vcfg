local map = vim.keymap.set

-- Auto-resize windows when tmux zoom in/out
vim.api.nvim_create_autocmd("VimResized", {
  group = vim.api.nvim_create_augroup("AutoResize", { clear = true }),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
  desc = "Auto-resize splits on terminal resize"
})

-- Toggle keeping cursor in the middle all the time
local center_mode_active = false
local original_scrolloff = 0
local center_augroup = vim.api.nvim_create_augroup('CenterMode',
                                                   { clear = true })

local function toggle_center_mode()
  center_mode_active = not center_mode_active

  if center_mode_active then
    original_scrolloff = vim.o.scrolloff
    pcall(function()
      vim.o.scrolloff = math.floor(vim.api.nvim_win_get_height(0) / 2)
    end)
    vim.cmd('normal! zz')

    vim.api.nvim_create_autocmd('VimResized', {
      group = center_augroup,
      callback = function()
        pcall(function()
          vim.o.scrolloff = math.floor(vim.api.nvim_win_get_height(0) / 2)
        end)
      end
    })
    print('Center Mode: ON')
  else
    vim.o.scrolloff = original_scrolloff
    vim.api.nvim_clear_autocmds({ group = center_augroup })
    print('Center Mode: OFF')
  end
end

map('n', '<Leader>zz', toggle_center_mode, {desc = 'Toggle centering mode'})

-- Tmux-like windows management
local function enter_resize_mode()
  local step = 2
  print("Resize Mode: [h/j/k/l]. Esc to exit.")

  while true do
    vim.cmd('redraw')
    local ok, char_code = pcall(vim.fn.getchar)
    if not ok then break end

    local char = vim.fn.nr2char(char_code)

    if char == 'h' or char == 'H' then vim.cmd('vertical resize -' .. step)
    elseif char == 'l' or char == 'L' then vim.cmd('vertical resize +' .. step)
    elseif char == 'j' or char == 'J' then vim.cmd('resize +' .. step)
    elseif char == 'k' or char == 'K' then vim.cmd('resize -' .. step)
    elseif char == '\27' or char == 'q' or char == '\r' then break
    else break end
  end

  print("Resize Mode: Ended")
end

map('n', '<Leader>wr', enter_resize_mode, {desc = 'Window Resize Mode'})
map('n', '<Leader>w=', '<C-w>=', {desc = 'Balance windows'})

map('n', '<Leader>w_', '<cmd>vsplit<CR>', {desc = 'Vertical split'})
map('n', '<Leader>w-', '<cmd>split<CR>', {desc = 'Horizontal split'})
