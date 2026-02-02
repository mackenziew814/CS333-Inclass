#!/bin/bash

main(){
	echo "This is just a test"
    source ArgumentEcho.sh "$@" # need to pass the arguments over
}

main "$@" #must be included to actually call main otherwise nothing will happen