#!/bin/bash

#It is pretty easy to proove, using Euclid's theorem, that n! + 1 does not share factors with (n+1)! + 1 for anyinteger n. But maybe it shares the factors with some other (n+k)! + 1 for some k? Seems like it is easy to find some pairs (n,k) satisfying the needs, for example for n = 5 there exists k=5, because 5! + 1 = 121 = 11 * 11, and from Wilson's theorem (5+5)!+1 is divisible by 11 since 11 is a prime. But is it possible to find such k for any number?
#This script will try to find smallest n for every k (the search limits for both are input arguments), so that n!+1 shares common factor with (n+k)!+1
#for k = 5 smallest n turns out to be 5, for 6 ... 712! :)
#Example usage: ./this_script 1000 25

export BC_LINE_LENGTH=0

gcd()
{
if [[ $2 == 0 ]]; then
	echo $1
	return 0
fi
gcd $2 $(bc <<< "$1 % $2")
}

if [[ $# != 2 ]]; then
	echo "Usage: $0 <n> <k>"
	exit 1
fi

#fill factorial_plus_1 table
last_factorial=1
for n in $(seq 1 $(($1+$2))); do
	last_factorial=$(bc <<< "$n * $last_factorial")
	factorials[$n]=$(bc <<< "$last_factorial + 1")
done
unset last_factorial

for k in $(seq 2 $2); do
	found=0
	for n in $(seq 1 $1); do
		gcd_val=$(gcd ${factorials[$n]} ${factorials[$(($n+$k))]})
		if [[ $gcd_val != 1 ]]; then
			found=1
			echo "k = $k, n = $n ${factorials[$(($n+$k))]} ${factorials[$n]} gcd = $gcd_val"
			break
		fi;
	done
	if [[ $found == 0 ]]; then
		echo "Not found for k = $k"
	fi
done
