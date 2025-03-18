#!/bin/bash

# 默认参数
CITY=""
API_KEY=""
KEY_FILE=""
DAY=1
WAYBAR=false

# 天气图标映射
weather_icon() {
    case "$1" in
        "晴") echo "󰖙" ;;
        "少云") echo "󰖐" ;;
        "晴间多云") echo "󰖕" ;;
        "多云") echo "󰼯" ;;
        "阴") echo "󰼰" ;;
        "有风"|"平静"|"微风"|"和风"|"清风") echo "" ;;
        "强风/劲风"|"疾风"|"大风") echo "󰖝" ;;
        "烈风"|"风暴"|"狂爆风") echo "󰼸" ;;
        "飓风"|"热带风暴"|"龙卷风") echo "󰢘" ;;
        "霾"|"中度霾"|"重度霾"|"严重霾") echo "󰖑" ;;
        "阵雨") echo "󰖓" ;;
        "雷阵雨"|"雷阵雨并伴有冰雹") echo "󰙾" ;;
        "毛毛雨/细雨"|"雨"|"小雨") echo "󰖒" ;;
        "中雨"|"大雨"|"小雨-中雨"|"中雨-大雨"|"大雨-暴雨") echo "󰖗" ;;
        "暴雨"|"大暴雨"|"特大暴雨"|"强阵雨"|"强雷阵雨"|"极端降雨") echo "󰖖" ;;
        "雨雪天气"|"雨夹雪"|"阵雨夹雪"|"冻雨") echo "󰙿" ;;
        "阵雪") echo "󰼴" ;;
        "雪"|"小雪"|"中雪"|"小雪-中雪") echo "󰖘" ;;
        "大雪"|"暴雪"|"中雪-大雪"|"大雪-暴雪") echo "󰼶" ;;
        "浮尘"|"扬沙"|"沙尘暴"|"强沙尘暴") echo "" ;;
        "雾"|"浓雾"|"强浓雾"|"轻雾"|"大雾"|"特强浓雾") echo "󰖑" ;;
        "热") echo "󰖙" ;;
        "冷") echo "" ;;
        *) echo "$1" ;;
    esac
}

# 解析命令行参数
while [[ $# -gt 0 ]]; do
    case $1 in
        -c|--city)
            CITY="$2"
            shift 2
            ;;
        -k|--key)
            API_KEY="$2"
            shift 2
            ;;
        --key-file)
            KEY_FILE="$2"
            shift 2
            ;;
        -d|--day)
            DAY="$2"
            shift 2
            ;;
        --waybar)
            WAYBAR=true
            shift
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# 获取 API Key
if [[ -z "$API_KEY" ]]; then
    if [[ -n "$KEY_FILE" && -f "$KEY_FILE" ]]; then
        API_KEY=$(cat "$KEY_FILE" | tr -d '\n')
    fi
fi

if [[ -z "$API_KEY" || -z "$CITY" ]]; then
    echo "API key 和 city 不能为空"
    exit 1
fi

# 调用高德 API
URL="https://restapi.amap.com/v3/weather/weatherInfo?key=${API_KEY}&city=${CITY}&extensions=all&output=json"
RESPONSE=$(curl -s "$URL")

# 检查 API 响应状态
STATUS=$(echo "$RESPONSE" | jq -r '.status')
if [[ "$STATUS" != "1" ]]; then
    echo "获取天气数据失败"
    exit 1
fi

# 提取天气数据
DATE=$(echo "$RESPONSE" | jq -r ".forecasts[0].casts[$((DAY-1))].date")
WEEK=$(echo "$RESPONSE" | jq -r ".forecasts[0].casts[$((DAY-1))].week")
WEATHER=$(echo "$RESPONSE" | jq -r ".forecasts[0].casts[$((DAY-1))].dayweather")
TEMP=$(echo "$RESPONSE" | jq -r ".forecasts[0].casts[$((DAY-1))].daytemp")
WIND=$(echo "$RESPONSE" | jq -r ".forecasts[0].casts[$((DAY-1))].daywind")
POWER=$(echo "$RESPONSE" | jq -r ".forecasts[0].casts[$((DAY-1))].daypower")

# 获取天气图标
ICON=$(weather_icon "$WEATHER")

# 格式化输出
if $WAYBAR; then
    # 输出为 Waybar JSON 格式
    echo "{ \"text\": \"${ICON} ${WEATHER} ${TEMP}󰔄\", \"alt\": \"${WIND} ${POWER}\", \"tooltip\": null, \"class\": \"wayinfo-weather-sun\", \"percentage\": 0 }"
else
    # 输出为普通格式
    echo "日期：$DATE"
    echo "星期：$WEEK"
    echo "天气：$WEATHER"
    echo "温度：$TEMP°C"
    echo "风向：$WIND"
    echo "风力：$POWER"
fi
