#!/bin/bash

# Here Xfce is kept as default
session=${1:-i3}

message="Available wm's: i3	|	sowm	|	awesom	|	dwm	"

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

case $session in
    i3|i3wm		) exec i3;;
    sowm       	        ) exec sowm;;
    #xfce|xfce4         ) exec startxfce4;;
    awesome		) exec awesome;;
    dwm			) exec dwm;;
    *                 	) echo $message;;
esac
