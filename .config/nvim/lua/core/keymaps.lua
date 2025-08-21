local map = vim.keymap.set

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

map('n', '<Leader>zz', toggle_center_mode, {desc = 'Toggle centering mode'})

-- Tmux-like windows management
local function enter_resize_mode()
  local repeat_time = 600
  local resize_step = 2
  local keys = {'H', 'J', 'K', 'L'}

  local temp_mappings = {}
  local original_mappings = {}
  for _, key in ipairs(keys) do
    local mapping = vim.fn.maparg(key, 'n', false, true)
    if not vim.tbl_isempty(mapping) then
      original_mappings[key] = mapping
    end
  end

  local timer = nil
  local function cleanup()
    if timer then timer:stop() end

    for key, _ in pairs(temp_mappings) do
      vim.keymap.del('n', key, {buffer = true})
    end

    for key, mapping in pairs(original_mappings) do
      vim.keymap.set('n', key, mapping.rhs,
                     {noremap = mapping.noremap == 1,
                      silent = mapping.silent == 1,
                      expr = mapping.expr == 1,
                      nowait = mapping.nowait == 1,
                      desc = mapping.desc})
    end
  end

  local function resize(direction)
    if direction == 'H' then
      vim.cmd(string.format('vertical resize -%d', resize_step))
    elseif direction == 'L' then
      vim.cmd(string.format('vertical resize +%d', resize_step))
    elseif direction == 'J' then
      vim.cmd(string.format('resize +%d', resize_step))
    elseif direction == 'K' then
      vim.cmd(string.format('resize -%d', resize_step))
    end

    if timer then timer:stop() end
    timer = vim.defer_fn(cleanup, repeat_time)
  end

  for _, key in ipairs(keys) do
    temp_mappings[key] = true
    vim.keymap.set('n', key, function() resize(key) end,
                   {noremap = true, silent = true, buffer = true})
  end
end

map('n', '<C-W>', enter_resize_mode, {desc = 'Enter resize window mode'})
map('n', '<C-W>_', '<cmd>vsplit<CR>', {desc = 'Vertical split window'})
map('n', '<C-W>-', '<cmd>split<CR>', {desc = 'Split window'})
