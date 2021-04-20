#!/bin/bash
source comparar.sh

function sort($1)
{
i="0"
for i in "$1[@]";do
 a=$1[i];
 b=$1[i+1];
 c=((comparar($1[i],$1[i+1]))
if((c == "2"));then
	temp=a;
	a=b;
	b=temp;
 elif((c = "1")
	temp=b;
        b=a;
        a=temp;
}
