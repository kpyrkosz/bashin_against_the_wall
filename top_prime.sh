#!/bin/bash

#Finds biggest prime that fits inside unsigned long long C type (64 bit without sign)

ull_max=$(bc <<< "2^64-1")
current_val=$ull_max

while [[ true ]]; do
	first_prime_factor=$(factor $current_val | cut -d' ' -f2)
	if [[ $current_val == $first_prime_factor ]]; then
		echo "$current_val is a biggest 64-bit prime!"
		exit 0
	fi
	current_val=$(bc <<< "$current_val - 2")
done
