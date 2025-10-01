local wezterm = require 'wezterm' --[[@as Wezterm]]
local utils = require 'utils'
local act = wezterm.action

local keys = {

  { key = '=', mods = 'CTRL',       action = act.IncreaseFontSize },
  { key = '-', mods = 'CTRL',       action = act.DecreaseFontSize },
  { key = '0', mods = 'CTRL',       action = act.ResetFontSize },

  -- clipboard
  { key = 'V', mods = 'CTRL|SHIFT', action = act.PasteFrom 'Clipboard' },
  { key = 'C', mods = 'CTRL|SHIFT', action = act.CopyTo 'ClipboardAndPrimarySelection' },

  { key = 'F11', mods = '', action = act.ToggleFullScreen},
  -- { key = 'r', mods = 'CTRL|ALT', action = act.EmitEvent 'reload-colors' },
}

local window_keys = {

  { key = 'e', mods = 'LEADER',       action = act.EmitEvent 'toggle-tabbar' },
  { key = 'n', mods = 'SUPER',        action = act.SpawnWindow },
  -- { key = 'h', mods = 'SUPER', action = act.Hide },

  -- table
  { key = 't', mods = 'LEADER',       action = act.SpawnTab 'DefaultDomain' },

  -- pane
  { key = 'w', mods = 'LEADER',       action = act.ShowTabNavigator },
  { key = 'x', mods = 'LEADER',       action = act.CloseCurrentPane { confirm = true } },
  { key = 'f', mods = 'LEADER',       action = act.TogglePaneZoomState },

  { key = 'p', mods = 'LEADER',       action = act.PaneSelect },


  -- 分割
  { key = '-', mods = 'LEADER',       action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '_', mods = 'LEADER|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },

  -- 切换
  { key = 'h', mods = 'LEADER',       action = act.ActivatePaneDirection 'Left' },
  { key = 'j', mods = 'LEADER',       action = act.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'LEADER',       action = act.ActivatePaneDirection 'Up' },
  { key = 'l', mods = 'LEADER',       action = act.ActivatePaneDirection 'Right' },

  -- 调整尺寸 resize pane
  { key = 'H', mods = 'LEADER',       action = act.AdjustPaneSize { 'Left', 5 } },
  { key = 'J', mods = 'LEADER',       action = act.AdjustPaneSize { 'Down', 5 } },
  { key = 'K', mods = 'LEADER',       action = act.AdjustPaneSize { 'Up', 5 } },
  { key = 'L', mods = 'LEADER',       action = act.AdjustPaneSize { 'Right', 5 } },

  -- 窗口
  { key = '1', mods = 'LEADER',       action = act.ActivateTab(0) },
  { key = '2', mods = 'LEADER',       action = act.ActivateTab(1) },
  { key = '3', mods = 'LEADER',       action = act.ActivateTab(2) },
  { key = '4', mods = 'LEADER',       action = act.ActivateTab(3) },
  { key = '5', mods = 'LEADER',       action = act.ActivateTab(4) },
  { key = '6', mods = 'LEADER',       action = act.ActivateTab(5) },
  { key = '7', mods = 'LEADER',       action = act.ActivateTab(6) },
  { key = '8', mods = 'LEADER',       action = act.ActivateTab(7) },
  { key = '9', mods = 'LEADER',       action = act.ActivateTab(-1) },


  {
    key = 'r',
    mods = 'LEADER',
    -- 设定tab标题
    action = act.PromptInputLine {
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
