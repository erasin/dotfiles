#!/usr/bin/env bash
# sotto 语音输入服务状态监控和切换脚本

SERVICE="sotto.service"

get_status() {
    if systemctl --user is-active "$SERVICE" &>/dev/null; then
        echo "active"
    else
        echo "inactive"
    fi
}

do_start() {
    systemctl --user start "$SERVICE"
}

do_stop() {
    systemctl --user stop "$SERVICE"
}

case "${1:-status}" in
    status)
        status=$(get_status)
        if [ "$status" = "active" ]; then
            printf '{"text": "", "alt": "active", "tooltip": "running", "class": "active"}'
        else
            printf '{"text": "", "alt": "inactive", "tooltip": "stopped", "class": "inactive"}'
        fi
        ;;
    toggle)
        if [ "$(get_status)" = "active" ]; then
            do_stop
        else
            do_start
        fi
        ;;
    start)
        do_start
        ;;
    stop)
        do_stop
        ;;
    *)
        echo "Usage: $0 {status|toggle|start|stop}"
        exit 1
        ;;
esac
