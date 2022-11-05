#!/bin/bash

# /usr/bin/pipewire &
# /usr/bin/pipewire-pulse &
# /usr/bin/pipewire-alsa &
# /usr/bin/pipewire-media-session &

session=${1:-*}

message="Available wm's: i3	|	hypr	|	herbstluftwm	|	xfce	|	sowm	|	awesome	|	qtile"

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources


# export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
# export QT_STYLE_OVERRIDE=""
# export QT_QPA_PLATFORMTHEME=qt5ct

case $session in
    i3|i3wm		) 
	    xset r rate 300 50 &
	    setxkbmap -option caps:escape &
	    exec i3;;
    hypr		)
	    xset r rate 300 50 &
	    setxkbmap -option caps:escape &
	    exec hypr;;
    herbs|herbstluftwm	)
	    xset r rate 300 50 &
	    setxkbmap -option caps:escape &
	    mpd &
	    udiskie -nTa &
	    connman-gtk &
	    unclutter &
	    dunst &
	    dropbox &
	    syncthing -no-browser & 
	    yams &
	    blueman-applet &
 	    picom -b & 
	    sxhkd &
	    exec herbstluftwm;;
    sowm       	        ) 
	    xset r rate 300 50 &
	    setxkbmap -option caps:escape &
	    mpd &
	    udiskie -nTa &
	    connman-gtk &
	    unclutter &
	    dunst &
	    dropbox &
	    syncthing -no-browser & 
	    yams &
	    blueman-applet &
 	    picom -b & 
	    sxhkd &
	    fehbg &
	    exec sowm;;
    xfce|xfce4         ) 
	    exec startxfce4;;
    awesome		) 
	    xset r rate 300 50 &
	    setxkbmap -option caps:escape &
	    mpd &
	    udiskie -nTa &
	    connman-gtk &
	    unclutter &
	    dunst &
	    dropbox &
	    syncthing -no-browser & 
	    yams &
	    blueman-applet &
 	    picom -b & 
	    sxhkd &
	    exec awesome;;
    qtile		) 
	    xset r rate 300 50 &
	    setxkbmap -option caps:escape &
	    mpd &
	    udiskie -nTa &
	    connman-gtk &
	    unclutter &
	    dunst &
	    dropbox &
	    syncthing -no-browser & 
	    yams &
	    blueman-applet &
 	    picom -b & 
	    sxhkd &
	    exec qtile start;;
    *                 	) 
	    echo $message;;
esac
