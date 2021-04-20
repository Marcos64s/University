#!/bin/bash
# Diferentes formas de incorporar bibliotecas de funções no script atual
#. /home/tiagocm/Documents/Code/GitHub/SO/G04/functions.sh
#. ./functions.sh
#. $PWD/functions.sh

#source /home/tiagocm/Documents/Code/GitHub/SO/G04/functions.sh
#source ./functions.sh
source $PWD/functions.sh

# Functions calls
imprime_msg
imprime_data
imprime_pc
imprime_user