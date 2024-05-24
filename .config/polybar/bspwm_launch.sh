#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Left
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload -c ~/.config/polybar/bspwm_config.ini left &
  done
else
  polybar --reload -c ~/.config/polybar/bspwm_config.ini left &
fi

# Center
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload -c ~/.config/polybar/bspwm_config.ini center &
  done
else
  polybar --reload -c ~/.config/polybar/bspwm_config.ini center &
fi

# Right
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload -c ~/.config/polybar/bspwm_config.ini right &
  done
else
  polybar --reload -c ~/.config/polybar/bspwm_config.ini right &
fi

# Top
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload -c ~/.config/polybar/bspwm_config.ini top &
  done
else
  polybar --reload -c ~/.config/polybar/bspwm_config.ini top &
fi
