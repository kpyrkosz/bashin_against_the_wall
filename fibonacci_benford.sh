#!/bin/bash

#Calculates fibonacci-like sequence with given two starting integers and sample count.
#Displays how many times each digit appeared as first in generated sequence
#Example usage: ./this_script 1 1 1000

if [[ $# != 3 ]]; then
	echo "Usage: $0 <starting_a> <starting_b> <sample_count>"
	exit 1
fi
if ! [[ $1 =~ ^[0-9]+$ && $2 =~ ^[0-9]+$ && $3 =~ ^[1-9][0-9]*+$ ]]; then
	echo "Starting values have to be nonnegative, count positive integer"
	exit 1
fi

export BC_LINE_LENGTH=0

a=$1
b=$2
for i in $(seq 1 $3); do
	c=$(bc <<< "$a + $b")
	a=$b
	b=$c
	((first_digits[${c:0:1}]+=1))
done

for index in "${!first_digits[@]}"; do
	echo "Index ${index}, count ${first_digits[$index]}"
done
