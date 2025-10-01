#!/bin/bash

id=$(niri msg --json windows | jq -r '.[] | select(.title=="Rmpc").id')

if [ -z $id ];then
  # alacritty 与 niri 窗口大小处理协议问题？
  # niri msg action spawn -- alacritty -T "Rmpc" -e rmpc;
  niri msg action spawn -- kitty -o confirm_os_window_close=0 -T "Rmpc" -e rmpc;
else
  niri msg action close-window --id $id;
fi
