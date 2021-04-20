#!/bin/bash
# select structure to create menus
select arg in $@; do
if $(( "$arg" in "$@" )); then
 echo "You picked $arg ($REPLY)."
else
 echo "Opção inválida!"
 echo "arg in $@" 
break
fi
done 
