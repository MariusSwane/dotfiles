#!/bin/bash

# Here Xfce is kept as default
session=${1:-i3}

#message="Available wm's: i3	|	sowm	|	awesom	|	dwm	"

case $session in
    i3|i3wm		) exec i3;;
    sowm       	        ) exec sowm;;
    #xfce|xfce4         ) exec startxfce4;;
    awesome		) exec awesome;;
    dwm			) exec dwm;;
    *                 	) exec $1;;
esac
