# tmux 配置

前缀 `<C-a>`，默认 `<C-b>`

使用方式：按 `<C-a>` 后松开，再键入下方按键

## 安装

```bash
# 链接配置文件
ln -sf ~/.config/tmux/tmux.conf ~/.tmux.conf

# 安装 TPM 插件管理器
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# 启动 tmux 后按 <prefix I> 安装插件
```

## session

| key  | cmd              | 说明               | tmux 默认键 |
| ---- | ---------------- | ------------------ | ----------- |
| C-c  | new-session      | 新建 session       | -           |
| C-f  | command-prompt   | 查询 session       | -           |
| d    | detach-client    | 退出 session       | d           |
| BTab | switch-client -l | 切换到上个 session | -           |
| v    | popup            | scratch 终端       | -           |

## window

| key | -r  | cmd             | 说明           | tmux 默认键 |
| --- | --- | --------------- | -------------- | ----------- |
| c   |     | new-window      | 新建窗口       | c           |
| w   |     | list-windows    | 窗口列表       | w           |
| e   | yes | set-option      | 切换状态栏显示 | -           |
| C-h | yes | previous-window | 上一个窗口     | p           |
| C-l | yes | next-window     | 下一个窗口     | n           |
| C-j | yes | swap-window -1  | 窗口序号前移   | -           |
| C-k | yes | swap-window +1  | 窗口序号后移   | -           |
| .   | yes | command-prompt  | 交换窗口序号   | .           |
| ,   |     | command-prompt  | 重命名窗口     | ,           |
| Tab |     | last-window     | 最后的窗口     | l           |
| 0-9 |     | select-window   | 切换到指定窗口 | 0-9         |

## pane

| key | -r  | cmd             | 说明            | tmux 默认键 |
| --- | --- | --------------- | --------------- | ----------- |
| -   |     | split-window -h | 水平分割        | %           |
| _   |     | split-window -v | 垂直分割        | "           |
| h   | yes | select-pane -L  | 切换到左侧窗格  | Left        |
| j   | yes | select-pane -D  | 切换到下方窗格  | Down        |
| k   | yes | select-pane -U  | 切换到上方窗格  | Up          |
| l   | yes | select-pane -R  | 切换到右侧窗格  | Right       |
| H   | yes | resize-pane -L  | 向左扩充窗格    | M-Left      |
| J   | yes | resize-pane -D  | 向下扩充窗格    | M-Down      |
| K   | yes | resize-pane -U  | 向上扩充窗格    | M-Up        |
| L   | yes | resize-pane -R  | 向右扩充窗格    | M-Right     |
| >   |     | swap-pane -D    | 窗格向后交换    | }           |
| <   |     | swap-pane -U    | 窗格向前交换    | {           |
| f   | yes | resize-pane -Z  | 最大化/还原窗格 | z           |
| x   |     | kill-pane       | 关闭窗格        | x           |

## copy mode (vi)

| key | cmd              | 说明         | tmux 默认键 |
| --- | ---------------- | ------------ | ----------- |
| [   | copy-mode        | 进入复制模式 | [           |
| v   | begin-selection  | 开始选择     | Space       |
| C-v | rectangle-toggle | 矩形选择     | -           |
| y   | copy-selection   | 复制选中内容 | Enter       |
| q   | send-keys q      | 退出复制模式 | q           |

## 插件

| 插件               | 功能                |
| ------------------ | ------------------- |
| tpm                | 插件管理器          |
| tmux-sensible      | 合理的默认配置      |
| tmux-resurrect     | 会话持久化          |
| tmux-continuum     | 自动保存会话        |
| vim-tmux-navigator | Vim/Neovim 窗格导航 |
| tmux-yank          | 复制增强            |
| tmux-themepack     | 主题                |

## 插件管理

- `<prefix I>` - 安装插件
- `<prefix U>` - 更新插件
- `<prefix alt-u>` - 移除插件

## 备注

- 支持 yazi 图片预览（`allow-passthrough on`）
- 支持 256 色和真彩色
- 支持 undercurl 下划线样式
- 支持 vi 模式复制
- 鼠标支持已启用
- `-r` 标记表示松开前缀后可持续触发（repeatable）
- "tmux 默认键"列为 tmux 内置绑定，其中 `-` 表示该功能在 tmux 中没有默认快捷键
