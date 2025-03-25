#!/bin/bash
#
# 
# for i in /sys/class/hwmon/hwmon*/temp*_input; do echo "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*})) $(readlink -f $i)"; done
#

# GPU 温度路径（根据你的硬件调整）
GPU_TEMP_PATH="/sys/devices/pci0000:00/0000:00:03.1/0000:2b:00.0/0000:2c:00.0/0000:2d:00.0/hwmon/hwmon1/temp2_input"
# CPU 温度路径（根据你的硬件调整）
CPU_TEMP_PATH="/sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon2/temp1_input"
# NVME 硬盘温度
NVME_TEMP_PATH="/sys/devices/pci0000:00/0000:00:01.1/0000:01:00.0/nvme/nvme0/hwmon0/temp1_input"

# 读取温度并转换为摄氏度
gpu_temp=$(cat $GPU_TEMP_PATH 2>/dev/null || echo 0)
cpu_temp=$(cat $CPU_TEMP_PATH 2>/dev/null || echo 0)
nvme_temp=$(cat $NVME_TEMP_PATH 2>/dev/null || echo 0)
gpu_temp_c=$((gpu_temp / 1000))
cpu_temp_c=$((cpu_temp / 1000))
nvme_temp_c=$((nvme_temp / 1000))

# 计算温度百分比（假设 GPU 最高 110°C，CPU 最高 95°C）
GPU_MAX=110
CPU_MAX=95
gpu_percent=$(( (gpu_temp_c * 100) / GPU_MAX ))
cpu_percent=$(( (cpu_temp_c * 100) / CPU_MAX ))
percentage=$(( gpu_percent > cpu_percent ? gpu_percent : cpu_percent ))  # 取较高者
percentage=$(( percentage > 100 ? 100 : percentage ))  # 限制最大 100%

# 生成 JSON 输出
echo "{\"text\":\"GPU $gpu_temp_c°C\", \"alt\":\"CPU $cpu_temp_c°C\", \"tooltip\":\" GPU: $gpu_temp_c°C (${gpu_percent}%)\r CPU: $cpu_temp_c°C (${cpu_percent}%)\rNVME: $nvme_temp_c°C\", \"percentage\":$percentage, \"class\":\"temperature\"}"
