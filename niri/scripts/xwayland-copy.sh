#!/bin/bash
info=$(niri msg focused-window)
echo $info | awk 1>/tmp/tar_stdout '/Title/ {
    if ($0 ~ /Title: "Xwayland on :[0-9]+"/) {
        port = gensub(/.*:([0-9]+).*/, "\\1", "g", $0)
        if (port ~ /^[0-9]+$/) {
            print port
        } else {
            print "NAN"
        }
    } else {
        print "NAN"
    }
}'

result=$(</tmp/tar_stdout)
if [ "$result" != "NAN" ]; then
    env DISPLAY=:$result xsel -ob | wl-copy
fi
