#!/bin/bash
# 使用 hyprpicker 选取颜色
color=$(niri msg pick-color)

# 如果颜色不为空，则复制到剪贴板
if [[ "$color" != "No color was picked." ]]; then
    echo -n "$color" | wl-copy
    notify-send "Color Picker" "颜色已复制:\n$color"
else
    notify-send "Color Picker" "未选取颜色"
fi
