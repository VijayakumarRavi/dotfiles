#!/bin/sh
export GDK_BACKEND=x11

/home/vijay/.local/bin/set_wallpaper   "/usr/share/backgrounds/vijay-wallpapers/Super Heros/wallpaperflare.com_wallpaper (53).jpg" &
#/home/vijay/.local/bin/dwm_bar &
slstatus &
# xcompmgr &
picom &
dunst &
xset r rate 300 50 &
sxhkd &
numlockx on
bluetoothctl power on &
bluetoothctl discoverable on &
bluetoothctl scan on &
bluetoothctl pairable on &
#xmodmap ~/.config/xmodmap/Xmodmap &
unclutter &

xrandr --output VGA-1 --mode 1440x900 --rate 74.98
xrandr --output HDMI-1 --mode 1920x1080 --rate 74.98

# exec dwm > /dev/null 2>&1
# if dwm exits 0, restart -- this allows hot reloading of config.h
while type dwm >/dev/null ; do dwm && continue || break ; done
