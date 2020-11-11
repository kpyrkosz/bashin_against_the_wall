#!/bin/bash

#generate random 64 digit hex string
< /dev/urandom tr -dc a-f0-9 | head -c64
echo
