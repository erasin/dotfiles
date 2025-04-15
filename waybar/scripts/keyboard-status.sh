#!/bin/bash

# numlock=$(cat /sys/class/leds/input11::numlock/brightness)
capslock=$(cat /sys/class/leds/input11::capslock/brightness)

caps="󰘲"
class="unlock"
if [[ "${capslock}" == "1" ]]; then
  caps="󰘲"
  class="lock"
fi

echo "{\"text\":\"$caps\", \"class\":\"$class\"}"
