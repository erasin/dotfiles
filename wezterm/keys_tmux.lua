local wezterm = require "wezterm"

local M = {
  -- tmux
  -- xxd -psd
  -- 01 ^a
  -- 02 ^b
  -- 1b esc
  -- ^b t time

  -- tmux
  { key = '[',   mods = 'ALT',        action = wezterm.action.SendString '\x01\x5b' },  -- # ^b [ for scroll mode, use q exit -- LBracket
  { key = 't',   mods = 'ALT',        action = wezterm.action.SendString '\x01c' },     -- # ^b c 新建 tab
  { key = 'w',   mods = 'ALT',        action = wezterm.action.SendString '\x01x' },     -- # ^b x kill pane

  { key = 'm',   mods = 'ALT',        action = wezterm.action.SendString '\x01w' },     -- # ^b s session list
  { key = 'M',   mods = 'ALT',        action = wezterm.action.SendString '\x01m\x1b' }, -- # ^b M max

  -- 新建小窗口
  { key = 'd',   mods = 'ALT',        action = wezterm.action.SendString '\x01\x2d' }, -- # ^b - vSplit window
  { key = 'D',   mods = 'ALT|SHIFT',  action = wezterm.action.SendString '\x01\x5f' }, -- # ^b _ hSplit window

  -- 切换标签
  { key = 'j',   mods = 'ALT',        action = wezterm.action.SendString '\x01\x08\x1b' }, -- # ^b ^h 切换 tab prev
  { key = 'k',   mods = 'ALT',        action = wezterm.action.SendString '\x01\x0c\x1b' }, -- # ^b ^l 切换 tab next
  { key = 'Tab', mods = 'ALT',        action = wezterm.action.SendString '\x01\x09\x1b' }, -- # ^b tab

  -- 切换小框口
  { key = 'h',   mods = 'ALT|CTRL',   action = wezterm.action.SendString '\x01h\x1b\x1b' }, -- # ^b h  -- # 切换pane
  { key = 'j',   mods = 'ALT|CTRL',   action = wezterm.action.SendString '\x01j\x1b\x1b' }, -- # ^b j
  { key = 'k',   mods = 'ALT|CTRL',   action = wezterm.action.SendString '\x01k\x1b\x1b' }, -- # ^b k
  { key = 'l',   mods = 'ALT|CTRL',   action = wezterm.action.SendString '\x01l\x1b\x1b' }, -- # ^b l

  -- 调整小窗口尺寸
  { key = 'H',   mods = 'ALT|SHIFT',  action = wezterm.action.SendString '\x01H\x1b' }, -- # ^b H  -- # resize
  { key = 'J',   mods = 'ALT|SHIFT',  action = wezterm.action.SendString '\x01J\x1b' }, -- # ^b J
  { key = 'K',   mods = 'ALT|SHIFT',  action = wezterm.action.SendString '\x01K\x1b' }, -- # ^b K
  { key = 'L',   mods = 'ALT|SHIFT',  action = wezterm.action.SendString '\x01L\x1b' }, -- # ^b L

  -- 标签页
  { key = '1',   mods = 'ALT',        action = wezterm.action.SendString '\x011\x1b' }, -- # ^b 1 切换 tab1
  { key = '2',   mods = 'ALT',        action = wezterm.action.SendString '\x012\x1b' }, -- # ^b 2
  { key = '3',   mods = 'ALT',        action = wezterm.action.SendString '\x013\x1b' }, -- # ^b 3
  { key = '4',   mods = 'ALT',        action = wezterm.action.SendString '\x014\x1b' }, -- # ^b 4
  { key = '5',   mods = 'ALT',        action = wezterm.action.SendString '\x015\x1b' }, -- # ^b 5
  { key = '6',   mods = 'ALT',        action = wezterm.action.SendString '\x016\x1b' }, -- # ^b 6
  { key = '7',   mods = 'ALT',        action = wezterm.action.SendString '\x017\x1b' }, -- # ^b 7
  { key = '8',   mods = 'ALT',        action = wezterm.action.SendString '\x018\x1b' }, -- # ^b 8
  { key = '9',   mods = 'ALT',        action = wezterm.action.SendString '\x019\x1b' }, -- # ^b tab



}

return M
