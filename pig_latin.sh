#!/bin/bash

#Your input variable will contain a sentence/phrase in pig latin. Your job is to translate it to english. You add "yay" if the word starts with a vowel. Otherwise move the starting consonant sequence (w, wr, sch, ...) to the end of the word and add "ay" plus a dash.

#Sample Test Cases
#value1 ayay imple-say est-tay ase-cay
#output a simple test case

#value1 ig-pay atin-lay isyay usedyay inyay ools-schay o-tay each-tay anguage-lay onstructs-cay
#output pig latin is used in schools to teach language constructs

#Usage: ./this script <enc|dec> <string>

if [[ $# != 2 ]]; then
	echo "Usage: $0 <enc|dec> <string>"
	echo "enc - encrypt given string"
	echo "dev - decrypt"
	exit 1
fi

if [[ $1 == "enc" ]]; then
	lower_cons=$(echo {a..z} | tr -d aeiuo\ )
	sed 's/\b\([aeiuo][a-z]*\)\b/\1yay/g;s/\b\(['$lower_cons']\+\)\([a-z]*\)\b/\2-\1ay/g' <<< "$2"
elif [[ $1 == "dec" ]]; then
	sed 's/\b\([[:lower:]]\+\)yay\b/\1/g;s/\b\([[:lower:]]*\)-\([[:lower:]]\+\)ay\b/\2\1/g' <<< "$2"
else
	echo "Action string must either be enc or dec"
	exit 1
fi
