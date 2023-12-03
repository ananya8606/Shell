#!/bin/bash

while true; do
    tput cup 0 $(($(tput cols)-8))
    echo -n "$(date +"%T")"
    sleep 1
done &
