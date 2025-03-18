#!/bin/bash
#
# 需要 imagemagick

# 生成临时目录保存色块图片
tmp_dir=$(mktemp -d)
image="$tmp_dir/color.png"

# 使用 hyprpicker 选取颜色
color=$(hyprpicker -a)

# 如果颜色不为空，则复制到剪贴板
if [[ -n "$color" ]]; then
    # 生成 100x100 的色块图片
    magick -size 100x100 xc:"$color" "$image"

    # 复制颜色到剪贴板 -a --autocopy
    # echo -n "$color" | wl-copy
    
    # 使用带图片的通知
    notify-send "Color Picker" "颜色已复制: $color" -i "$image"

    # 清理临时文件（延迟 5 秒后删除）
    sleep 5 && rm -rf "$tmp_dir" &
else
    notify-send "Color Picker" "未选取颜色"
fi
