# Niri 窗口规则详解

窗口规则（Window Rules）允许你对特定窗口应用自定义配置，如浮动、尺寸、透明度等。

## 目录

- [基础语法](#基础语法)
- [匹配条件](#匹配条件)
- [窗口属性](#窗口属性)
- [装饰与效果](#装饰与效果)
- [遮挡规则](#遮挡规则)
- [示例](#示例)

---

## 基础语法

```kdl
window-rule {
    match app-id="应用ID"
    match title="窗口标题"
    
    open-floating true
    default-column-width { proportion 0.5; }
}
```

### 全局窗口规则

对所有窗口生效的规则：

```kdl
window-rule {
    geometry-corner-radius 10    # 圆角
    clip-to-geometry true        # 裁剪到几何形状
    draw-border-with-background false  # 边框与背景
}
```

---

## 匹配条件

### app-id

窗口的应用标识符：

```kdl
match app-id="firefox"
match app-id="Alacritty|kitty"     # 多个 app-id（OR 关系）
match app-id=r#"jetbrains-studio$"# # 正则表达式
```

### title

窗口标题：

```kdl
match title="主标题"
match title="^Picture-in-Picture$"  # 正则：精确匹配
match title="^画中画$"               # 中文
match title="(Aria2)"                # 包含
```

### is-floating

是否浮动：

```kdl
match is-floating=true
match is-floating=false
```

### is-active

是否活跃：

```kdl
match is-active=true
match is-active=false
```

### is-window-cast-target

是否正在被录屏：

```kdl
match is-window-cast-target=true
```

### 多条件组合

多个 `match` 语句之间是 AND 关系：

```kdl
window-rule {
    match app-id="firefox"
    match title="^Picture-in-Picture$"
    # 只有同时满足这两个条件才生效
}
```

---

## 窗口属性

### 浮动

```kdl
open-floating true           # 打开时浮动
```

### 最大化

```kdl
open-maximized true          # 打开时最大化
```

### 浮动位置

```kdl
default-floating-position x=10 y=10 relative-to="bottom-right"
# relative-to: "top-left", "top-right", "bottom-left", "bottom-right"
```

### 列宽

```kdl
default-column-width { proportion 0.5; }    # 比例
default-column-width { fixed 500; }        # 固定像素
```

### 窗口高度

```kdl
default-window-height { proportion 0.5; }
default-window-height { fixed 400; }
```

### 透明度

```kdl
opacity 0.85      # 0.0 - 1.0
```

---

## 装饰与效果

### 焦点环绕

```kdl
focus-ring {
    active-color "#f38ba8"
    inactive-color "#7d0d2d"
}
```

### 边框

```kdl
border {
    active-color "#f38ba8"
    inactive-color "#7d0d2d"
}
```

### 阴影

```kdl
shadow {
    color "#7d0d2d70"
}
```

### 选项卡指示器

```kdl
tab-indicator {
    active-color "#f38ba8"
    inactive-color "#7d0d2d"
}
```

---

## 遮挡规则

### 屏幕录制遮挡

阻止特定窗口被录制：

```kdl
window-rule {
    match app-id=r#"^org\.keepassxc\.KeePassXC$"#
    match app-id=r#"^org\.gnome\.World\.Secrets$"#
    match title="密码"

    block-out-from "screencast"    # 录屏
    block-out-from "screen-capture" # 截屏
}
```

### 通知层遮挡

```kdl
layer-rule {
    match namespace="^notifications$"
    block-out-from "screencast"
}
```

---

## 示例

### 视频播放器固定宽度

```kdl
window-rule {
    match app-id="org.gnome.Decibels"
    match app-id="io.bassi.Amberol"
    match app-id="Waydroid"

    default-column-width { fixed 500; }
}
```

### 浮动窗口

```kdl
# Firefox 画中画
window-rule {
    match app-id="firefox" title="^Picture-in-Picture$"
    match app-id="firefox" title="^画中画$"
    match app-id="firefox" title="(Aria2)"
    match title="^画中画$"

    match app-id=r#"jetbrains-studio$"#
    match app-id="org.gnome.Nautilus" title="打开文件"

    open-floating true
}
```

### Steam 通知

```kdl
window-rule {
    match app-id="steam" title=r#"^notificationtoasts_\d+_desktop$"#
    default-floating-position x=10 y=10 relative-to="bottom-right"
}
```

### 编辑器取色器

```kdl
window-rule {
    match app-id="Alacritty|kitty" title="yazi-picker"
    match app-id="Alacritty|kitty" title="scooter-picker"
    match app-id="Alacritty|kitty" title="lazygit-picker"
    open-floating true
    default-column-width { proportion 0.6; }
    default-window-height { proportion 0.6; }
}
```

### 歌词窗口

```kdl
window-rule {
    match app-id="Alacritty|kitty" title="Lyrics"
    open-floating true
    default-floating-position x=32 y=50 relative-to="bottom-right"
    default-column-width { proportion 0.15; }
    default-window-height { proportion 0.3; }
}
```

### 取色器

```kdl
window-rule {
    match app-id="com.github.finefindus.eyedropper" title="Eyedropper"
    open-floating true
    default-floating-position x=132 y=150 relative-to="bottom-right"
    default-column-width { proportion 0.15; }
    default-window-height { proportion 0.4; }
}
```

### 密码管理器遮挡

```kdl
window-rule {
    match app-id=r#"^org\.keepassxc\.KeePassXC$"#
    match app-id=r#"^org\.gnome\.World\.Secrets$"#
    match title="密码"

    block-out-from "screen-capture"
}
```

### 录屏时高亮提示

```kdl
window-rule {
    match is-window-cast-target=true

    focus-ring {
        active-color "#f38ba8"
        inactive-color "#7d0d2d"
    }

    border {
        inactive-color "#7d0d2d"
    }

    shadow {
        color "#7d0d2d70"
    }

    tab-indicator {
        active-color "#f38ba8"
        inactive-color "#7d0d2d"
    }
}
```

### 录制时通用遮挡

```kdl
window-rule {
    match app-id=r#"^org\.keepassxc\.KeePassXC$"#
    match app-id=r#"^org\.gnome\.World\.Secrets$"#
    match app-id="firefox$" title="Google Keep"
    match app-id="firefox$" title="- Gmail "
    match title="密码"
    match app-id=r#"clash-nyanpasu"#
    match app-id=r#"Google-chrome"#
    match app-id=r#"com.obsproject.Studio"# title="设置"
    match app-id=r#"^wechat$"#

    block-out-from "screencast"
}
```

### Pomodoro 计时器

```kdl
window-rule {
    match app-id="io.gitlab.idevecore.Pomodoro" title="Pomodoro"

    open-floating true
    default-column-width { fixed 500; }
    default-window-height { fixed 400; }
}
```

---

## 相关链接

- [Niri Wiki - 窗口规则](https://github.com/YaLTeR/niri/wiki/Configuration:-Window-Rules)
