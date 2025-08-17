#!/usr/bin/env bash
#
# wayland
#
# niri 添加窗口规则，Alacritty | Kitty
#
# window-rule {
#     match app-id="Alacritty|kitty"# title="scooter-picker"
#     open-floating true
# }
# 
# "s" = ":open %sh{ ~/.config/helix/scripts/scooter-picker }"

alacritty -T "scooter-picker" --working-directory $(pwd) -e scooter 
# kitty -o confirm_os_window_close=0 -T "scooter-picker" --working-directory $(pwd) -e scooter 
