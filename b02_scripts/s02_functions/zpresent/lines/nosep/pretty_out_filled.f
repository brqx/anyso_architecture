#!/bin/bash
#
# Script version 0.0.3
#
#Crea una linea bonita - bien espaciada 
prtyout_set_filled()
{
VER="0.0.3"
prtyout_set_filled_out=""

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Imprime estructuras para el dominio preseleccionado"
echo "=========================================================="
echo "Format  : prtyout_set_filled [WORD_01] [WORD_02]    		"
echo "----------------------------------------------------------"
echo "Example : prtyout_set_filled PART_01 PART_02                "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

prtyline_set_filled "${@}"

echo "${prtyline_set_filled_OUT}"
fi
}
