local one_dark = {
  foreground = '#abb2bf',
  background = '#282C34',
  cursor_bg = '#d0d0d0',
  cursor_border = '#d0d0d0',
  cursor_fg = '#151515',
  selection_bg = '#444444',
  selection_fg = '#c5c8c6',
  ansi = {
    '#1e2127',
    '#e06c75',
    '#98c379',
    '#d19a66',
    '#61afef',
    '#c678dd',
    '#56b6c2',
    '#abb2bf',
  },

  brights = {
    '#5c6370',
    '#e06c75',
    '#98c379',
    '#d19a66',
    '#61afef',
    '#c678dd',
    '#56b6c2',
    '#ffffff',
  },

}

local one_light = {
  foreground = '#2a2b33',
  background = '#fafafa',
  cursor_bg = '#bbbbbb',
  cursor_border = '#bbbbbb',
  cursor_fg = '#ffffff',
  selection_bg = '#ededed',
  selection_fg = '#2a2c33',
  ansi = {
    '#000000',
    '#de3d35',
    '#3e953a',
    '#a06600',
    '#2f5af3',
    '#a00095',
    '#3e953a',
    '#bbbbbb',
  },

  brights = {
    '#000000',
    '#de3d35',
    '#3e953a',
    '#a06600',
    '#2f5af3',
    '#a00095',
    '#3e953a',
    '#ffffff',
  },

}

local M = {}

function M.get(term_theme)
  local colors = one_dark

  -- 切换 theme
  if term_theme == 'light' then
    colors = one_light
  elseif term_theme == 'dark' then
    colors = one_dark
  end

  return colors
end

return M
