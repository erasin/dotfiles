# 复制文件
# cp ./*.service ~/.config/systemd/user/

systemctl --user enable aria2

ln -s ~/.config/systemd/user/cliphist.service  ~/.config/systemd/user/niri.service.wants/cliphist.service
ln -s ~/.config/systemd/user/swayidle.service  ~/.config/systemd/user/niri.service.wants/swayidle.service
ln -s ~/.config/systemd/user/swaync.service  ~/.config/systemd/user/niri.service.wants/swaync.service
ln -s ~/.config/systemd/user/swww.service  ~/.config/systemd/user/niri.service.wants/swww.service
ln -s ~/.config/systemd/user/waybar.service  ~/.config/systemd/user/niri.service.wants/waybar.service 
