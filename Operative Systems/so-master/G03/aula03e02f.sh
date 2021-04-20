#!/bin/bash
# This script checks the existence of a file
echo "Checking..."
if (( $# != 1 )) ; then             # $# retorna o numero de argumentos
# if [[ $# -ne 1 ]] ; then    
    echo "usage: $0 args" 
    exit 1
fi 

if [ -f $1 ] ; then
    echo "$1 existe."
    if [ -d $1 ] ; then
        echo "$1 é uma diretoria"
    else
        echo "$1 não é uma diretoria"
    fi
    
    if [ -r $1 ] ; then
        echo "$1 tem permissões de leitura"
    else
        echo "$1 não tem permissões de leitura"
    fi
    
    if [ -w $1 ] ; then
        echo "$1 tem permissões de escrita"
    else
        echo "$1 não tem permissões de escrita"
    fi

     if [ -x $1 ] ; then
        echo "$1 tem permissões de execução"
    else
        echo "$1 não tem permissões de execução"
    fi
     
else
    echo "$1 não existe"
fi
echo "...done."



