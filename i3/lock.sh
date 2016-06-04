#!/bin/bash
lock_icon=$HOME/Pictures/lock_icons/Lock_Icon.png
tmpbg=/tmp/screen.png
scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
#[[ -f $1 ]] && convert $TMPBG $ICON $1 -gravity center -composite -matte $TMPBG
convert "$tmpbg" "$lock_icon" -gravity center -composite -matte "$tmpbg"
#dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
i3lock -u -i "$tmpbg"
rm "$tmpbg"
