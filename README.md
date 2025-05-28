# README

**Wayland**

- [niri](https://github.com/YaLTeR/niri) wayland 窗口管理
- [waybar](https://github.com/Alexays/Waybar) bar 顶部小部件
- [eww](https://github.com/elkowar/eww) 界面小部件
- [way-edges](https://github.com/way-edges/way-edges) 边缘小部件
- [fuzzel](https://github.com/catppuccin/fuzzel) dmenu 菜单搜索
- [mako](https://github.com/emersion/mako) 轻量通知管理
- [swww](https://github.com/LGFae/swww) 壁纸
- [hypridle](https://wiki.hyprland.org/Hypr-Ecosystem/hypridle/) idle 空闲管理守护进程
- [swayidle]()
- [hyprlock](https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/) 锁屏
- ~~[swaylock](https://github.com/swaywm/swaylock) 锁屏~~

**Terminal**

- [zsh](https://github.com/zsh-users/zsh) shell
- [alacritty](https://github.com/alacritty/alacritty) GPU终端
- [kitty](https://sw.kovidgoyal.net/kitty/) 终端 
- [tmux](https://github.com/tmux/tmux/wiki) [doc](https://tmuxcheatsheet.com/) 终端多路复用
- [helix](https://github.com/helix-editor/helix) 终端编辑器
- [aria2](https://github.com/aria2/aria2) 下载
  - yt-dlp
  - lux
- [lyrics-next](https://github.com/erasin/lyrics-next) 终端歌词 for mpris 
- [chafa](https://github.com/hpjansson/chafa) yazi image 预览

**Script required**

- [slurp] wayland 交互区域
- [wl-screenrec](https://github.com/russelltg/wl-screenrec) wayland 屏幕录制
- [grim] wayland 截图 `grim -g "$(slurp)"`
- [wl-clipboard](https://github.com/bugaevc/wl-clipboard) 剪贴板
- [cava] 谐振器
- [neofetch](https://github.com/dylanaraps/neofetch) 系统信息
- [uair](https://github.com/metent/uair) 番茄时钟
- [jq](https://jqlang.org/) json 解析
- [fd](https://github.com/sharkdp/fd) 替代 find
- [rg](https://github.com/BurntSushi/ripgrep) 替代 grep
- [sd](https://github.com/chmln/sd) 替代 sed
- [procs](https://github.com/dalance/procs) 替代 ps
- [delta](https://github.com/dandavison/delta/) git diff

**gnome**

设置 gnome setting 在非 gnome 环境中使用，cp `/usr/share/applications/org.gnome.Settings.desktop` 到 `~/.local/share/applications` 中，修改 `exec`

```shell
env XDG_CURRENT_DESKTOP=GNOME gnome-control-center 
```
