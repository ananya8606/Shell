#!/bin/bash

operation=$1
num1=$2
num2=$3

case $operation in
    +) result=$((num1 + num2));;
    -) result=$((num1 - num2));;
    /) result=$((num1 / num2));;
    \*) result=$((num1 * num2));;
    *) echo "Invalid operation"; exit 1;;
esac

echo "$num1 $operation $num2 = $result"
