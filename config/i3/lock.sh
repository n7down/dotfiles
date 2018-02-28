#!/bin/bash
ICON=$HOME/.config/i3/images/circlelock.png
#ICON=$HOME/.bin/images/lock-7.png
TMPBG=/tmp/screen.png
scrot /tmp/screen.png
convert $TMPBG -scale 10% -scale 1000% $TMPBG
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG
i3lock -u -i $TMPBG
