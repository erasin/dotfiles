# tmux 配置

prefix `<C-a>`，默认 `<C-b>`

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

| key   | cmd              |
| ----- | ---------------- |
| C-c   | 新建 session     |
| C-f   | 查询 session     |
| d     | 退出 session     |
| BTab  | 切换到上个 session |
| v     | popup scratch 终端 |

## window

| key   | -r  | cmd             |
| ----- | --- | --------------- |
| c     |     | 新建窗口        |
| w     |     | 窗口列表        |
| e     |     | 切换状态栏显示  |
| C-h   | yes | 上一个窗口      |
| C-l   | yes | 下一个窗口      |
| C-j   | yes | 窗口序号前移    |
| C-k   | yes | 窗口序号后移    |
| .     | yes | 交换窗口序号    |
| ,     |     | 重命名窗口      |
| Tab   |     | 最后的窗口      |
| 0-9   |     | 切换到指定窗口  |

## pane

| key   | -r  | cmd             |
| ----- | --- | --------------- |
| -     |     | 水平分割        |
| _     |     | 垂直分割        |
| h     | yes | 切换到左侧窗格  |
| j     | yes | 切换到下方窗格  |
| k     | yes | 切换到上方窗格  |
| l     | yes | 切换到右侧窗格  |
| H     | yes | 向左扩充窗格    |
| J     | yes | 向下扩充窗格    |
| K     | yes | 向上扩充窗格    |
| L     | yes | 向右扩充窗格    |
| >     |     | 窗格向后交换    |
| <     |     | 窗格向前交换    |
| f     | yes | 最大化/还原窗格 |
| x     |     | 关闭窗格        |

## copy mode (vi)

| key   | cmd               |
| ----- | ----------------- |
| [     | 进入复制模式      |
| v     | 开始选择          |
| C-v   | 矩形选择          |
| y     | 复制选中内容      |
| q     | 退出复制模式      |

## 插件

| 插件 | 功能 |
| ---- | ---- |
| tpm | 插件管理器 |
| tmux-sensible | 合理的默认配置 |
| tmux-resurrect | 会话持久化 |
| tmux-continuum | 自动保存会话 |
| vim-tmux-navigator | Vim/Neovim 窗格导航 |
| tmux-yank | 复制增强 |
| tmux-themepack | 主题 |

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
