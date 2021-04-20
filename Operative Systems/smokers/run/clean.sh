#!/bin/bash

rm -f error*
rm -f core

# Comando ipcs -m e ver o unico que tem algo diferente de 0
ipcrm -S 0x6101816b
ipcrm -M 0x6101816b

