#!/bin/bash

#Merge two comma separated lists
#Example:
#$1 34,18,4,102
#$2 15,19,120,64
#output 34,15,18,19,4,120,102,64

paste -d,  <(tr , "\n" <<< $1) <(tr , "\n" <<< $2) | tr "\n" , | sed 's/,$/\n/'
