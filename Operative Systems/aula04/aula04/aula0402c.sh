#!/bin/bash
function comparador()
{
 if [ $1 == $2 ]; then
	echo "Os valores são iguais!"
 elif [ $1 -gt $2 ]; then
	return $1
 else
	return $2
fi
}
