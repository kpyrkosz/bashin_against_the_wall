#!/bin/bash

#How many six digit numbers n satisfy conditions:
# - n is a perfect square
# - last 3 digits are one bigger than to first 3

for i in {100..998}; do
	val="$i$((i+1))"
	bcres=$(bc <<< "$val - sqrt($val) * sqrt($val)")
	if [[ $bcres == 0 ]]; then
		echo $val
	fi
done
