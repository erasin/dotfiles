

## bar

- [waybar](https://github.com/Alexays/Waybar) [wiki](https://github.com/Alexays/Waybar/wiki/)

```bash
ln -s /usr/lib/systemd/user/waybar.service ~/.config/systemd/user/niri.service.wants/
```

- [eww](https://github.com/elkowar/eww) [book](https://elkowar.github.io/eww/configuration.html) [guide](https://dharmx.is-a.dev/eww-powermenu/)


## wallpaper

- [swaybg](https://github.com/swaywm/swaybg)

```bash
cd ~/.config/systemd/user
touch swaybg.services

# link
ln -s ~/.config/systemd/user/swaybg.service ~/.config/systemd/user/niri.service.wants/
```

```ini
[Unit]
PartOf=graphical-session.target
After=graphical-session.target
Requisite=graphical-session.target

[Service]
ExecStart=/usr/bin/swaybg -m fill -i "%h/Pictures/wallpaper/38598.jpg"
Restart=on-failure
```

- [swww](https://github.com/LGFae/swww) 


```bash
cd ~/.config/systemd/user
touch swww.services

# link
ln -s ~/.config/systemd/user/swww.service ~/.config/systemd/user/niri.service.wants/
```

```ini
[Unit]
PartOf=graphical-session.target
After=graphical-session.target
Requisite=graphical-session.target

[Service]
ExecStart=swww-daemon
Restart=on-failure
```



```kdl
spawn-at-startup "swww img ~/Pictures/wallpaper/a1.jpg"
```


## notify 

- swaync 

```bash
ln -s /usr/lib/systemd/user/swaync.service ~/.config/systemd/user/niri.service.wants/
```

- mako


## clip 

- wl-clipboard
- cliphist 管理器


- https://github.com/YaLTeR/niri/wiki/Example-systemd-Setup
- https://github.com/swaywm/sway/wiki/i3-Migration-Guide

- https://github.com/nebulosa2007/archinstallbtfrs/blob/master/Archive
- https://github.com/rxyhn/tokyo/tree/main/config/eww



## soft


- https://wiki.archlinux.org/title/Wayland

**electron version**

`~/.config/electron-flags.conf`

```
# version >= 13
--enable-features=UseOzonePlatform
--ozone-platform=wayland

# version > 17
--enable-features=WaylandWindowDecorations

# version > 20
--ozone-platform-hint=auto
```

chrome 

--enable-features=UseOzonePlatform
--ozone-platform=wayland

