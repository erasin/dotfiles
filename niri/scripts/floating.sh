#!/bin/bash
 
is_floating=$(niri msg --json focused-window|jq -r '.is_floating')
niri msg action toggle-window-floating

if [[ "$is_floating" = "false" ]]; then
  niri msg action set-window-height "50%"
  niri msg action center-column
else
  niri msg action set-window-height "100%"
fi
