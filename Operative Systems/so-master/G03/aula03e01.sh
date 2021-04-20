#!/bin/bash
# Agrupamento de comandos na Bash
IFS=''                                  # Input Field Separator
{                                       # As chavetas permitem agrupar comandos dentro de chavetas
i=0
while read line; do
    echo $i: $line
    i=$(($i+1))
done
} < $1 
                                        # '< $1' estamos a fazer um redirecionamento de entrada de 
                                        # todos os comandos dentro das chavetas
