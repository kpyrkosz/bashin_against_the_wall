#!/bin/bash

# Converts roman numbers into decimal representation
# Example: ./roman.sh DCXLIII

sum=0
curr_roman=$1

grep -o IV >/dev/null <<< $curr_roman && { ((sum+=4)); curr_roman=${curr_roman/IV/}; }
grep -o IX >/dev/null <<< $curr_roman && { ((sum+=9)); curr_roman=${curr_roman/IX/}; }
grep -o XL >/dev/null <<< $curr_roman && { ((sum+=40)); curr_roman=${curr_roman/XL/}; }
grep -o XC >/dev/null <<< $curr_roman && { ((sum+=90)); curr_roman=${curr_roman/XC/}; }
grep -o CD >/dev/null <<< $curr_roman && { ((sum+=400)); curr_roman=${curr_roman/CD/}; }
grep -o CM >/dev/null <<< $curr_roman && { ((sum+=900)); curr_roman=${curr_roman/CM/}; }

for ((i=0;i<${#curr_roman};++i)); do
	case ${curr_roman:$i:1} in
	I)
		((sum+=1))
		;;
	V)
                ((sum+=5))
                ;;
	X)
                ((sum+=10))
                ;;
	L)
                ((sum+=50))
                ;;
	C)
                ((sum+=100))
                ;;
	D)
                ((sum+=500))
                ;;
	M)
                ((sum+=1000))
                ;;
	esac
done

echo $sum
