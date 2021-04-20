#!/bin/bash
function comparador()
{
echo "O primeiro valor: "
 read x

echo "O segundo valor: "
 read xx

 if [ $x == $xx ]; then
	echo "Os valores são iguais!"
 elif [ $x -gt $xx ]; then
	echo "Max: $x"
 else
	echo "Max: $xx"
fi
}
comparador
