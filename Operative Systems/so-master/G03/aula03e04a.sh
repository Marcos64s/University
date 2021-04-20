#!/bin/bash
# For all the files in a folder, show their properties

if (( $# != 1 )) ; then             # $# retorna o numero de argumentos
# if [[ $# -ne 1 ]] ; then
    echo "Número de argumentos inválido!"
    exit 1
else
    if [ -d $1 ] ; then
        for f in $1/*; do
            file "$f"
            extension="${f##*.}"                     # get the extension
            filename="${f%.*}"                       # get the filename
            mv "$f" "${filename}.${extension}"    # rename file by moving it
        done
    else
        echo "O argumento passado não é uma diretoria!"
    fi
fi 


