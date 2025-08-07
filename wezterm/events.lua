local wezterm = require "wezterm"

-- 切换 tabbar
wezterm.on("toggle-tabbar", function(window, pane)
  local conf = window:get_config_overrides() or {}

  if conf.enable_tab_bar == false then
    conf.enable_tab_bar = true
  else
    conf.enable_tab_bar = false
  end

  window:set_config_overrides(conf)
end)

wezterm.on("reload-colors", function(window, pane)
  local colors = require "colors"
  local conf   = window:get_config_overrides() or {}
  conf.colors  = colors.get()
  window:set_config_overrides(conf)
end)

local M = {}

return M
