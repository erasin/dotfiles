# Niri 启动配置详解

启动配置文件 `startup.kdl` 用于配置 Niri 会话启动时自动运行的程序。

## 基础语法

```kdl
spawn-at-startup "程序名"
spawn-at-startup "程序名" "参数"
```

## 常用启动项

### 输入法

```kdl
// Fcitx5
spawn-at-startup "fcitx5" "-d"

// Fcitx
spawn-at-startup "fcitx"
```

### 窗口管理器辅助

```kdl
// XWayland 兼容层
spawn-at-startup "xwayland-satellite"

// 边缘检测
spawn-at-startup "way-edges" "daemon"

// 音频增强
spawn-at-startup "uair" "--quite"
```

### 壁纸

```kdl
// swww 动态壁纸
spawn-at-startup "swww img ~/Pictures/wallpaper/ws11.jpg"

// swaybg 静态壁纸
spawn-at-startup "swaybg" "-m" "fill" "-i" "~/Pictures/wallpaper/default.jpg"
```

### 状态栏

> 注意：建议使用 systemd 用户服务管理状态栏

```kdl
// Waybar
spawn-at-startup "waybar"

// Eww
spawn-at-startup "eww" "daemon"
```

### 通知守护进程

```kdl
// Mako
spawn-at-startup "mako"

// Dunst
spawn-at-startup "dunst"
```

---

## Systemd 用户服务

推荐使用 systemd 管理长时间运行的服务。

### 配置方法

```bash
# 创建服务链接
ln -s /usr/lib/systemd/user/waybar.service ~/.config/systemd/user/niri.service.wants/
```

### 常用服务配置

#### Swaybg 壁纸服务

```ini
# ~/.config/systemd/user/swaybg.service
[Unit]
PartOf=graphical-session.target
After=graphical-session.target
Requisite=graphical-session.target

[Service]
ExecStart=/usr/bin/swaybg -m fill -i "%h/Pictures/wallpaper/default.jpg"
Restart=on-failure
```

链接：`ln -s ~/.config/systemd/user/swaybg.service ~/.config/systemd/user/niri.service.wants/`

#### Swww 动态壁纸服务

```ini
# ~/.config/systemd/user/swww.service
[Unit]
PartOf=graphical-session.target
After=graphetical-session.target
Requisite=graphical-session.target

[Service]
ExecStart=swww-daemon
Restart=on-failure
```

链接：`ln -s ~/.config/systemd/user/swww.service ~/.config/systemd/user/niri.service.wants/`

#### Waybar

链接：`ln -s /usr/lib/systemd/user/waybar.service ~/.config/systemd/user/niri.service.wants/`

#### Swaync 通知中心

链接：`ln -s /usr/lib/systemd/user/swaync.service ~/.config/systemd/user/niri.service.wants/`

---

## 启动顺序

Niri 启动时按以下顺序执行：

1. 启动输入设备配置
2. 加载窗口规则
3. 执行 `spawn-at-startup` 中的程序
4. 启用按键绑定

---

## 故障排查

### 查看启动日志

```bash
journalctl --user -u niri -f
```

### 手动启动程序

```bash
# 在终端中测试启动
alacritty -e <program>

# 检查程序是否支持 Wayland
<program> --help
```

---

## 相关链接

- [Niri Wiki - 启动配置](https://github.com/YaLTeR/niri/wiki/Configuration:-Miscellaneous#spawn-at-startup)
- [Niri 示例 systemd 配置](https://github.com/YaLTeR/niri/wiki/Example-systemd-Setup)
