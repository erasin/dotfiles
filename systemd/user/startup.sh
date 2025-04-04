# 复制文件
cp ./*.service ~/.config/systemd/user/

ln -s ~/.config/systemd/user/cliphist.service  ~/.config/systemd/user/niri.service.wants/cliphist.service
ln -s ~/.config/systemd/user/swayidle.service  ~/.config/systemd/user/niri.service.wants/swayidle.service
ln -s ~/.config/systemd/user/swww.service  ~/.config/systemd/user/niri.service.wants/swww.service
ln -s ~/.config/systemd/user/wayedges.service  ~/.config/systemd/user/niri.service.wants/wayedges.service

# ln -s ~/.config/systemd/user/swaync.service  ~/.config/systemd/user/niri.service.wants/swaync.service
ln -s /usr/lib/systemd/user/mako.service ~/.config/systemd/user/niri.service.wants/mako.service
ln -s /usr/lib/systemd/user/waybar.service ~/.config/systemd/user/niri.service.wants/waybar.service

systemctl --user enable aria2
