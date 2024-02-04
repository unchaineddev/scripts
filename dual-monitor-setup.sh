#!/bin/bash

# Check if HDMI-A-0 is connected
if xrandr | grep "HDMI-A-0 connected"; then
    xrandr --output HDMI-A-0 --auto --right-of eDP
else
    xrandr --output HDMI-A-0 --off
fi

