#!/bin/bash

function sort(){
arr=()
n=400
while read line; do
# reading each line
arr=("${arr[@]}" $line)
done < number

echo "${arr[@]}"

#logic for selection sort
for((i=0;i<n-1;i++)); do
 small=${arr[$i]}
 index=$i
 for((j=i+1;j<n;j++)); do
  if((arr[j]< small)); then
  small=${arr[$j]}
  index=$j
  fi
 done
 temp=${arr[$i]}
 arr[$i]=${arr[$index]}
 arr[$index]=$temp
done
#printing sorted array
echo "printing sorted"
echo "${arr[@]}"
}
sort
