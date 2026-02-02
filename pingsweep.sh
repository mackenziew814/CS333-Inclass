#!/bin/bash
# Ping sweep the Lab

pingsweep() {
	echo "Starting ping sweep..."
	base="onyxnode"
	for q in {1..200}
		do
			curr="$base$q"
			ping -c 1 $curr >> ping.log
	done
	echo "Done! Check the ping.log :)"
}

while getopts ":ph" flag; do 
	case $flag in 
		h) # handle -h flag (displays usage)
			echo "Help: This script accepts -p to perform a ping sweep and -h for help."
			;;
		p) # handle -p flag (performs ping sweep)
			pingsweep 
			;;  
	esac 
done

