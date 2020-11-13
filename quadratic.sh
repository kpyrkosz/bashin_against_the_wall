#!/bin/bash

#calculates roots of quadratic equation in form 'ax^2+bx+c=0'

declare -a coeffs
coeffs=($(sed -n 's/\(\-\?[0-9]\+\)x^2+\?\(-\?[0-9]\+\)x+\?\(-\?[0-9]\+\)=0/\1 \2 \3/p' <<< "$1"))

a=${coeffs[0]}
b=${coeffs[1]}
c=${coeffs[2]}

delta=$(bc <<< "$b*$b-4*$a*$c")
if (($delta < 0)) ; then
	echo "imaginary,imaginary"
	exit 0
fi
#delta 0 doesnt need special treatment since two values need to be printed

x1=$(bc -l <<< "scale=5; (-($b) - sqrt($delta)) / (2 * $a)")
x2=$(bc -l <<< "scale=5; (-($b) + sqrt($delta)) / (2 * $a)")
echo "$x1,$x2"
