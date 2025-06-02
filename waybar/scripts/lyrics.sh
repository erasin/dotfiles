#!/bin/bash

id=$(niri msg --json windows | jq -r '.[] | select(.title=="Lyrics").id')

if [ -z $id ];then
  niri msg action spawn -- alacritty -o window.dimensions.columns=40 -o window.dimensions.lines=40 -T "Lyrics" -e lyrics-next;
else
  niri msg action close-window --id $id;
fi
