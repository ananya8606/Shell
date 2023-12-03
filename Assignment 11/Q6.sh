#!/bin/bash

current_hour=$(date +%H)

if [ $current_hour -ge 0 -a $current_hour -lt 12 ]; then
    echo "Good Morning"
elif [ $current_hour -ge 12 -a $current_hour -lt 18 ]; then
    echo "Good Afternoon"
else
    echo "Good Evening"
fi
