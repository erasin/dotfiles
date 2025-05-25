#!/bin/bash

id=$(niri msg --json windows | jq -r '.[] | select(.title=="Lyrics").id')

if [ -z $id ];then
  niri msg action spawn -- alacritty -T "Lyrics" -e lyrics-next;
else
  niri msg action close-window --id $id;
fi
