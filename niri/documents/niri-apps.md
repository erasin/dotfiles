# Niri 生态组件推荐

本文档列出与 Niri 配合使用的推荐组件。

## 目录

- [锁屏](#锁屏)
- [状态栏](#状态栏)
- [壁纸](#壁纸)
- [通知](#通知)
- [启动器](#启动器)
- [剪贴板](#剪贴板)
- [截屏与录制](#截屏与录制)
- [取色器](#取色器)
- [Wayland 兼容](#wayland-兼容)
- [Electron 应用](#electron-应用)

---

## 锁屏

### Swaylock

```bash
# 安装
pacman -S swaylock

# 使用
swaylock -f -i ~/Pictures/wallpaper/lock.png
```

相关链接：[swaylock 仓库](https://github.com/swaywm/swaylock)

---

## 状态栏

### Waybar

```bash
# 安装
pacman -S waybar

# 配置目录
~/.config/waybar/
```

链接到 niri 服务：

```bash
ln -s /usr/lib/systemd/user/waybar.service ~/.config/systemd/user/niri.service.wants/
```

相关链接：
- [Waybar 仓库](https://github.com/Alexays/Waybar)
- [Waybar Wiki](https://github.com/Alexays/Waybar/wiki/)

### Eww

```bash
# 安装
pacman -S eww
```

相关链接：
- [Eww 仓库](https://github.com/elkowar/eww)
- [Eww 文档](https://elkowar.github.io/eww/configuration.html)
- [Eww 指南](https://dharmx.is-a.dev/eww-powermenu/)

---

## 壁纸

### Swaybg

静态壁纸解决方案。

```bash
# 安装
pacman -S swaybg

# 配置服务
# ~/.config/systemd/user/swaybg.service
```

Systemd 服务配置：

```ini
[Unit]
PartOf=graphical-session.target
After=graphical-session.target
Requisite=graphical-session.target

[Service]
ExecStart=/usr/bin/swaybg -m fill -i "%h/Pictures/wallpaper/default.jpg"
Restart=on-failure
```

链接：`ln -s ~/.config/systemd/user/swaybg.service ~/.config/systemd/user/niri.service.wants/`

相关链接：[Swaybg 仓库](https://github.com/swaywm/swaybg)

### Swww

动态壁纸，支持动画。

```bash
# 安装
pacman -S swww

# 启动守护进程
swww-daemon

# 设置壁纸
swww img ~/Pictures/wallpaper/animate.gif
swww img ~/Pictures/wallpaper/static.jpg
```

Niri 配置：

```kdl
spawn-at-startup "swww img ~/Pictures/wallpaper/a1.jpg"
```

Systemd 服务配置：

```ini
[Unit]
PartOf=graphical-session.target
After=graphical-session.target
Requisite=graphical-session.target

[Service]
ExecStart=swww-daemon
Restart=on-failure
```

链接：`ln -s ~/.config/systemd/user/swww.service ~/.config/systemd/user/niri.service.wants/`

相关链接：[Swww 仓库](https://github.com/LGFae/swww)

---

## 通知

### Mako

轻量级通知守护进程。

```bash
pacman -S mako
```

相关链接：[Mako 仓库](https://github.com/emersion/mako)

### Swaync

基于 Catppuccin 主题的通知中心。

```bash
pacman -S swaync
```

链接：`ln -s /usr/lib/systemd/user/swaync.service ~/.config/systemd/user/niri.service.wants/`

相关链接：[Swaync 仓库](https://github.com/catppuccin/swaync)

### Dunst

经典的通知守护进程。

```bash
pacman -S dunst
```

相关链接：[Dunst 仓库](https://github.com/dunst-project/dunst)

---

## 启动器

### Rofi Wayland

```bash
pacman -S rofi-wayland
```

### Fuzzel

Wayland 原生启动器。

```bash
pacman -S fuzzel
```

相关链接：[Fuzzel 仓库](https://github.com/dnkl/fuzzel)

### Anyrun

轻量级 Wayland 运行器。

```bash
pacman -S anyrun
```

---

## 剪贴板

### wl-clipboard

Wayland 剪贴板工具集。

```bash
pacman -S wl-clipboard
```

常用命令：

```bash
# 复制
echo "text" | wl-copy

# 粘贴
wl-paste

# 图像
wl-paste -t image/png > image.png
```

### Cliphist

剪贴板历史管理器。

```bash
pacman -S cliphist
```

常用命令：

```bash
# 查看历史
cliphist list

# 选择性粘贴
cliphist decode | wl-paste

# 清空
cliphist clear
```

---

## 截屏与录制

### Slurp

交互式区域选择工具。

```bash
pacman -S slurp
```

### Grim

Wayland 截图工具。

```bash
pacman -S grim
```

常用命令：

```bash
# 全屏截图
grim

# 区域截图
grim -g "$(slurp)"

# 窗口截图
grim -w "$(swaymsg -t get_tree | jq '.. | select(.type? == "floating") | .rect | "\(.x),\(.y) \(.width)x(.height)"' | rofi -dmenu)"

# 复制到剪贴板
grim -g "$(slurp)" - | wl-copy
```

### wl-screenrec

支持 GPU 加速的 Wayland 屏幕录制。

```bash
pacman -S wl-screenrec
```

常用命令：

```bash
# 录制
wl-screenrec

# 指定区域
wl-screenrec -g "$(slurp)"

# 停止
pkill wl-screenrec
```

相关链接：
- [Slurp 仓库](https://github.com/emersion/slurp)
- [Grim 仓库](https://github.com/emersion/grim)
- [wl-screenrec 仓库](https://github.com/russelltg/wl-screenrec)

---

## 取色器

### Niri 内置取色

```bash
niri msg pick-color
```

###eyedropper

图形化取色器。

```bash
pacman -S eyedropper
```

---

## Wayland 兼容

### XWayland

Niri 内置 XWayland 支持。启动 XWayland 卫星进程：

```kdl
spawn-at-startup "xwayland-satellite"
```

### xdotool 替代品

#### ydotool

通用命令行自动化工具。

```bash
pacman -S ydotool
```

相关链接：[ydotool 仓库](https://github.com/ReimuNotMoe/ydotool)

---

## Electron 应用

Electron 应用在 Wayland 下需要特殊参数启用原生支持。

### 配置文件

`~/.config/electron-flags.conf`

### 通用参数

```ini
# 版本 >= 13
--enable-features=UseOzonePlatform
--ozone-platform=wayland

# 版本 > 17
--enable-features=WaylandWindowDecorations

# 版本 > 20
--ozone-platform-hint=auto
```

### Chrome 浏览器

```ini
--enable-features=UseOzonePlatform
--ozone-platform=wayland
```

### VS Code

添加至 VS Code 启动参数：

```json
{
  "electronPath": "/usr/bin/code",
  "additionalRuntimeArgs": [
    "--enable-features=UseOzonePlatform",
    "--ozone-platform=wayland"
  ]
}
```

---

## 参考资源

- [Arch Linux Wayland 文档](https://wiki.archlinux.org/title/Wayland)
- [Niri Wiki - 系统配置示例](https://github.com/YaLTeR/niri/wiki/Example-systemd-Setup)
- [Sway i3 迁移指南](https://github.com/swaywm/sway/wiki/i3-Migration-Guide)
- [Tokyo 主题配置参考](https://github.com/rxyhn/tokyo/tree/main/config/eww)
