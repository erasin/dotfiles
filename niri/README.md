# Niri 配置参考

本文档包含 Niri 窗口管理器的配置说明和推荐的生态组件。

## 快速开始

1. **启用服务**：查看 [Systemd 服务管理](#systemd-服务管理) 了解如何管理随 Niri 启动的服务
2. **安装组件**：根据需要安装状态栏、通知、剪贴板等组件
3. **配置服务**：创建相应的 systemd 服务以自动启动

---

## 目录

- [Systemd 服务管理](#systemd-服务管理)
- [锁屏](#锁屏)
- [状态栏](#状态栏)
- [壁纸](#壁纸)
- [通知](#通知)
- [空闲管理](#空闲管理)
- [启动器](#启动器)
- [剪贴板](#剪贴板)
- [截屏与录制](#截屏与录制)
- [取色器](#取色器)
- [其他工具](#其他工具)
- [Electron 应用](#electron-应用)
- [参考链接](#参考链接)

---

## Systemd 服务管理

### niri.service.wants

`niri.service.wants` 目录用于存放随 Niri 启动的用户服务。当 Niri 会话启动时，systemd 会自动启动该目录下的所有服务。

**当前启用的服务：**

| 服务 | 功能 | 配置文件 |
|------|------|----------|
| `waybar.service` | Waybar 状态栏 | 系统默认 |
| `mako.service` | Mako 通知守护进程 | 系统默认 |
| `cliphist.service` | 剪贴板历史管理 | 自定义配置 |
| `swayidle.service` | 空闲管理（自动锁屏/息屏） | 自定义配置 |
| `wayedges.service` | 边缘扩展按钮 | 自定义配置 |

### 服务配置示例

#### cliphist.service

剪贴板历史管理服务。

```ini
[Unit]
PartOf=graphical-session.target
After=graphical-session.target
Requisite=graphical-session.target

[Service]
ExecStart=/usr/bin/wl-paste --watch cliphist store
Restart=on-failure
```

#### swayidle.service

空闲管理服务，自动息屏和锁屏。

```ini
[Unit]
PartOf=graphical-session.target
After=graphical-session.target
Requisite=graphical-session.target

[Service]
ExecStart=/usr/bin/swayidle -w \
  timeout 601 'niri msg action power-off-monitors' \
  timeout 600 'swaylock -f' \
  before-sleep 'swaylock -f'
Restart=on-failure
```

**说明：**
- 600 秒（10 分钟）后锁屏
- 601 秒后息屏
- 系统睡眠前锁屏

#### wayedges.service

边缘扩展按钮服务。

```ini
[Unit]
PartOf=graphical-session.target
After=graphical-session.target
Requisite=graphical-session.target

[Service]
ExecStart=/home/erasin/.cargo/bin/way-edges daemon
Restart=on-failure
Environment=RUST_LOG=error
```

### 服务管理命令

```bash
# 查看所有服务状态
systemctl --user status niri.service.wants/*

# 启用服务（创建符号链接）
ln -s /usr/lib/systemd/user/waybar.service ~/.config/systemd/user/niri.service.wants/

# 启用自定义服务
ln -s ~/.config/systemd/user/swayidle.service ~/.config/systemd/user/niri.service.wants/

# 禁用服务（删除符号链接）
rm ~/.config/systemd/user/niri.service.wants/waybar.service

# 重启服务
systemctl --user restart waybar

# 查看服务日志
journalctl --user -u waybar -f
```

### 创建自定义服务

1. 创建服务文件：

```bash
mkdir -p ~/.config/systemd/user
vim ~/.config/systemd/user/my-service.service
```

2. 服务文件模板：

```ini
[Unit]
PartOf=graphical-session.target
After=graphical-session.target
Requisite=graphical-session.target

[Service]
ExecStart=/path/to/your/program
Restart=on-failure

[Install]
WantedBy=niri.service
```

3. 启用服务：

```bash
ln -s ~/.config/systemd/user/my-service.service ~/.config/systemd/user/niri.service.wants/
```

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


### wayedges

Wayland 边缘扩展按钮，在屏幕边缘添加可交互按钮。

```bash
# 安装（AUR）
yay -S way-edges
```

创建 systemd 服务：

```bash
cd ~/.config/systemd/user
touch wayedges.service
ln -s ~/.config/systemd/user/wayedges.service ~/.config/systemd/user/niri.service.wants/
```

服务配置：

```ini
[Unit]
PartOf=graphical-session.target
After=graphical-session.target
Requisite=graphical-session.target

[Service]
ExecStart=/usr/bin/way-edges daemon
Restart=on-failure
Environment=RUST_LOG=error
```

**配置文件位置：**
- `~/dotfiles/way-edges/config.kdl`

**功能：**
- 工作区切换按钮
- 音量/亮度滑块
- 自定义边缘操作

相关链接：[way-edges](https://github.com/way-edges/way-edges)

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

## 空闲管理

### Swayidle

空闲管理守护进程，用于自动锁屏、息屏等操作。

```bash
# 安装
pacman -S swayidle
```

创建 systemd 服务：

```bash
cd ~/.config/systemd/user
touch swayidle.service
ln -s ~/.config/systemd/user/swayidle.service ~/.config/systemd/user/niri.service.wants/
```

服务配置示例：

```ini
[Unit]
PartOf=graphical-session.target
After=graphical-session.target
Requisite=graphical-session.target

[Service]
ExecStart=/usr/bin/swayidle -w \
  timeout 300 'niri msg action power-off-monitors' \
  timeout 600 'swaylock -f' \
  before-sleep 'swaylock -f'
Restart=on-failure
```

**常用配置：**

```bash
# 5 分钟后息屏
timeout 300 'niri msg action power-off-monitors'

# 10 分钟后锁屏
timeout 600 'swaylock -f'

# 系统睡眠前锁屏
before-sleep 'swaylock -f'

# 锁屏时暂停媒体播放
lock 'playerctl pause'

# 解锁时恢复媒体播放
unlock 'playerctl play'
```

相关链接：[swayidle](https://github.com/swaywm/swayidle)

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

创建 systemd 服务以自动启动：

```bash
cd ~/.config/systemd/user
touch cliphist.service
ln -s ~/.config/systemd/user/cliphist.service ~/.config/systemd/user/niri.service.wants/
```

服务配置：

```ini
[Unit]
PartOf=graphical-session.target
After=graphical-session.target
Requisite=graphical-session.target

[Service]
ExecStart=/usr/bin/wl-paste --watch cliphist store
Restart=on-failure
```

**使用方法：**

```bash
# 查看剪贴板历史
cliphist list

# 选择并复制历史记录
cliphist list | fuzzel --dmenu | cliphist decode | wl-copy

# 清空历史
cliphist wipe

# 删除特定条目
cliphist delete
```

相关链接：[cliphist](https://github.com/sentriz/cliphist)

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

### 官方文档
- [Niri 官方 Wiki](https://github.com/YaLTeR/niri/wiki)
- [Niri 配置示例](https://github.com/YaLTeR/niri/wiki/Example-systemd-Setup)
- [Niri GitHub](https://github.com/YaLTeR/niri)

### Wayland 生态
- [Arch Linux Wayland 文档](https://wiki.archlinux.org/title/Wayland)
- [Sway i3 迁移指南](https://github.com/swaywm/sway/wiki/i3-Migration-Guide)
- [Are We Wayland Yet?](https://arewewaylandyet.com/)

### 配置参考
- [Tokyo 主题配置](https://github.com/rxyhn/tokyo/tree/main/config/eww)
- [Niri 配置集合](https://github.com/YaLTeR/niri/wiki/Configuration-Examples)

### Systemd 服务
- [Systemd 用户服务](https://wiki.archlinux.org/title/Systemd/User)
- [Graphical Session Target](https://systemd.io/DESKTOP_ENVIRONMENTS/)
