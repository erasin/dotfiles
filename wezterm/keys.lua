local wezterm = require 'wezterm'
local utils = require 'utils'

local keys = {

  { key = '=', mods = 'CTRL',       action = wezterm.action.IncreaseFontSize },
  { key = '-', mods = 'CTRL',       action = wezterm.action.DecreaseFontSize },
  { key = '0', mods = 'CTRL',       action = wezterm.action.ResetFontSize },

  -- clipboard
  { key = 'V', mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom 'Clipboard' },
  { key = 'C', mods = 'CTRL|SHIFT', action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection' },

  -- { key = 'r', mods = 'CTRL|ALT', action = wezterm.action.EmitEvent 'reload-colors' },
}

local window_keys = {

  { key = 'e', mods = 'LEADER',       action = wezterm.action.EmitEvent 'toggle-tabbar' },
  { key = 'n', mods = 'SUPER',        action = wezterm.action.SpawnWindow },
  -- { key = 'h', mods = 'SUPER', action = wezterm.action.Hide },

  -- table
  { key = 't', mods = 'LEADER',       action = wezterm.action.SpawnTab 'DefaultDomain' },

  -- pane
  { key = 'w', mods = 'LEADER',       action = wezterm.action.ShowTabNavigator },
  { key = 'x', mods = 'LEADER',       action = wezterm.action.CloseCurrentPane { confirm = true } },
  { key = 'f', mods = 'LEADER',       action = wezterm.action.TogglePaneZoomState },

  { key = 'p', mods = 'LEADER',       action = wezterm.action.PaneSelect },


  -- 分割
  { key = '-', mods = 'LEADER',       action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '_', mods = 'LEADER|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },

  -- 切换
  { key = 'h', mods = 'LEADER',       action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'j', mods = 'LEADER',       action = wezterm.action.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'LEADER',       action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'l', mods = 'LEADER',       action = wezterm.action.ActivatePaneDirection 'Right' },

  -- 调整尺寸 resize pane
  { key = 'H', mods = 'LEADER',       action = wezterm.action.AdjustPaneSize { 'Left', 5 } },
  { key = 'J', mods = 'LEADER',       action = wezterm.action.AdjustPaneSize { 'Down', 5 } },
  { key = 'K', mods = 'LEADER',       action = wezterm.action.AdjustPaneSize { 'Up', 5 } },
  { key = 'L', mods = 'LEADER',       action = wezterm.action.AdjustPaneSize { 'Right', 5 } },

  -- 窗口
  { key = '1', mods = 'LEADER',       action = wezterm.action.ActivateTab(0) },
  { key = '2', mods = 'LEADER',       action = wezterm.action.ActivateTab(1) },
  { key = '3', mods = 'LEADER',       action = wezterm.action.ActivateTab(2) },
  { key = '4', mods = 'LEADER',       action = wezterm.action.ActivateTab(3) },
  { key = '5', mods = 'LEADER',       action = wezterm.action.ActivateTab(4) },
  { key = '6', mods = 'LEADER',       action = wezterm.action.ActivateTab(5) },
  { key = '7', mods = 'LEADER',       action = wezterm.action.ActivateTab(6) },
  { key = '8', mods = 'LEADER',       action = wezterm.action.ActivateTab(7) },
  { key = '9', mods = 'LEADER',       action = wezterm.action.ActivateTab(-1) },


  {
    key = 'r',
    mods = 'LEADER',
    -- 设定tab标题
    action = wezterm.action.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
}


local M = {}

function M.set(config, use_win_keys)
  keys = keys

  if (use_win_keys) then
    config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
    utils.TableConcat(keys, window_keys)
  else
    -- config.default_prog = { '/bin/zsh', '-l', '-c', 'tmux attach || tmux' }
    -- local keys_tmux = require 'keys_tmux'
    -- utils.TableConcat(keys, keys_tmux)
  end
  config.keys = keys
end

return M
