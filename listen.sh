#!/bin/bash
count=-1
lastcount=-1

while true; do
    count=`wget -qq -O - "http://lists.csail.mit.edu/pipermail/vultures/2014/date.html" | grep -oP "<b>Messages:</b> \d+<p>" | cut -f 2 -d " " | cut -f 1 -d "<"`
    if [ $count -ne $lastcount ]; then
	echo "new! now at "$count
	aplay bell-ringing-04.wav
    fi
    lastcount=$count
    sleep 10s
done

