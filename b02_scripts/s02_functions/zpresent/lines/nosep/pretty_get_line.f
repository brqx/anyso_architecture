#!/bin/bash
#
# Script version 0.0.3
#
#Procesa una linea bonita - bien espaciada
#Permite procesar y generar lineas con separadores posicionales (ficticios - no existe caracter separador) 
prtyline_get_line()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Devuelve el contenido de la linea en WORDS_OUT 			"
echo "=========================================================="
echo "Format  : wsdg_show_lines [file_waf] [file_loc]           "
echo "----------------------------------------------------------"
echo "Example : wsndg domains.waf                               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

OUTOUT="CLEANX"

FULL_LINE="${@}"
LEN_FULL_LINE="${#FULL_LINE}"

i=0  # Contador para las palabras
j=0  # Contador para las posiciones
while [ $j -lt ${LEN_FULL_LINE} ]  ; do
#...#....|
#${string:position:length}

WORDS_OUT[$i]="${FULL_LINE:${j}:${ARGS_LEN[$i]}}"
WORD_SPACE="${WORDS_OUT[$i]}"
WORD_SPACE_LEN="${#WORD_SPACE}"

j=$( expr ${j} + ${WORD_SPACE_LEN} )
echo "$i : ${WORDS_OUT[$i]}"
let i++
done

prtyline_sep_line_OUT="${FINAL_LINE}"
fi
}
