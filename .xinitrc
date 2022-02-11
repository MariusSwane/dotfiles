#!/bin/bash

# /usr/bin/pipewire &
# /usr/bin/pipewire-pulse &
# /usr/bin/pipewire-alsa &
# /usr/bin/pipewire-media-session &

# Here i3 is default
session=${1:-i3}

message="Available wm's: i3	|	sowm	|	awesom	|	qtile	|	dwm	"

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

case $session in
    i3|i3wm		) exec i3;;
    sowm       	        ) exec sowm;;
    #xfce|xfce4         ) exec startxfce4;;
    awesome		) exec awesome;;
    qtile		) exec qtile;;
    dwm			) exec dwm;;
    *                 	) echo $message;;
esac
