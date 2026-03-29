# Neovim Helix-Style 配置

基于 LazyVim 和 Helix 键位的 Neovim 配置，追求与 Helix 编辑器一致的体验。

## 目录结构

```
nvim/
├── init.lua              # 入口文件
└── lua/
    ├── config/
    │   ├── options.lua   # Neovim 选项
    │   ├── keymaps.lua   # 键位映射 (Helix-like)
    │   ├── treesitter.lua # Treesitter 配置
    │   └── lsp.lua       # LSP 配置
    └── plugins/
        └── init.lua      # 插件列表
```

## 核心特性

- **LazyVim** 插件管理
- **Helix 风格键位** - 主要导航和编辑命令与 Helix 一致
- **Treesitter** - 语法高亮和文本对象
- **Telescope** - 文件模糊搜索
- **LSP** - 语言服务器支持
- **NvimTree** - 文件浏览器

## Helix 风格键位

### 模式

| 模式 | 说明 |
|------|------|
| Normal | 默认模式，类似 Helix 的 Normal mode |
| Insert | 插入模式 |
| Visual | 可视模式，按 `v` 进入 |

### 移动 (Motion)

| 键 | 说明 |
|----|------|
| `h/j/k/l` | 上下左右移动 |
| `H/L` | 行首/行尾 |
| `0/$` 或 `^` | 行首/行尾 |
| `w/b` | 词跳转 |
| `f{char}` | 跳转到下一个 `{char}` |
| `F{char}` | 跳转到上一个 `{char}` |
| `t{char}` | 跳转到下一个 `{char}` 之前 |
| `T{char}` | 跳转到上一个 `{char}` 之后 |
| `;/,` | 重复上一次 f/F/t/T 跳转 |
| `%` | 跳转到匹配的括号 |
| `[/]` | 跳转到上一个/下一个函数/段落 |
| `{/}` | 跳转到上一个/下一个空行 |
| `n/N` | 搜索下一个/上一个 |
| `</>` | 缩进 |

### 多光标 (需要插件支持)

| 键 | 说明 |
|----|------|
| `C` | 在上方添加光标 |
| `A` | 在下方添加光标 |
| `I` | 在选区开头插入 |
| `A` | 在选区结尾追加 |

### 文本对象 (需要 Treesitter)

| 键 | 说明 |
|----|------|
| `if/af` | 函数 内部/外部 |
| `ic/ac` | 类 内部/外部 |
| `ia/aa` | 参数 内部/外部 |
| `il/al` | 循环 内部/外部 |
| `ii/ai` | 条件 内部/外部 |

### 折叠 (Fold)

| 键 | 说明 |
|----|------|
| `z#` | 折叠 |
| `zo/zO` | 打开折叠 |
| `zc/zC` | 关闭折叠 |
| `za/zA` | 切换折叠 |
| `zv` | 打开所有折叠 |

### 窗口

| 键 | 说明 |
|----|------|
| `Ctrl+w s` | 水平分割 |
| `Ctrl+w v` | 垂直分割 |
| `Ctrl+w h/j/k/l` | 切换窗口 |
| `Ctrl+w q` | 关闭窗口 |
| `Ctrl+w o` | 只保留当前窗口 |

### 标签页

| 键 | 说明 |
|----|------|
| `gt` | 下一个标签页 |
| `gT` | 上一个标签页 |

### Space Leader 键

| 前缀 | 功能 |
|------|------|
| `<space>ff` | 查找文件 (Telescope) |
| `<space>fg` | 全局搜索 (Telescope) |
| `<space>fb` | 查找缓冲区 |
| `<space>fh` | 帮助标签 |
| `<space>fr` | 打开历史文件 |
| `<space>nt` | 切换 NvimTree |
| `<space>nf` | 在 NvimTree 中定位文件 |
| `<space>bd` | 关闭缓冲区 |
| `<space>w` | 保存文件 |
| `<space>Q` | 退出所有 |
| `<space>cc` | 编辑 init.lua |
| `<space>ck` | 编辑 keymaps.lua |
| `<space>th` | 切换搜索高亮 |
| `<space>tn` | 切换行号 |
| `<space>tr` | 切换相对行号 |

### 编辑

| 键 | 说明 |
|----|------|
| `ciw` | 修改整个词 |
| `caw` | 修改周围词 (含空格) |
| `diw` | 删除整个词 |
| `daw` | 删除周围词 |
| `yi` | 复制整个词 |
| `yaw` | 复制周围词 |
| `viw` | 选中整个词 |
| `vaw` | 选中周围词 |
| `dd` | 删除整行 |
| `cc` | 修改整行 |
| `yy` | 复制整行 |
| `.` | 重复上一次操作 |
| `u` | 撤销 |
| `Ctrl+r` | 重做 |

### 搜索替换

| 键 | 说明 |
|----|------|
| `/` | 搜索 |
| `?` | 反向搜索 |
| `n` | 下一个匹配 |
| `N` | 上一个匹配 |
| `*` | 搜索光标下的词 |

### LSP

| 键 | 说明 |
|----|------|
| `K` | 显示 hover 信息 |
| `gD` | 跳转到声明 |
| `gd` | 跳转到定义 |
| `gi` | 跳转到实现 |
| `gr` | 查找引用 |
| `Ctrl+]` | 跳转到定义 |
| `[d` / `]d` | 上一个/下一个诊断 |
| `<space>e` | 显示诊断浮窗 |

### 终端

| 键 | 说明 |
|----|------|
| `<Ctrl-\>` | 打开终端 |
| `<Ctrl+j/k>` | 切换终端 |
| `<esc>` | 从终端退出 |
| `i` | 进入插入模式 |

## 安装

```bash
# 克隆配置
git clone https://github.com/yourname/dotfiles.git ~/.config/nvim

# 启动 Neovim
nvim

# Lazy 会自动安装插件
```

## 配色方案

默认使用 **tokyonight** 配色，可通过以下方式切换：

```lua
-- 在 init.lua 中修改
vim.cmd("colorscheme tokyonight")
```

可选配色：
- tokyonight
- catppuccin
- gruvbox-material
- sonokai
- everforest
- kanagawa

## 依赖

- Neovim >= 0.9.0
- Git
- Ripgrep (用于 Telescope)
- FZF (可选)
- 字体: JetBrains Mono / Nerd Fonts
