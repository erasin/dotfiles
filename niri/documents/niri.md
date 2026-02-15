# Niri 文档索引

Niri 是一个基于 Wayland 的平铺式窗口管理器，专注于提供流畅的用户体验。

## 文档目录

- [配置详解](niri-config.md) - 完整的配置选项说明
- [窗口规则](niri-window.md) - 窗口规则配置指南
- [启动配置](niri-startup.md) - 启动项和 systemd 服务配置
- [生态组件](niri-apps.md) - 推荐配合使用的软件组件

## 快速开始

### 安装

```bash
# Arch Linux
pacman -S niri

# 从源码编译
cargo build --release
```

### 运行

使用显示管理器选择 Niri，或手动启动：

```bash
exec niri
```

### 基本快捷键

| 按键 | 功能 |
|------|------|
| `Mod+T` | 打开终端 |
| `Mod+Space` | 打开启动器 |
| `Mod+Q` | 关闭窗口 |
| `Mod+Tab` | 切换窗口 |
| `Mod+H/J/K/L` | 焦点移动 |
| `Mod+Ctrl+H/J/K/L` | 移动窗口 |
| `Mod+1-9` | 切换工作区 |
| `Print` | 截图 |

## 配置文件位置

- 主配置：`~/.config/niri/config.kdl`
- 窗口规则：`~/.config/niri/window.kdl`
- 启动项：`~/.config/niri/startup.kdl`

## 相关链接

- [Niri GitHub](https://github.com/YaLTeR/niri)
- [Niri Wiki](https://github.com/YaLTeR/niri/wiki)
