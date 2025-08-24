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

# alacritty -T "scooter-picker" --working-directory $(pwd) -e scooter 
# kitty -o confirm_os_window_close=0 -T "scooter-picker" --working-directory $(pwd) -e scooter 

# 检查是否在tmux会话中
if [[ -n "$TMUX" ]]; then
    # 使用tmux popup创建浮动窗口（需要tmux 3.2+）
    tmux popup -d "$(pwd)" -E "scooter"
# 检查是否在zellij会话中
elif [[ -n "$ZELLIJ" ]]; then
    # 创建新浮动窗格并执行命令
    zellij action new-floating-pane --cwd "$(pwd)" --command "scooter"
else
    # 在普通终端中使用alacritty创建新窗口
    alacritty -T "scooter-picker" --working-directory "$(pwd)" -e scooter
fi

