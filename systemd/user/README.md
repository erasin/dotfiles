# systemd user services

## 安装

```sh
# 复制到用户目录
mkdir -p ~/.config/systemd/user
ln -s /home/erasin/dotfiles/systemd/user/*.service ~/.config/systemd/user/

# 重载 systemd
systemctl --user daemon-reload
```

## 目录结构

```
~/.config/systemd/user/
├── aria2.service        # default.target.wants
├── clash.service        # default.target.wants
├── cliphist.service     # graphical-session.target
├── playerctld.service   # default.target.wants
├── swayidle.service     # graphical-session.target
├── swaync.service       # graphical-session.target
├── swww.service         # graphical-session.target
└── wayedges.service     # graphical-session.target
```

## 常用命令

```sh
# 重载配置
systemctl --user daemon-reload

# 重启服务
systemctl --user restart <service>

# 查看服务状态
systemctl --user status <service>

# 查看服务日志
journalctl --user -u <service> -f
```

## 服务说明

| 服务 | 描述 | 依赖 |
|------|------|------|
| aria2 | BT 下载 daemon | default.target |
| clash | Clash 代理 | network-online.target |
| cliphist | Wayland 剪贴板管理 | graphical-session.target |
| playerctld | MPRIS 媒体播放器追踪 | default.target |
| swayidle | 空闲检测和锁屏 | graphical-session.target |
| swaync | Sway 通知中心 | graphical-session.target |
| swww | 动态壁纸 daemon | graphical-session.target |
| wayedges | Waybar 边缘面板 | graphical-session.target |
