#!/bin/bash

id=$(niri msg --json windows | jq -r '.[] | select(.title=="Lyrics").id')

if [ -z $id ];then
  # alacritty 与 niri 窗口大小处理协议问题？
  # niri msg action spawn -- alacritty -o window.opacity = 0.8 -o window.dimensions.columns=40 -o window.dimensions.lines=20 -T "Lyrics" -e lyrics-next;
  niri msg action spawn -- kitty -T "Lyrics" -e lyrics-next;
else
  niri msg action close-window --id $id;
fi
