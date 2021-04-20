#!/bin/bash
function imprime_msg()
{
    echo "A minha primeira função"
    return 0
}

function imprime_data()
{
    echo "Date: "
    date
    return 0
}

function imprime_pc()
{
    echo "Computador: " $HOSTNAME
}

function imprime_user()
{
    echo "User: " $USER
}

function compareNumbers()
{
    if (( $1 > $2 )) ; then  
        return 1
    elif (( $1 < $2 )) ; then
        return 2
    else
        return 0
    fi  
}

function checkDigits()
{   
    # =~       -> Match expressão regular
    # ^[0-9]+$ -> Expressão regular
    #             ^     - ínicio
    #             [0-9] - qualquer digito entre 0 e 9
    #             +     - 1 ou mais repetições
    #             $     - fim    
    if [[ $1 =~ ^[0-9]+$ ]] ; then 
        return 1; 
    else 
        return 2;
    fi
}