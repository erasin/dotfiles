# alacritty 使用

0.13 版本后使用 toml 格式的配置文件


## 配置和使用

- 默认配置文件 `~/.config/alacritty/alacritty.toml`
- 配置模板文件需要到官方库中下载 [alacritty.yml](https://raw.githubusercontent.com/alacritty/alacritty/master/alacritty.yml)
- 配置支持 `import` 导入, 这样就可以将配置进行部分模块化, 重新配置会自动覆盖选项,配置需要绝对目录或者用HOME目录 `~/`开始.
- 配置 `live_config_reload`, 自动重载默认开启

```
.
├── alacritty.toml
├── hx.toml
├── keymaps
│  ├── alt_keymap.toml
│  └── tmux_keymap.toml
├── readme.md
└── themes
   ├── oneDark.toml
   └── oneLight.toml
```


### 字体配置

`font.yml`
> 字体可以到 [Nerd Fonts](https://www.nerdfonts.com/font-downloads) 下载.  
> 下载比较全的字体可以到项目文件中下载 [ryanoasis/nerd-fonts/Caskaydia Cove](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode)  
> 这里使用的是 [exorcist365/fonts/CascadiaCode Nerd Font](https://gitlab.com/exorcist365/fonts/-/tree/master/cascadia-code-fonts)

```yaml
font:

  normal:
    family: "CascadiaCode Nerd Font"
    style: Regular

  bold:
    family: "CascadiaCode Nerd Font"
    style: Bold

  italic:
    family: "CascadiaCode Nerd Font"
    style: Italic
  
  bold_italic:
    family: "CascadiaCode Nerd Font"
    style: Bold Italic

  size: 13.

  offset:
    x: 0
    y: 8

  glyph_offset:
    x: 0
    y: 4

```

### linux 下字体配置

配置文件 `.config/fontconfig/fonts.conf`

下面是 mono 字体的配置处理，这样可以临时解决在 alacritty 中的其他的字体的配置，比如中文字体和图标字体以及其他的补充字体，以便正确显示所需的字体。 

```xml
<match target="pattern">
  <test qual="any" name="family">
    <!-- 这里是 mono 处理 -->
  	<string>mono</string>
  </test>
  <edit name="family" mode="assign" binding="same">
  	<string>JetBrains Mono</string>
  	<string>Noto Sans CJK SC</string>
  	<string>Symbols Nerd Font Mono</string>
  	<string>monospace</string>
  </edit>
</match>
```

### 主题配置

- `themes/onedark.yml`

```yaml
# one drak
colors:
  # Default colors
  primary:
    background: '0x282C34'
    foreground: '0xabb2bf'

  # Normal colors
  normal:
    black:   '0x1e2127'
    red:     '0xe06c75'
    green:   '0x98c379'
    yellow:  '0xd19a66'
    blue:    '0x61afef'
    magenta: '0xc678dd'
    cyan:    '0x56b6c2'
    white:   '0xabb2bf'

  # Bright colors
  bright:
    black:   '0x5c6370'
    red:     '0xe06c75'
    green:   '0x98c379'
    yellow:  '0xd19a66'
    blue:    '0x61afef'
    magenta: '0xc678dd'
    cyan:    '0x56b6c2'
    white:   '0xffffff'
```

- `themes/onelight.yml`

```yaml
# One Light
colors:
  primary:
    background: '0xfafafa'
    foreground: '0x2a2b33'

  normal:
    black:   '0x000000'
    red:     '0xde3d35'
    green:   '0x3e953a'
    yellow:  '0xa06600'
    blue:    '0x2f5af3'
    magenta: '0xa00095'
    cyan:    '0x3e953a'
    white:   '0xbbbbbb'

  bright:
    black:   '0x000000'
    red:     '0xde3d35'
    green:   '0x3e953a'
    yellow:  '0xa06600'
    blue:    '0x2f5af3'
    magenta: '0xa00095'
    cyan:    '0x3e953a'
    white:   '0xffffff'
```

## 快捷键


使用 `xxd -psd` 来获取键盘输入的值
或者参照 <https://en.wikipedia.org/wiki/ASCII>

    ^b  | C-b  |  02

### mac 下输入法退格键导致的错误   

输入法backspace会删除已输入内容 bug [issues:1606](https://github.com/alacritty/alacritty/issues/1606)

官方给出的方案为 

```toml 
key_bindings:
  - { key: Back, action:  ReceiveChar}
```

> 官方对连体字解决应对非常的消极

### mac 下的 alt 键

### tmux

这里使用了 [Oh my tmux!](https://github.com/gpakosz/.tmux.git), 则修改 `~/.tmux.conf.local`

tmux 配置追加
```
# 切换 status 的显示与否   
bind -r t set-option status
```

进入 `~/.config/alacritty/`, 创建 `key_tmux.toml`

```toml
key_bindings:
  - { key: W, mods: Command, chars: "\x02x" } # ^b x

  - { key: M,        mods: Command,       chars: "\x02s" }   # ^b s session-list
  - { key: M,        mods: Command|Shift, chars: "\x02t" }   # ^b t toggle status

  - { key: H, mods: Alt, chars: "\x02h" } # ^b h  # 切换pane
  - { key: J, mods: Alt, chars: "\x02j" } # ^b j
  - { key: K, mods: Alt, chars: "\x02k" } # ^b k
  - { key: L, mods: Alt, chars: "\x02l" } # ^b l
  
  - { key: H, mods: Alt|Shift, chars: "\x02H" } # ^b H  # resize
  - { key: J, mods: Alt|Shift, chars: "\x02J" } # ^b J
  - { key: K, mods: Alt|Shift, chars: "\x02K" } # ^b K
  - { key: L, mods: Alt|Shift, chars: "\x02L" } # ^b L
  
  - { key: D,        mods: Command,       chars: "\x02\x5f" }   # ^b _ vSplit window
  - { key: D,        mods: Command|Shift, chars: "\x02\x2d" }   # ^b - hSplit window

  - { key: J,        mods: Command,       chars: "\x02\x08" }   # ^b ^h 切换 tab prev
  - { key: K,        mods: Command,       chars: "\x02\x0c" }   # ^b ^l 切换 tab next

  - { key: LBracket, mods: Command,       chars: "\x02\x5b" }   # ^b [ for scroll mode, use q exit
  - { key: T,        mods: Command,       chars: "\x02\x63" }   # ^b t 新建 tab

  - { key: Key1,     mods: Command,       chars: "\x021"    }   # ^b 1 切换 tab1
  - { key: Key2,     mods: Command,       chars: "\x022"    }   # ^b 2
  - { key: Key3,     mods: Command,       chars: "\x023"    }   # ^b 3
  - { key: Key4,     mods: Command,       chars: "\x024"    }   # ^b 4
  - { key: Key5,     mods: Command,       chars: "\x025"    }   # ^b 5
  - { key: Key6,     mods: Command,       chars: "\x026"    }   # ^b 6
  - { key: Key7,     mods: Command,       chars: "\x027"    }   # ^b 7
  - { key: Key8,     mods: Command,       chars: "\x028"    }   # ^b 8
  - { key: Key9,     mods: Command,       chars: "\x029"    }   # ^b 9
```

在 `alacritty.toml` 中追加导入

```toml
import:
  - ~/.config/alacritty/keymaps/tmux_keymap.yml
```

## mac 下的字体问题

alacritty `0.11.0.dev` 版本开始, 去除了 `font.use_thin_strokes` 支持mac 系统 `AppleFontSmoothing` 字体渲染设定
使用命令设置 `org。alacritty` 字体关闭

```sh
# 设定 alacritty
defaults write org.alacritty AppleFontSmoothing -int 0

# 或者
# 全局设定
defaults write -g AppleFontSmoothing -int 0
````

**参数:**

0. 禁用字体平滑
1. 启用浅字体平滑
2. 启用默认中等平滑
3. 启用强平滑。

> 旧方案  
> 修改方法.可以参考 [issues#4616](https://github.com/alacritty/alacritty/issues/4616#issuecomment-889203595)

## TrueColor 真彩终端支持

```bash
curl -s https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh >24-bit-color.sh
bash 24-bit-color.sh
```

![color](https://user-images.githubusercontent.com/161548/128653955-45b190c8-a5b8-4c37-9a69-67551cd955ac.png)

### alacritty 支持

给 alacritty 追加环境变量

```toml
# ~/.config/alacritty/alacritty.toml
env:
  TERM: xterm-256color
```

### tmux 支持

修改 ~/.tmux.conf (or ~/.config/tmux/tmux.conf):

> 如果使用了 [Oh my tmux!](https://github.com/gpakosz/.tmux.git), 则修改 `~/.tmux.conf.local`
> 阅读 [Oh my tmux](../tmux/README.md)

```bash
# 支持 256color
set -g default-terminal "tmux-256color"
set -ga terminal-overrides ',xterm-256color:Tc'
# 支持 bold,italic undercurl support
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0
```

**参考**

> <https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6>


### 检查字体支持

```bash
echo -e '\e[1mbold\e[22m'echo -e '\e[2mdim\e[22m'
echo -e '\e[3mitalic\e[23m'
echo -e '\e[4munderline\e[24m'
echo -e '\e[4:1mthis is also underline (new in 0.52)\e[4:0m'
echo -e '\e[21mdouble underline (new in 0.52)\e[24m'
echo -e '\e[4:2mthis is also double underline (new in 0.52)\e[4:0m'
echo -e '\e[4:3mcurly underline (new in 0.52)\e[4:0m'
echo -e '\e[5mblink (new in 0.52)\e[25m'
echo -e '\e[7mreverse\e[27m'
echo -e '\e[8minvisible\e[28m <- invisible (but copy-pasteable)'
echo -e '\e[9mstrikethrough\e[29m'
echo -e '\e[53moverline (new in 0.52)\e[55m'

echo -e '\e[31mred\e[39m'
echo -e '\e[91mbright red\e[39m'
echo -e '\e[38:5:42m256-color, de jure standard (ITU-T T.416)\e[39m'
echo -e '\e[38;5;42m256-color, de facto standard (commonly used)\e[39m'
echo -e '\e[38:2::240:143:104mtruecolor, de jure standard (ITU-T T.416) (new in 0.52)\e[39m'
echo -e '\e[38:2:240:143:104mtruecolor, rarely used incorrect format (might be removed at some point)\e[39m'
echo -e '\e[38;2;240;143;104mtruecolor, de facto standard (commonly used)\e[39m'

echo -e '\e[46mcyan background\e[49m'
echo -e '\e[106mbright cyan background\e[49m'
echo -e '\e[48:5:42m256-color background, de jure standard (ITU-T T.416)\e[49m'
echo -e '\e[48;5;42m256-color background, de facto standard (commonly used)\e[49m'
echo -e '\e[48:2::240:143:104mtruecolor background, de jure standard (ITU-T T.416) (new in 0.52)\e[49m'
echo -e '\e[48:2:240:143:104mtruecolor background, rarely used incorrect format (might be removed at some point)\e[49m'
echo -e '\e[48;2;240;143;104mtruecolor background, de facto standard (commonly used)\e[49m'

echo -e '\e[21m\e[58:5:42m256-color underline (new in 0.52)\e[59m\e[24m'
echo -e '\e[21m\e[58;5;42m256-color underline (new in 0.52)\e[59m\e[24m'
echo -e '\e[4:3m\e[58:2::240:143:104mtruecolor underline (new in 0.52) (*)\e[59m\e[4:0m'
echo -e '\e[4:3m\e[58:2:240:143:104mtruecolor underline (new in 0.52) (might be removed at some point) (*)\e[59m\e[4:0m'
echo -e '\e[4:3m\e[58;2;240;143;104mtruecolor underline (new in 0.52) (*)\e[59m\e[4:0m'
```

[![j13Pxg.jpg](https://s1.ax1x.com/2022/07/02/j13Pxg.jpg)](https://imgtu.com/i/j13Pxg)


# key 

- `sudo libinput debug-events --show-keycodes`
- wev
- xxd -psd
