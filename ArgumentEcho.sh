#!bin/bash
#outputs each argument using $* and $# to difference in how they are handled by the system
ArgumentEcho(){
	echo "Echo using \$*" #treats as a single arg no delim
	for arg in "$*"
	do
		printf "\n%s\n" "$arg" 
	done
	printf "\n"

	echo "Echo using \$@" #delim via space
	for arg in "$@"
	do
		printf "%s\n" "$arg"
	done
	printf "\n"
}
ArgumentEcho "$@"