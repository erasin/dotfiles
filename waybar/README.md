# Waybar 配置

适用于 Niri/Wayland 的 Waybar 状态栏配置

## 目录结构

```
~/.config/waybar/
├── config.jsonc          # 主配置文件
├── style.css             # 样式文件
├── power_menu.xml        # 电源菜单
├── scripts/              # Waybar 专用脚本
│   ├── clipboard.sh      # 剪贴板管理
│   ├── color-picker.sh   # 取色器
│   ├── gsconnect-status.py # GSConnect 状态
│   ├── lyrics.sh         # 歌词显示
│   ├── mako-status.sh    # Mako 通知状态
│   ├── rmpc-picker.sh    # MPD 音乐选择器
│   ├── screenrec.sh      # 录屏控制
│   ├── temperature.sh    # 温度监控
│   ├── unmount.sh        # 设备卸载
│   └── weather.sh        # 天气显示
└── README.md             # 本文档

~/.config/scripts/        # 通用脚本
├── MediaControl          # 媒体播放控制
└── ...

~/.config/tokens/         # API 密钥
└── gaode.txt             # 高德天气 API
```

## 依赖安装

### 必需依赖

```bash
# Wayland 相关
sudo pacman -S waybar

# 系统工具
sudo pacman -S wl-clipboard      # 剪贴板
sudo pacman -S fuzzel            # 应用启动器
sudo pacman -S libnotify         # 通知

# 音频
sudo pacman -S pulseaudio        # 音频服务
sudo pacman -S pavucontrol       # 音频控制（可选）

# 网络
sudo pacman -S networkmanager    # 网络管理
sudo pacman -S nm-connection-editor  # 网络配置

# 蓝牙
sudo pacman -S bluez             # 蓝牙服务
sudo pacman -S blueman           # 蓝牙管理
```

### 可选依赖

```bash
# 剪贴板历史
yay -S cliphist                  # 剪贴板历史管理

# 取色器
yay -S eyedropper                # GTK 取色器
yay -S gpick                     # 高级取色器（可选）

# 媒体控制
sudo pacman -S playerctl         # 媒体播放控制
sudo pacman -S mpd mpdris2       # MPD 音乐播放器
yay -S rmpc                      # MPD 终端客户端

# 录屏
sudo pacman -S slurp             # 区域选择
sudo pacman -S wf-recorder       # Wayland 录屏

# 天气
# 需要高德天气 API Key: https://lbs.amap.com/

# GSConnect
sudo pacman -S python-pydbus     # D-Bus Python 绑定
yay -S gsconnect                 # KDE Connect 兼容
sudo usermod -aG input $USER     # 添加输入组权限（需重启）

# 通知
sudo pacman -S mako              # 通知守护进程

# 系统监控
sudo pacman -S gnome-system-monitor
sudo pacman -S gnome-control-center

# 其他
sudo pacman -S nautilus          # 文件管理器
sudo pacman -S gnome-weather     # 天气应用
sudo pacman -S gnome-calendar    # 日历应用
sudo pacman -S gnome-disks       # 磁盘管理
```

## 模块说明

### 左侧模块

| 模块 | 功能 | 点击操作 |
|------|------|----------|
| `custom/arch` | 系统菜单 | 打开 Fuzzel |
| `custom/files` | 文件管理器 | 打开 Nautilus |
| `niri/workspaces` | 工作区指示器 | 切换工作区 |
| `wlr/taskbar` | 任务栏 | 切换/关闭窗口 |
| `group/niri-action` | 窗口管理工具组 | 展开/收起 |
| `niri/window` | 当前窗口标题 | 切换窗口 |

**窗口管理工具组包含：**
- 关闭窗口
- 聚焦方向（左/中/右）
- 窗口宽度调整
- 浮动窗口切换
- 标签页显示切换

### 中间模块

| 模块 | 功能 | 点击操作 |
|------|------|----------|
| `custom/media-toggle` | 播放/暂停 | 切换播放状态 |
| `custom/media` | 媒体信息 | 打开播放器 |
| `custom/media-next` | 下一曲 | 切换下一首 |
| `custom/notification` | 通知状态 | 显示/清除通知 |

### 右侧模块

| 模块 | 功能 | 点击操作 |
|------|------|----------|
| `custom/weather` | 天气信息 | 打开天气应用 |
| `pulseaudio` | 音量控制 | 静音/音量设置 |
| `bluetooth` | 蓝牙状态 | 打开蓝牙管理 |
| `network` | 网络状态 | 网络设置 |
| `custom/temperature` | CPU 温度 | 系统监控 |
| `custom/clipboard` | 剪贴板历史 | 查看历史 |
| `custom/colorpicker` | 取色器 | 拾取颜色 |
| `custom/gsconnect` | 设备连接 | GSConnect 设置 |
| `group/tools` | 工具组 | 展开/收起 |
| `tray` | 系统托盘 | 托盘菜单 |
| `clock` | 时钟日历 | 打开日历 |
| `custom/logout` | 电源菜单 | 锁定/关机/重启 |

**工具组包含：**
- 录屏控制
- 设备卸载
- 阻止息屏
- 壁纸切换

## 快捷键

### 鼠标操作

**通用：**
- 左键：主要操作
- 右键：次要操作/设置
- 中键：特殊操作
- 滚轮：调节参数

