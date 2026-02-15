# Niri 配置文件详解

Niri 使用 KDL 格式作为配置文件，支持 `//` 注释。配置文件通常位于 `~/.config/niri/config.kdl`。

## 目录

- [基础配置](#基础配置)
- [输入设备](#输入设备)
- [显示输出](#显示输出)
- [窗口布局](#窗口布局)
- [动画效果](#动画效果)
- [工作区](#工作区)
- [按键绑定](#按键绑定)

---

## 基础配置

### 包含其他配置文件

```kdl
include "startup.kdl"
include "window.kdl"
```

### 截图保存路径

设置 niri 内置截图的保存路径，支持 strftime 格式：

```kdl
screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"
```

### 省略客户端装饰 (CSD)

使客户端窗口装饰（Title Bar）被省略，优先使用服务器端装饰：

```kdl
prefer-no-csd
```

### 启动时运行的程序

在会话启动时自动运行程序：

```kdl
spawn-at-startup "程序名" "参数"
```

**示例**

```kdl
spawn-at-startup "fcitx5" "-d"           # 启动输入法
spawn-at-startup "xwayland-satellite"     # XWayland 兼容层
spawn-at-startup "swww img ~/wallpaper.jpg" # 壁纸
```

### 环境变量覆盖

为程序设置环境变量：

```kdl
environment {
    DISPLAY ":0"
    WAYLAND_DISPLAY "wayland-1"
}
```

---

## 输入设备

### 光标配置

```kdl
cursor {
    xcursor-theme "breeze_cursors"  # 光标主题
    xcursor-size 48                  # 光标大小
    hide-when-typing                 # 键入时自动隐藏
    hide-after-inactive-ms 10000    # 闲置N毫秒后隐藏
}
```

### 剪贴板

```kdl
clipboard { }
```

### 热键帮助覆盖层

显示快捷键提示的覆盖层：

```kdl
hotkey-overlay {
    skip-at-startup  # 启动时跳过显示
}
```

### 输入设备配置

```kdl
input {
    keyboard {
        xkb {
            layout "us"           # 键盘布局
            variant "colemak"     # 布局变体
            options "caps:escape" # 额外选项
        }
    }

    touchpad {
        tap                  # 点击启用
        natural-scroll       # 自然滚动
        disable-while-typing # 键入时禁用
    }

    mouse {
        natural-scroll       # 自然滚动
        accel-speed 0.2      # 加速度
        accel-profile "flat" # 加速度配置
    }

    tablet {
        map-to-output "DP-1" # 映射到指定输出
    }
}
```

---

## 显示输出

### 配置显示器

```kdl
output "DP-3" {
    off                    # 关闭显示器
    mode "2560x1440@119.998" # 分辨率刷新率
    scale 1.2              # 缩放
    transform "normal"    # 旋转: normal, 90, 180, 270, flipped, ...
    position x=1280 y=0    # 位置
}
```

> 使用 `niri msg outputs` 查看可用输出和支持的模式。

---

## 窗口布局

### 布局配置

```kdl
layout {
    gaps 8                        # 窗口间隙（像素）
    always-center-single-column   # 单列居中
    empty-workspace-above-first    # 首个空间留空
    center-focused-column "never" # 焦点窗口居中: always, never, auto
}
```

### 预设列宽

预设列宽比例，使用 `Mod+R` 切换：

```kdl
preset-column-widths {
    proportion 0.33333  # 1/3
    proportion 0.5     # 1/2
    proportion 0.66667 # 2/3
}

default-column-width { proportion 0.5; }  # 默认列宽
```

### 焦点环绕指示器

显示当前焦点窗口的边框指示：

```kdl
focus-ring {
    off
    width 4

    # 颜色设置方式：
    # - CSS 颜色名: "red"
    # - RGB 十六进制: "#rgb", "#rgba", "#rrggbb", "#rrggbbaa"
    # - CSS 样式: "rgb(255, 127, 0)", "rgba()", "hsl()"

    active-color "#7fc8ff"
    inactive-color "#505050"

    # 渐变色
    active-gradient from="red" to="orange" angle=45 in="oklch longer hue"
    inactive-gradient from="#505050" to="#808080" angle=45 relative-to="workspace-view"
}
```

### 窗口边框

```kdl
border {
    off
    width 4

    active-color "#ffc87f"
    inactive-color "#505050"

    active-gradient from="#F97316" to="#A855F7" angle=45 relative-to="workspace-view"
    inactive-gradient from="#505050" to="#808080" angle=45 relative-to="workspace-view"
}
```

### 窗口阴影

```kdl
shadow {
    on

    softness 30           # 柔和度
    spread 5              # 扩散范围
    offset x=0 y=5        # 偏移
    draw-behind-window true  # 绘制在窗口后面
    color "#00000070"     # 颜色（带透明度）
}
```

### 选项卡指示器

列内窗口以选项卡形式显示（`Mod+W` 切换）：

```kdl
tab-indicator {
    off

    hide-when-single-tab   # 单窗口隐藏
    place-within-column   # 内部放置
    gap 5                 # 间距
    width 5               # 宽度
    length total-proportion=0.5  # 总长度比例
    position "left"       # 位置: left, right, top, bottom
    gaps-between-tabs 2   # 选项卡间隔
    corner-radius 8       # 圆角

    active-color "red"
    inactive-color "gray"

    active-gradient from="#80c8ff" to="#bbddff" angle=45
    inactive-gradient from="#505050" to="#808080" angle=45 relative-to="workspace-view"
}
```

### 插入提示

窗口插入位置提示：

```kdl
insert-hint {
    off
    color "#ffc87f80"
    gradient from="#ffbb6680" to="#ffc88080" angle=45 relative-to="workspace-view"
}
```

### 四周间距 (Struts)

为工作区边缘留出空间（类似 padding）：

```kdl
struts {
    left 64
    right 64
    top 64
    bottom 64
}
```

---

## 动画效果

### 动画配置 (v1.5+)

```kdl
animations {
    off
    slowdown 3.0

    # 曲线类型: ease-out-quad, ease-out-cubic, ease-out-expo, linear
    # 弹簧: spring damping-ratio=X stiffness=Y epsilon=Z

    window-open {
        duration-ms 150
        curve "ease-out-expo"
    }

    window-close {
        duration-ms 150
        curve "ease-out-quad"
    }

    window-resize {
        spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
    }

    window-movement {
        spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
    }

    workspace-switch {
        spring damping-ratio=1.0 stiffness=1000 epsilon=0.0001
    }

    horizontal-view-movement {
        spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
    }

    config-notification-open-close {
        spring damping-ratio=0.6 stiffness=1000 epsilon=0.001
    }

    screenshot-ui-open {
        duration-ms 200
        curve "ease-out-quad"
    }
}
```

---

## 工作区

### 命名工作区

```kdl
workspace "def"     # 默认
workspace "dev"     # 开发
workspace "writer"  # 写作
```

---

## 按键绑定

### 常用按键

| 按键 | 功能 |
|------|------|
| `Mod` | 修饰键（通常是 Alt 或 Super） |
| `Super` | Windows/Command 键 |
| `Ctrl` | Ctrl |
| `Shift` | Shift |
| `Alt` | Alt |

### 基础绑定

```kdl
binds {
    # 显示快捷键帮助
    Mod+Shift+Slash { show-hotkey-overlay; }

    # 启动程序
    Mod+T { spawn "alacritty"; }           # 终端
    Mod+Space { spawn "anyrun"; }          # 启动器
    Mod+E { spawn "nautilus"; }            # 文件管理器
    Super+Alt+L { spawn "swaylock"; }      # 锁屏
    Mod+Tab { spawn "~/.config/niri/scripts/switch-window.sh"; }

    # 关闭窗口
    Mod+Q { close-window; }

    # 概览模式
    Mod+O { toggle-overview; }
}
```

### 焦点移动

```kdl
# 方向键
Mod+Left  { focus-column-left; }
Mod+Down  { focus-window-down; }
Mod+Up    { focus-window-up; }
Mod+Right { focus-column-right; }

# Vim 风格
Mod+H     { focus-column-left; }
Mod+J     { focus-window-down; }
Mod+K     { focus-window-up; }
Mod+L     { focus-column-right; }

# 首尾
Mod+Home { focus-column-first; }
Mod+End  { focus-column-last; }
```

### 窗口移动

```kdl
# 移动列
Mod+Ctrl+Left  { move-column-left; }
Mod+Ctrl+Down  { move-window-down; }
Mod+Ctrl+Up    { move-window-up; }
Mod+Ctrl+Right { move-column-right; }

# Vim 风格
Mod+Ctrl+H     { move-column-left; }
Mod+Ctrl+J     { move-window-down; }
Mod+Ctrl+K     { move-window-up; }
Mod+Ctrl+L     { move-column-right; }
```

### 显示器间移动

```kdl
# 焦点移动到其他显示器
Mod+Shift+Left  { focus-monitor-left; }
Mod+Shift+Down  { focus-monitor-down; }
Mod+Shift+Up    { focus-monitor-up; }
Mod+Shift+Right { focus-monitor-right; }

# 列移动到其他显示器
Mod+Shift+Ctrl+Left  { move-column-to-monitor-left; }
Mod+Shift+Ctrl+Down  { move-column-to-monitor-down; }
Mod+Shift+Ctrl+Up    { move-column-to-monitor-up; }
Mod+Shift+Ctrl+Right { move-column-to-monitor-right; }
```

### 工作区操作

```kdl
# 焦点工作区
Mod+Page_Down      { focus-workspace-down; }
Mod+Page_Up        { focus-workspace-up; }
Mod+U              { focus-workspace-down; }
Mod+I              { focus-workspace-up; }

# 移动到工作区
Mod+Ctrl+Page_Down { move-column-to-workspace-down; }
Mod+Ctrl+Page_Up   { move-column-to-workspace-up; }
Mod+Ctrl+U         { move-column-to-workspace-down; }
Mod+Ctrl+I         { move-column-to-workspace-up; }

# 移动整个工作区
Mod+Shift+Page_Down { move-workspace-down; }
Mod+Shift+Page_Up   { move-workspace-up; }

# 数字键工作区（1-9）
Mod+1 { focus-workspace 1; }
Mod+2 { focus-workspace 2; }
# ...
Mod+Ctrl+1 { move-column-to-workspace 1; }
```

### 滚轮工作区切换

```kdl
Mod+WheelScrollDown      cooldown-ms=150 { focus-workspace-down; }
Mod+WheelScrollUp        cooldown-ms=150 { focus-workspace-up; }
Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
Mod+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }
```

### 列宽调整

```kdl
Mod+R              { switch-preset-column-width; }       # 切换预设列宽
Mod+Shift+R        { switch-preset-window-height; }      # 切换预设高度
Mod+Ctrl+R         { reset-window-height; }              # 重置高度
Mod+F              { maximize-column; }                  # 最大化列
Mod+Shift+F        { fullscreen-window; }                # 全屏窗口
Mod+Ctrl+F         { expand-column-to-available-width; } # 扩展到可用宽度
Mod+C              { center-column; }                    # 居中列

# 精细调整
Mod+Minus    { set-column-width "-10%"; }    # 减少列宽
Mod+Equal    { set-column-width "+10%"; }    # 增加列宽
Mod+Shift+Minus { set-window-height "-10%"; } # 减少窗口高度
Mod+Shift+Equal { set-window-height "+10%"; } # 增加窗口高度
```

### 浮动窗口

```kdl
Mod+V              { toggle-window-floating; }              # 切换浮动
Mod+Shift+V        { switch-focus-between-floating-and-tiling; }
```

### 选项卡操作

```kdl
Mod+W { toggle-column-tabbed-display; }  # 切换选项卡显示模式

# 窗口消费/ expel
Mod+BracketLeft  { consume-or-expel-window-left; }   # 消费/ expel 左边
Mod+BracketRight { consume-or-expel-window-right; }  # 消费/ expel 右边
Mod+Comma        { consume-window-into-column; }     # 消费窗口到列底
Mod+Period       { expel-window-from-column; }      # expel 到底部
```

### 截图

```kdl
Print       { screenshot; }           # 截图
Ctrl+Print  { screenshot-screen; }   # 截取屏幕
Alt+Print   { screenshot-window; }    # 截取窗口
```

### 音量与媒体

```kdl
# PipeWire & WirePlumber
XF86AudioRaiseVolume allow-when-locked=true {
    spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
}
XF86AudioLowerVolume allow-when-locked=true {
    spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";
}
XF86AudioMute    allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
XF86AudioMicMute allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }
XF86AudioPlay    allow-when-locked=true { spawn "playerctl" "play-pause"; }
XF86AudioPause   allow-when-locked=true { spawn "playerctl" "play-pause"; }
XF86AudioNext    allow-when-locked=true { spawn "playerctl" "next"; }
```

### 退出与电源

```kdl
Mod+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; } # 快捷键抑制
Mod+Shift+E { quit; }           # 退出（确认）
Ctrl+Alt+Delete { quit; }
Mod+Shift+P { power-off-monitors; } # 关闭显示器
```

### 属性说明

- `allow-when-locked=true`: 锁屏时也可触发
- `repeat=false`: 禁用重复触发
- `cooldown-ms=N`: 触发冷却时间
- `allow-inhibiting=false`: 始终允许触发
- `hotkey-overlay-title="标题"`: 帮助覆盖层显示的标题

---

## 命令行

### 常用命令

```bash
niri msg outputs                    # 查看输出
niri msg workspaces                 # 查看工作区
niri msg windows                    # 查看窗口
niri msg pick-color                 # 取色器
niri msg action spawn <program>     # 启动程序
niri msg action quit                # 退出
```

---

## 相关链接

- [Niri 官方仓库](https://github.com/YaLTeR/niri)
- [Niri Wiki - 配置概述](https://github.com/YaLTeR/niri/wiki/Configuration:-Overview)
- [Niri Wiki - 窗口规则](https://github.com/YaLTeR/niri/wiki/Configuration:-Window-Rules)
- [i3 迁移指南](https://github.com/swaywm/sway/wiki/i3-Migration-Guide)
