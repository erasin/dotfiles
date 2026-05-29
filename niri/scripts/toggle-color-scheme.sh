#!/bin/sh
#
# toggle-color-scheme - 切换系统暗/亮色模式
#
# Mode 2031
# https://sw.kovidgoyal.net/kitty/kittens/themes/#change-color-themes-automatically-when-the-os-switches-between-light-and-dark
# 
# 切换 gsettings color-scheme，同步 gtk 设置，
# 并通知 helix 重载配置。

current=$(gsettings get org.gnome.desktop.interface color-scheme)

case "$current" in
    "'prefer-dark'")
        new="prefer-light"
        label="亮色"
        ;;
    *)
        new="prefer-dark"
        label="暗色"
        ;;
esac

# 设置新的颜色方案
gsettings set org.gnome.desktop.interface color-scheme "$new"

# 同步 gtk 设置
case "$new" in
    "prefer-dark") gtk_val=1 ;;
    *) gtk_val=0 ;;
esac

# gtk-3.0
mkdir -p ~/.config/gtk-3.0
cat > ~/.config/gtk-3.0/settings.ini << EOF
[Settings]
gtk-application-prefer-dark-theme=$gtk_val
EOF

# gtk-4.0
mkdir -p ~/.config/gtk-4.0
cat > ~/.config/gtk-4.0/settings.ini << EOF
[Settings]
gtk-application-prefer-dark-theme=$gtk_val
EOF

# 通知 helix 重载配置（通过 socket）
# find "$HOME" -path "*/.helix/helix.sock" -type s 2>/dev/null | while read -r sock; do
#     printf ':config-reload\n' | socat - UNIX-CONNECT:"$sock" 2>/dev/null
# done

notify-send -t 1500 "配色切换" "$label 模式"