**音频模块：**
- 左键：静音切换
- 右键：打开音量设置
- 滚轮：调节音量（±1%）

**网络模块：**
- 左键：网络设置
- 右键：连接编辑器

**通知模块：**
- 左键：恢复通知
- 右键：清除所有通知

## 脚本说明

### 通用脚本（~/.config/scripts/）

#### MediaControl
媒体播放控制器，支持多种播放器：
- `--toggle`: 播放/暂停
- `--next`: 下一曲
- `--prev`: 上一曲
- `--status`: 播放状态
- `--statusicon`: 状态图标
- `--title`: 当前曲目信息

支持播放器：MPD, Amberol, Spotify, Rhythmbox 等

### Waybar 专用脚本（~/.config/waybar/scripts/）

#### clipboard.sh
剪贴板历史管理
- 依赖：cliphist, wl-clipboard, fuzzel
- 左键：查看历史并选择
- 中键：清空历史

#### color-picker.sh
取色器工具
- 依赖：gpick 或 slurp + grim
- 左键：拾取颜色并复制到剪贴板
- 右键：打开 Eyedropper

#### gsconnect-status.py
GSConnect 设备状态
- 依赖：python-pydbus, gsconnect
- 显示连接设备数量和类型
- 左键：打开 GSConnect 设置

#### lyrics.sh
歌词显示（需要 rmpc 和 mpd）
- 右键：显示当前播放歌词

#### mako-status.sh
Mako 通知状态
- 依赖：mako, makoctl
- 返回通知数量和状态

#### rmpc-picker.sh
MPD 音乐选择器
- 依赖：rmpc, fuzzel
- 中键：打开音乐选择器

#### screenrec.sh
录屏控制
- 依赖：wf-recorder, slurp
- `status`: 录制状态
- `toggle`: 开始/停止录制
- `select-area`: 选择录制区域

#### temperature.sh
CPU 温度监控
- 自动检测传感器
- 根据温度显示不同图标
- 右键：打开系统监控

#### unmount.sh
可移动设备卸载
- 显示挂载设备数量
- 右键：打开磁盘管理

#### weather.sh
天气信息显示
- 依赖：curl, jaq
- 参数：
  - `--waybar`: Waybar 格式输出
  - `--city <城市>`: 指定城市
  - `--key-file <文件>`: API 密钥文件
- 需要高德天气 API Key

## 配置说明

### 主题颜色

当前使用 OneDark 主题：
- 背景色：`#282c34`
- 文本色：`#ffffff`
- 强调色：`#0066ff`（蓝）、`#FFA000`（橙）

### 修改主题

编辑 `style.css` 文件中的颜色值：

```css
/* 修改背景色 */
background: #282c34;

/* 修改强调色 */
color: #0066ff;
```

### 禁用模块

在 `config.jsonc` 中注释掉不需要的模块：

```json
"modules-right": [
  // "custom/weather",  // 禁用天气
  "pulseaudio",
  // ...
]
```

## 故障排查

### Waybar 不显示

```bash
# 检查配置语法
waybar --log-level debug

# 重新加载配置
killall waybar && waybar &
```

### 脚本权限错误

```bash
# 添加执行权限
chmod +x ~/.config/waybar/scripts/*.sh
chmod +x ~/.config/scripts/MediaControl
```

### 剪贴板不工作

```bash
# 检查 wl-clipboard
wl-copy --version

# 启动 cliphist 服务
systemctl --user enable --now cliphist
```

### GSConnect 无法连接

```bash
# 检查服务状态
systemctl --user status gsconnect

# 重新添加输入组
sudo usermod -aG input $USER
# 需要注销并重新登录
```

### 天气不显示

```bash
# 检查 API Key
cat ~/.config/tokens/gaode.txt

# 测试 API
curl "https://restapi.amap.com/v3/weather/weatherInfo?city=杭州&key=YOUR_KEY"
```

## 自定义扩展

### 添加新模块

1. 在 `config.jsonc` 中定义模块：

```json
"custom/my-module": {
  "format": "{}",
  "exec": "$HOME/.config/waybar/scripts/my-script.sh",
  "interval": 5
}
```

2. 添加到模块列表：

```json
"modules-right": [
  "custom/my-module",
  // ...
]
```

3. 在 `style.css` 中添加样式：

```css
#custom-my-module {
  /* 样式定义 */
}
```

### 添加新脚本

1. 创建脚本文件：

```bash
#!/bin/bash
# 脚本说明

# 输出 JSON 格式
echo '{"text": "内容", "tooltip": "提示"}'
```

2. 添加执行权限：

```bash
chmod +x ~/.config/waybar/scripts/my-script.sh
```

## 性能优化

### 减少更新频率

调整 `interval` 参数（单位：秒）：

```json
"custom/weather": {
  "interval": 5000,  // 5000 秒 ≈ 83 分钟
  // ...
}
```

### 禁用动画

在 `style.css` 中移除或注释动画：

```css
/* @keyframes blink { ... } */
```

## 相关资源

- [Waybar Wiki](https://github.com/Alexays/Waybar/wiki)
- [Waybar 配置示例](https://github.com/Alexays/Waybar/wiki/Module:-Custom:-Simple)
- [Niri 文档](https://github.com/YaLTeR/niri)
- [高德天气 API](https://lbs.amap.com/api/webservice/guide/api/weatherinfo)

## 许可证

本配置文件基于 MIT 许可证开源。
