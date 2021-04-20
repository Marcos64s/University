#!/bin/bash
# Este script irá validar os seus argumentos

echo "Checking..."
if (( $# != 2 )) ; then             # $# retorna o numero de argumentos
# if [[ $# -ne 1 ]] ; then
    case $# in
        [0-1]*) 
            echo "Foram introduzidos menos que 2 argumentos!"
            ;;
        [3-]*)
            echo "Foram introduzidos mais que 2 argumentos!"
            ;;
    esac
    exit 1
fi 

case $1 in
    [0-99]*) # Dá um bug para número superiores a 99!
        echo "O primeiro argumento é um número entre 0 e 99."
        ;;
    *)
        echo "O primeiro argumento não é um número entre 0 e 99."
        ;;
esac

case $2 in
    sec) 
        echo 'O segundo argumento começa por "sec"'
        ;;
    *)
        echo 'O segundo argumento não começa por "sec"'
        ;;
esac

