local wezterm = require "wezterm"
local colors  = require "colors"
local events = require "events"
local keys= require "keys"

local M       = {}

if wezterm.config_builder then
  M = wezterm.config_builder()
end

-- M.check_for_updates = false
-- M.automatically_reload_config = false -- 自动加载配置

M.enable_wayland = true
-- M.colors = colors.get()
M.color_scheme = "OneHalfDark"

M.font_size = 13.0
-- M.line_height = 1.1
-- M.adjust_window_size_when_changing_font_size = false
-- M.warn_about_missing_glyphs = false
-- M.bold_brightens_ansi_colors = "BrightAndBold"

-- 字体
M.font = wezterm.font_with_fallback {
  { family = "JetBrains Mono" },
  { family = "Symbols Nerd Font Mono", weight = "Regular", scale = 1.0 },
  { family = "HarmonyOS Sans SC",      weight = "Regular", scale = 1.1 },
}

M.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
M.window_padding = { left = 2, right = 2, top = 0, bottom = 0, } -- padding

M.initial_cols = 182
M.initial_rows = 42
M.animation_fps = 10 -- fps 禁用滚动效果
M.cursor_blink_rate = 1000
M.enable_scroll_bar = false

M.enable_tab_bar = true -- 开启关闭标签栏 for tmux
-- M.use_fancy_tab_bar = true -- 不使用原生tab
-- M.tab_bar_at_bottom = true -- 底部
M.hide_tab_bar_if_only_one_tab = true -- 单一标签关闭显示
-- M.tab_max_width = 30 -- 宽度认定

-- 使用 ^1b , 参照 iterm2 设定 esc+ 防止 osx dead keys
M.send_composed_key_when_right_alt_is_pressed = false
-- 设定未激活的pane的显示
M.inactive_pane_hsb = {
  saturation = 0.9,    -- 饱和度
  brightness = 0.95,   -- 亮度
}
-- M.window_background_opacity = 0.5 -- 窗口透明度
-- M.text_background_opacity = 0.5 -- 文本透明度

-- -- 默认绑定
-- M.disable_default_key_bindings = true

keys.set(M)

return M
