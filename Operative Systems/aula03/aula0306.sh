#!/bin/bash
#This script opens 4 terminal windows.
i="0"
until [[ $i == 4 ]]; do
 if [[ xterm & == "true"]]
 	i=$(($i+1))
 fi
done
