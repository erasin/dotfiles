#!/bin/sh

install_fcitx() {
  yay -R ibus ibus-rime 
  yay -S fcitx5 fcitx5-qt fcitx5-gtk fcitx5-rime fcitx5-configtool && fcitx5
}


install_ibus() {
  yay -R fcitx5 fcitx5-qt fcitx5-gtk fcitx5-rime fcitx5-configtool && fcitx5
  yay -S ibus ibus-rime 
}

case $1 in 
  --fcitx) install_fcitx ;;
  --ibus) install_ibus ;;
  *) echo "nothing";;
esac 
