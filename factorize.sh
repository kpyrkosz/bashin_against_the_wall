#!/bin/bash

#For every number from 1 to n factorizes n!+1
#Demonstrates usage of `seq` to generate string in form 1*2*3...*n
#Example usage: ./this_script 10

export BC_LINE_LENGTH=0

if [[ $# != 1 ]]; then
	echo "Usage: $0 <n>"
	exit 1
fi

if ! [[ $1 =~ ^[0-9]+$ ]]; then
	echo "argument has to be a number"
	exit 1
fi

for i in $(seq 1 $1); do
	factorized=$((echo -n "1 + " ;seq -s'*' 1 $i) | bc | factor 2>/dev/null)
	if [[ $? != 0 ]]; then
		echo "Unable to factor $i!+1, exiting"
		exit 1
	fi
        echo -e "$i:\t$factorized"
done
