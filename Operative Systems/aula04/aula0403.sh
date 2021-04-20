#!/bin/bash
lista=( {1..100} )
for i in "${lista[@]}"; do
echo $(($RANDOM/100))
done
