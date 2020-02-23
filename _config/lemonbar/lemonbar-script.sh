#!/bin/sh

clock() {
	DATE=$(date "+%a %m-%d-%Y")
	TIME=$(date "+%I:%M:%S %p")
	echo -e -n "${DATE} ${TIME}"
}

# get the battery capacity and status
battery() {
	BATC=/sys/class/power_supply/BAT0/capacity
	BATS=/sys/class/power_supply/BAT0/status
	TEMPBAT=$(cat $BATC)	

	test "`cat $BATS`" = "Charging" && CHARGE="+" || CHARGE="-"
	test "$TEMPBAT" = "100" && BAT="100" || BAT=$CHARGE$TEMPBAT

	echo -e "BAT: $BAT%"
}

volume() {
	# get master volume level from amixer

	# parse amixer output to get ONLY the level. Will output "84%"
	# we need `uniq` because on some hardware, The master is listed twice in
	# "Front Left" and Front Right" (because laptop speakers I guess)
	amixer get Master | sed -n 's/^.*\[\([0-9]\+\)%.*$/\1/p'| uniq
}

# get ram usage
memused() {
	# store the total and free memory in two variables
	read t f <<< `grep -E 'Mem(Total|Free)' /proc/meminfo |awk '{print $2}'`
	read b c <<< `grep -E '^(Buffers|Cached)' /proc/meminfo |awk '{print $2}'`

	# then, calcultate the percentage of memory used
	bc <<< "100($t -$f -$c -$b) / $t"
}

wifi(){
	WIFIDEVICE=wlp3s0
	WIFISTR=$(iwconfig $WIFIDEVICE | grep "Link" | sed 's/ //g' | sed 's/LinkQuality=//g' | sed 's/\/.*//g')
	if [ ! -z $WIFISTR ] ; then
		WIFISTR=$(( ${WIFISTR} * 100 / 70))
		ESSID=$(iwconfig $WIFIDEVICE | grep ESSID | sed 's/ //g' | sed 's/.*://' | cut -d "\"" -f 2)
		if [ $WIFISTR -ge 1 ] ; then
			echo -e "NET: ${ESSID} (${WIFISTR}%)"
		fi
	fi
}


# display the current desktop
# I II III IV V VI VII VIII IX X
show_workspaces() {
	cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
	tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`

	# Desktop numbers start at 0. if you want desktop 2 to be in second place,
	# start counting from 1 instead of 0. But wou'll lose a group ;)
	for w in `seq 0 $((cur - 1))`; do line="${line}="; done

	# enough =, let's print the current desktop
	line="${line}|"

	# En then the other groups
	for w in `seq $((cur + 2)) $tot`; do line="${line}="; done

	# don't forget to print that line!
	echo -e $line
}

current_workspace() {
	cur=`bspc query -D -d --names`
	echo -e $cur
}

display_workspaces() {
	cur=`bspc query -D -d --names`
	act=`bspc query -D -d .occupied --names`
	
	w+=" "
	for i in $act
	do
		if [ $i == $cur ]
		then 
			w+="$i "
		else
			w+="$i "
		fi
	done
	echo -e $w
}

title() {
	echo -e "\uf108"
}

# This loop will fill a buffer with our infos, and output it to stdout.
while :; do
	echo -e "%{l}%{B#051014} $(display_workspaces)" "%{r}%{F#E1E1E1}%{B#051014}$(wifi) | $(battery) | $(clock) "
    sleep 1
done
