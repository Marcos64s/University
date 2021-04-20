#!/bin/bash
# Calculate the sum of a series of numbers.
SCORE="0"
SUM="0"
i="1"
while true; do
 echo -n "Enter your score [0-10] ('q' to quit): "
 read SCORE;
 if (("$SCORE" < "0")) || (("$SCORE" > "10")); then
 echo "Try again: "
 elif [[ "$SCORE" == "q" ]]; then
 echo "Sum: $SUM."
 break
 elif [[ "$SCORE" == "r" ]]; then
 SUM="0"
 else
 SUM=$((SUM + SCORE))
 i=$(($i + 1))
fi
done
MEAN=$((SUM / (i-1)))
echo "Mean: $MEAN."
echo "Exiting."

