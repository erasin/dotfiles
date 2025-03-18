#!/bin/bash

# 获取通知历史记录数量
count=$(makoctl history | jq ".data[0] | length")

# 如果有通知未读，显示数量；否则为空
if [[ $count -gt 0 ]]; then
    echo -e "{ \"text\":\"$count\", \"tooltip\":\"Unread notifications: $count\", \"alt\":\"notification\", \"class\":\"notification\" }"
else
    echo '{"text": "0", "tooltip": "No notifications","alt":"none", "class":"none" }'
fi
