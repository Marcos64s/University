#!/bin/bash
# Conditional block if
if (( $1 > 5 && $1 < 10 )) ; then
#if  [[ $1 -gt 5 && $1 -lt 10 ]] ; then
#if  [  $1 -gt 5 -a $1 -lt 10 ]  ; then
    echo "Número maior do que cinco e menor do que 10"
else
    echo "Falso"
fi

#.