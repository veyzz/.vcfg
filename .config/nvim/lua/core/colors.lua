local M = {}

M.palette = {
  name = 'sublime',
  base0 = '#191515',
  base1 = '#211c1c',
  base2 = '#1c1c1c',
  base3 = '#303030',
  base4 = '#3a3a3a',
  base5 = '#72696a',
  base6 = '#8f908a',
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

M.hlgroups = {
  DiffAdd = {
    bg = M.palette.diff_add,
    fg = M.palette.diff_add_fg,
  },
  DiffDelete = {
    bg = M.palette.diff_remove,
    fg = M.palette.diff_remove_fg,
  },
  DiffChange = {
    bg = M.palette.diff_change,
    fg = M.palette.diff_change_fg,
  },
  DiffText = {
    bg = M.palette.diff_text,
    fg = M.palette.diff_text_fg,
  },
}

return M
