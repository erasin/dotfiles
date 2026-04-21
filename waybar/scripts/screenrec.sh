#!/bin/bash

STATE_FILE="/tmp/wf-recorder-state"
OUTPUT_FILE="$HOME/Videos/record/rec-$(date +'%Y%m%d-%H%M%S').mp4"

start_recording() {
    wf-recorder -a -f "$OUTPUT_FILE" &
    echo $! > "$STATE_FILE"
}

stop_recording() {
    if [[ -f "$STATE_FILE" ]]; then
        pid=$(cat "$STATE_FILE")
        kill "$pid"
        rm "$STATE_FILE"
        notify-send "录制已停止" "文件保存在: $OUTPUT_FILE"
    fi
}

toggle_recording() {
    if [[ -f "$STATE_FILE" ]]; then
        stop_recording
    else
        start_recording
    fi
}

select_area() {
    if [[ -f "$STATE_FILE" ]]; then
        stop_recording
    fi

    area=$(slurp)
    if [[ -n "$area" ]]; then
        notify-send "选择区域" "$area"
        OUTPUT_FILE="$HOME/Videos/screenrec-$(date +'%Y%m%d-%H%M%S').mp4"
        wf-recorder -a -g "$area" -f "$OUTPUT_FILE" &
        echo $! > "$STATE_FILE"
    else
        notify-send "取消选择区域"
    fi
}

status_recording() {
    if [[ -f "$STATE_FILE" ]]; then
        echo '{"text": "●", "tooltip": "录制中", "class": "recording"}'
    else
        echo '{"text": "", "tooltip": "未录制", "class": "stopped"}'
    fi
}

case "$1" in
    toggle)
        toggle_recording
        ;;
    select-area)
        select_area
        ;;
    status)
        status_recording
        ;;
    *)
        echo "用法: $0 {toggle|select-area|status}"
        exit 1
        ;;
esac
