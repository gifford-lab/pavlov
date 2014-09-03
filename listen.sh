#!/bin/bash
count=-1
lastcount=-1

while true; do
    year=`date | cut -f 7 -d " "`
    count=`wget -qq -O - "http://lists.csail.mit.edu/pipermail/vultures/${year}/date.html" | grep -oP "<b>Messages:</b> \d+<p>" | cut -f 2 -d " " | cut -f 1 -d "<"`
    if [ $count -ne $lastcount ]; then
	echo "new! now at "$count
	mplayer bell-ringing-04.mp3
	wget -qq -O - "http://lists.csail.mit.edu/pipermail/vultures/${year}/date.html" | grep HREF | tail -1 | cut -f 2 -d "]" | sed 's/&.*\;//g' | xargs -I {} espeak -v en-us -s 140 -p 50 {}
    else
	sleep 5s
    fi
    lastcount=$count
done


