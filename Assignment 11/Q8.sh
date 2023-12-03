#!/bin/bash

while getopts ":cd" opt; do
    case $opt in
        c) clear;;
        d) ls;;
        \?) echo "Invalid option: -$OPTARG";;
    esac
done
