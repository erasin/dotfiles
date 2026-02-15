# Niri 配置参考

本文档包含 Niri 窗口管理器的配置说明和推荐的生态组件。

---

## 目录

- [锁屏](#锁屏)
- [状态栏](#状态栏)
- [壁纸](#壁纸)
- [通知](#通知)
- [启动器](#启动器)
- [剪贴板](#剪贴板)
- [截屏与录制](#截屏与录制)
- [取色器](#取色器)
- [其他工具](#其他工具)
- [Electron 应用](#electron-应用)
- [参考链接](#参考链接)

---

## 锁屏

### Swaylock

Wayland 兼容的锁屏程序。

```bash
# 安装
pacman -S swaylock
```

相关链接：[swaylock](https://github.com/swaywm/swaylock)

---

## 状态栏

### Waybar

模块化 Wayland 状态栏。

```bash
# 安装
pacman -S waybar
```

链接到 niri 服务：

```bash
ln -s /usr/lib/systemd/user/waybar.service ~/.config/systemd/user/niri.service.wants/
```

相关链接：
- [waybar](https://github.com/Alexays/Waybar)
- [waybar wiki](https://github.com/Alexays/Waybar/wiki/)

### Eww

可自定义的小部件系统。

```bash
# 安装
pacman -S eww
```

相关链接：
- [eww](https://github.com/elkowar/eww)
- [eww book](https://elkowar.github.io/eww/configuration.html)
- [eww guide](https://dharmx.is-a.dev/eww-powermenu/)

---

## 壁纸

### Swaybg

静态壁纸程序。

```bash
# 安装
pacman -S swaybg
```

创建 systemd 服务：

```bash
cd ~/.config/systemd/user
touch swaybg.service
ln -s ~/.config/systemd/user/swaybg.service ~/.config/systemd/user/niri.service.wants/
```

服务配置：

```ini
[Unit]
PartOf=graphical-session.target
After=graphical-session.target
Requisite=graphical-session.target

[Service]
ExecStart=/usr/bin/swaybg -m fill -i "%h/Pictures/wallpaper/38598.jpg"
Restart=on-failure
```

相关链接：[swaybg](https://github.com/swaywm/swaybg)

### Swww

动态壁纸程序，支持动画。

```bash
# 安装
pacman -S swww
```

创建 systemd 服务：

```bash
cd ~/.config/systemd/user
touch swww.service
ln -s ~/.config/systemd/user/swww.service ~/.config/systemd/user/niri.service.wants/
```

服务配置：

```ini
[Unit]
PartOf=graphical-session.target
After=graphical-session.target
Requisite=graphical-session.target

[Service]
ExecStart=swww-daemon
Restart=on-failure
```

Niri 配置中启动：

```kdl
spawn-at-startup "swww img ~/Pictures/wallpaper/a1.jpg"
```

相关链接：[swww](https://github.com/LGFae/swww)

---

## 通知

### Mako

轻量级通知守护进程。

```bash
pacman -S mako
```

相关链接：[mako](https://github.com/emersion/mako)

### Swaync

Catppuccin 主题的通知中心。

```bash
pacman -S swaync
ln -s /usr/lib/systemd/user/swaync.service ~/.config/systemd/user/niri.service.wants/
```

相关链接：[swaync](https://github.com/catppuccin/swaync)

### Dunst

经典的通知守护进程。

```bash
pacman -S dunst
```

相关链接：[dunst](https://github.com/dunst-project/dunst)

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

---

## 剪贴板

### wl-clipboard

Wayland 剪贴板工具集。

```bash
pacman -S wl-clipboard
```

### Cliphist

剪贴板历史管理器。

```bash
pacman -S cliphist
```

---

## 截屏与录制

### Slurp

交互式区域选择工具。

```bash
pacman -S slurp
```

相关链接：[slurp](https://github.com/emersion/slurp)

### Grim

Wayland 截图工具。

```bash
pacman -S grim
```

相关链接：[grim](https://github.com/emersion/grim)

### wl-screenrec

支持 GPU 加速的屏幕录制。

```bash
pacman -S wl-screenrec
```

相关链接：[wl-screenrec](https://github.com/russelltg/wl-screenrec)

---

## 取色器

### Niri 内置取色

```bash
niri msg pick-color
```

---

## 其他工具

### ydotool

通用命令行自动化工具（X11 xdotool 的替代品）。

```bash
pacman -S ydotool
```

相关链接：[ydotool](https://github.com/ReimuNotMoe/ydotool)

---

## Electron 应用

Electron 应用在 Wayland 下需要特殊参数启用原生支持。

### 配置文件

`~/.config/electron-flags.conf`

### 参数说明

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

---

## 参考链接

- [Niri 官方 systemd 配置示例](https://github.com/YaLTeR/niri/wiki/Example-systemd-Setup)
- [Sway i3 迁移指南](https://github.com/swaywm/sway/wiki/i3-Migration-Guide)
- [Arch Linux Wayland 文档](https://wiki.archlinux.org/title/Wayland)
- [Tokyo 主题配置参考](https://github.com/rxyhn/tokyo/tree/main/config/eww)
