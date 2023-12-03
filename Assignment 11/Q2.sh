#!/bin/bash

read -p "Enter a string: " str

reverse=$(echo $str | rev)

if [ "$str" == "$reverse" ]; then
    echo "The string is a palindrome."
else
    echo "The string is not a palindrome."
fi
