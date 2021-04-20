#!/bin/bash

# Verificação do número de argumentos
if [ $# != 1 ] ; then
    echo "O número de argumentos inseridos é diferente de 1!"
    exit 1;
fi 

# Verificação do argumento passado ser ou não um ficheiro
if [ ! -f $1 ] ; then
   echo "O argumento passado não é um ficheiro!"
    exit 1;
fi

# Leitura dos valores do ficheiro e preenchimento do array
echo "Números por ordenar: ";
i=0
while read -r line
do  
    a[$i]=$line;
    echo ${a[$i]};
    ((i++))
done < "$1"
echo " ";

# Ordenação do array usando o algoritmo de ordenação por seleção
for (( i=0; i<((${#a[@]}-1)); i++)) 
do
    min=$i
    for (( j=i+1; j<${#a[@]}; j++))
    do
        if (( ${a[$j]} < ${a[$min]} )) ; then
            min=$j
        fi
    done
    if (( ${a[$i]} != ${a[$min]} )) ; then
        aux=${a[$i]}
        a[$i]=${a[$min]}
        a[$min]=$aux
    fi  
done

# Impressão
echo "Números ordenados usando o algoritmo de ordenação por seleção: "
for (( i=0; i<${#a[@]}; i++)) 
do
    echo ${a[$i]};
done

