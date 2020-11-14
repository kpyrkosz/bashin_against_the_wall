#!/bin/bash

#Fuzzer for pig_latin script. Generates random string, encrypts, decrypts, compares results

#TODO: toy around with getopts to add some command line switches (test count, verbose log etc)

for i in {1..100}; do
	for k in {1..20}; do
		charcount=$((1+RANDOM % 30))
		random_string+=$(</dev/urandom tr -dc [:lower:] | head -c$charcount)
		if [[ $random_string =~ [aeuio] ]]; then
			#if we didnt random a vowel, add it, that's the requirement of the task
			random_string+="a"
		fi
		test_string+="$random "
	done
	encrypted=$(./pig_latin.sh enc "$test_string")
	decrypted=$(./pig_latin.sh dec "$encrypted")
	if [[ $decrypted != $test_string ]]; then
		echo "Fuzzer generated a string breaking the enc/dec scheme!"
		echo -e "Input:\n$test_string"
		echo -e "Encrypted:\n$encrypted"
		echo -e "Decrypted:\n$decrypted"
		exit 1
	fi
	unset test_string
done
