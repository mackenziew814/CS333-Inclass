#!/bin/bash
# Ping sweep the Lab
PingSweep(){
	base="onyxnode"

	for q in {1..200}
	do
		curr="$base$q"
		ping -n 1 $curr >> ping.log
	done

}
PingSweep


