#!/bin/bash
#
# Script version 0.0.3
#
#Establece argumentos de espaciado de la linea 
prtyline_set_args_len()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Establece la longitud de los argumentos en la linea		"
echo "Devuelve los valores en el array ARGS_LEN"
echo "=========================================================="
echo "Format  : prtyline_set_args_len [space_len1] [spc_len2]   "
echo "----------------------------------------------------------"
echo "Example : prtyline_set_args_len 4 6 8                     "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
else

OUTOUT="CLEANX"

FULL_LEN_LINE="${@}"

i=0  # Contador para las palabras
for len_word in ${FULL_LEN_LINE} ; do
ARGS_LEN[${i}]="${len_word}"
let i++
done

fi
}
