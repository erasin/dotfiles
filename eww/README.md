# Eww Widgets 配置

基于 [Elkowar/eww](https://github.com/elkowar/eww) 构建的桌面小组件集合，采用 Tokyo Night 主题配色，提供美观且实用的桌面体验。

## 关键注意事项

1. **eww 0.6.0 的限制：**
   - `defpoll` 命令中的单引号需要特殊处理
   - `defvar` 不支持数组类型，必须使用 JSON 字符串
   - GTK CSS 不支持所有 CSS3 属性

2. **推荐做法：**
   - 复杂的 shell 命令移到独立脚本中
   - 使用 JSON 格式处理列表数据
   - 测试 CSS 属性是否被 GTK 支持

3. **调试技巧：**
   - 使用 `eww logs` 查看详细日志
   - 使用 `eww state` 检查变量值
   - 逐个组件测试，定位问题

## 配置文件结构

```
eww/
├── eww.yuck          # 主配置文件
├── eww.scss          # 主样式文件
├── colors.scss       # 颜色变量定义
├── bar/              # 状态栏组件
│   ├── eww.yuck
│   └── eww.scss
├── player/           # 音乐播放器
├── calendar/         # 日历
├── powermenu/        # 电源菜单
├── profile-card/     # 个人资料卡片
├── pomodoro/         # 番茄钟
├── color-picker/     # 颜色选择器
└── scripts/          # 所有脚本文件
    ├── Time
    ├── Date
    ├── Day
    ├── VolumeIcon
    ├── VolumeScroll
    ├── Workspace
    ├── WindowTitle
    ├── CpuUsage
    ├── RamUsage
    ├── Battery
    ├── Volume
    ├── Network
    └── ...
```

## 组件列表

### 📊 状态栏 (Bar)
- **工作区指示器**：显示当前工作区，支持点击切换
- **窗口标题**：显示当前活动窗口标题
- **时钟**：时间、日期显示
- **系统监控**：CPU、RAM 实时使用率
- **音量控制**：音量显示和调节（滚轮控制）
- **网络状态**：网络连接状态和名称
- **电池状态**：电池电量和充电状态（笔记本）
- **电源按钮**：快速访问电源菜单
- 支持 Niri / Hyprland / Sway 窗口管理器

### 🎵 音乐播放器 (Music Player)
- 专辑封面显示
- 歌曲信息（标题、艺术家、专辑）
- 播放控制（播放/暂停、上一曲、下一曲）
- 进度条拖动
- 随机播放和循环模式切换
- 支持 Spotify 和 MPD

### 📅 日历 (Calendar)
- 大字体时钟显示
- 日期信息
- 可交互日历
- 渐变色装饰线

### ⚡ 电源菜单 (Power Menu)
- 锁屏
- 登出
- 重启
- 睡眠
- 关机
- 悬停动画效果

### 👤 个人资料卡片 (Profile Card)
- 用户头像和主机名
- 系统运行时间
- 系统信息（OS、WM、软件包数量）
- 天气信息显示
- 系统监控（CPU、RAM、磁盘使用率）
- 快捷工具（网络、蓝牙、飞行模式）

### ⏱️ 番茄钟 (Pomodoro)
- 基于 [uair](https://github.com/metent/uair) 的番茄钟
- 圆形进度显示
- 工作状态指示
- 左键：开始/暂停
- 右键：下一个计时器
- 中键：上一个计时器

### 🎨 颜色选择器 (Color Picker)
- 快速取色工具
- 简洁的界面设计

## 安装

### 依赖项

#### 必需
- [eww](https://github.com/elkowar/eww) - 主要程序
- 字体：
  - JetBrains Mono
  - Symbols Nerd Font / Nerd Fonts
  - Cartograph CF（可选）

#### 组件依赖
- `playerctl` - 音乐控制
- `mpc` - MPD 客户端（可选）
- `uair` / `uairctl` - 番茄钟
- `systemctl` - 电源管理
- `niri` / `hyprctl` / `swaymsg` - 窗口管理器（用于 bar 工作区）
- `pamixer` 或 `amixer` - 音量控制
- `mpstat` 或 `top` - CPU 使用率（bar）
- `free` - 内存使用率（bar）

#### 脚本依赖
- `jq` - JSON 处理
- `curl` - 网络请求
- NetworkManager - 网络管理
- `bluez` / `bluetoothctl` - 蓝牙管理

### 安装步骤

1. 确保已安装 eww：
   ```bash
   # Arch Linux
   yay -S eww
   
   # 或从源码编译
   git clone https://github.com/elkowar/eww
   cd eww
   cargo build --release
   ```

2. 将配置文件复制到 eww 配置目录：
   ```bash
   cp -r eww/* ~/.config/eww/
   ```

3. 赋予脚本执行权限：
   ```bash
   chmod +x ~/.config/eww/scripts/*
   ```

4. 测试配置：
   ```bash
   eww reload
   ```

## 使用方法

### 基本命令

```bash
# 查看变量状态
eww state

# 调试模式
eww debug

# 重新加载配置
eww reload

# 关闭所有窗口
eww kill

# 打开特定组件
eww open bar              # 状态栏（推荐开机自启）
eww open player
eww open calendar
eww open powermenu
eww open profile-card
eww open pomodoro
eww open color-picker

# 切换组件显示/隐藏
eww open --toggle bar     # 切换状态栏
eww open --toggle player
eww open --toggle calendar
```

### 推荐的窗口管理器集成

在你的窗口管理器配置中添加快捷键：

```bash
# 示例（Niri / Hyprland / Sway）
# 状态栏（开机自启）
exec-once = eww open bar

# 音乐播放器
bind = $mainMod, M, exec, eww open --toggle player

# 日历
bind = $mainMod, C, exec, eww open --toggle calendar

# 电源菜单
bind = $mainMod, Escape, exec, eww open --toggle powermenu

# 个人资料卡片
bind = $mainMod, P, exec, eww open --toggle profile-card

# 番茄钟
bind = $mainMod, T, exec, eww open --toggle pomodoro
```

## 自定义

### 修改主题颜色

编辑 `colors.scss` 文件来自定义配色方案：

```scss
// 主色调
$bg: #1a1b26;          // 背景色
$bg-alt: #24283b;      // 次级背景
$fg: #c0caf5;          // 前景色（文字）

// 强调色
$red: #f7768e;
$green: #9ece6a;
$yellow: #e0af68;
$blue: #7aa2f7;
$magenta: #bb9af7;
$cyan: #7dcfff;
```

### 修改组件位置

编辑各个组件的 `.yuck` 文件中的 `defwindow` 部分：

```lisp
(defwindow player
  :monitor 0                    ; 显示器编号
  :geometry (geometry
              :x "2%"           ; X 位置
              :y "1%"           ; Y 位置
              :anchor "top center")  ; 锚点位置
  :wm-ignore false
  (player)
)
```

### 添加新的脚本

将新脚本放在 `scripts/` 目录下，并确保：
1. 脚本有执行权限
2. 在 `.yuck` 文件中使用相对路径引用：
   ```lisp
   (defpoll variable :interval "1s" "../scripts/script-name")
   ```

## 主题特性

- **Tokyo Night 配色**：舒适的深色主题
- **毛玻璃效果**：现代的半透明背景
- **柔和阴影**：增强视觉层次
- **流畅动画**：悬停和点击反馈
- **统一设计语言**：所有组件风格一致

## 故障排除

### 窗口不显示
```bash
# 检查 eww 状态
eww state

# 重新加载配置
eww reload

# 检查语法错误
eww debug
```

### 脚本执行失败
```bash
# 检查脚本权限
ls -la scripts/

# 手动测试脚本
./scripts/script-name --help
```

### 字体显示问题
确保已安装所有必需的 Nerd Fonts：
```bash
# Arch Linux
yay -S ttf-jetbrains-mono-nerd
```

## 参考项目

感谢以下项目提供的灵感：

- [gh0stzk/dotfiles](https://github.com/gh0stzk/dotfiles) - 配色和布局参考
- [jiyutake/womp](https://github.com/jiyutake/womp) - 组件设计
- [saimoomedits/eww-widgets](https://github.com/saimoomedits/eww-widgets/tree/main/eww) - 实现参考
- [rxyhn/tokyo](https://github.com/rxyhn/tokyo) - Tokyo Night 主题
- [adi1090x/widgets](https://github.com/adi1090x/widgets) - 组件灵感

## 许可证

本项目仅供个人使用和学习参考。

## 贡献

欢迎提交 Issue 和 Pull Request！
