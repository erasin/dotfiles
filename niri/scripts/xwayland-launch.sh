#!/bin/sh

if [ ! "$#" -gt 0 ]; then  
    echo "ERROR: needs at least one argument."  
    exit 1  
fi  

DD=114

while [ -e /tmp/.X11-unix/X$DD ]; do
  DD=$((DD+1))
done

Xwayland :$DD &
sleep 2
env DISPLAY=:$DD i3 &

arg="$1"  
args="$@"
sleep 2
  
if [ "$arg" = "foo" ]; then  
    env XDG_SESSION_TYPE=x11 QT_QPA_PLATFORM=xcb WAYLAND_DISPLAY= DISPLAY=:$DD foo &
else  
    env DISPLAY=:$DD $args &
fi
