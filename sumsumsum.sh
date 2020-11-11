#!/bin/bash

#Question: what is the sum of digits of sum of digits of sum of digits of x^y?
#Example usage: ./this_script 3456 4567

if ! [[ $# == 2 && $1 =~ ^[0-9]+$ && $2 =~ ^[0-9]+$ ]]; then
	echo "Usage: $0 <x> <y>"
        exit 1
fi

export BC_LINE_LENGTH=0

sum_of_digits()
{
sum=0
for ((i=0;i<${#1};++i)); do
	((sum+=${1:i:1}))
done
echo $sum
}

VALUE=$(bc <<< "$1^$2")
sum_of_digits $(sum_of_digits $(sum_of_digits $VALUE))
