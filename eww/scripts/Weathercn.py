#!/usr/bin/python3
import requests
from datetime import datetime, timedelta
import os
import json


def get_weather(api_key, city):
    # 获取当前时间
    today = datetime.now().strftime("%Y-%m-%d")

    # 构建API请求URL
    url = f"https://restapi.amap.com/v3/weather/weatherInfo?key={api_key}&city={city}&extensions=all&output=json"

    # 发送请求
    response = requests.get(url)
    print(url)

    if response.status_code == 200:
        data = response.json()
        forecasts = data["forecasts"]

        # 打印近一周的天气情况
        for forecast in forecasts:
            date = forecast["reporttime"]
            print(f"日期：{date}")
            for cast in forecast["casts"]:
                print(
                    f"日期：{cast['date']}, 白天天气：{cast['dayweather']}, 夜间天气：{cast['nightweather']}, 最高温度：{cast['daytemp']}℃, 最低温度：{cast['nighttemp']}℃"
                )
            print("------------------------------")
    else:
        print("请求失败")


def get_api_key():
    # 读取API密钥文件
    key_file = os.path.expanduser("~/.config/apikeys/gaode.txt")
    with open(key_file, "r") as f:
        api_key = f.read().strip()
    return api_key


if __name__ == "__main__":
    # 替换为你的API密钥
    api_key = get_api_key()

    # 替换为你要查询的城市名称
    city = "杭州"

    get_weather(api_key, city)
