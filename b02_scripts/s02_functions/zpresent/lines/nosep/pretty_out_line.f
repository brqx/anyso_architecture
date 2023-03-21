#!/bin/bash
#
# Script version 0.0.3
#
#Crea una linea bonita - bien espaciada 
prtyout_set_line()
{
VER="0.0.3"
prtyline_set_line_OUT=""

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Imprime estructuras para el dominio preseleccionado"
echo "=========================================================="
echo "Format  : prtyout_set_line [file_waf] [file_loc]    		"
echo "----------------------------------------------------------"
echo "Example : prtyout_set_line PART_01 PART_02                "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

WORD_LENG_ARRAY="${#}"

WORD_ARRAY[0]="${1}"
WORD_ARRAY[1]="${2}"
WORD_ARRAY[2]="${3}"
WORD_ARRAY[3]="${4}"
WORD_ARRAY[4]="${5}"
WORD_ARRAY[5]="${6}"
WORD_ARRAY[6]="${7}"
WORD_ARRAY[7]="${8}"
WORD_ARRAY[8]="${9}"
WORD_ARRAY[9]="${10}"
WORD_ARRAY[10]="${11}"

#Error de bucle
#for i in ${@} ; do
#while [ $c -le ${#} ] ; do

prtyline_set_line 

echo "${prtyline_set_line_OUT}"
fi
}
