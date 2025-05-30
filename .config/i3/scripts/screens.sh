#!/usr/bin/env bash

screens="$(xrandr | grep " connected " | awk '{ print$1 }')"

isEDP=false
isHDMI=false
isDP=false

if [[ $screens == *"eDP"* ]]; then
	isEDP=true
fi

if [[ $screens == *"HDMI-A-0"* ]]; then
	isHDMI=true
fi

if [[ $screens == *"DisplayPort-1"* ]]; then
	isDP=true
fi

# Office setup
if [[ $isEDP == true && $isHDMI == true ]]; then
	xrandr --output eDP --rotate normal --output HDMI-A-0 --right-of eDP --rotate normal
fi

# Home setup
if [[ $isEDP == true && $isHDMI == true && $isDP == true ]]; then
	xrandr --output eDP --rotate normal --output HDMI-A-0 --left-of eDP --rotate left --output DisplayPort-1 --left-of HDMI-A-0 --rotate normal
fi

exit 0
