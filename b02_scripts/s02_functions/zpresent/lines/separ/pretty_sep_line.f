#!/bin/bash
#
# Script version 0.0.3
#
#Crea una linea bonita - bien espaciada 
prtyline_sep_line()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Imprime estructuras para el dominio preseleccionado"
echo "=========================================================="
echo "Format  : wsdg_show_lines [file_waf] [file_loc]                 		"
echo "----------------------------------------------------------"
echo "Example : wsndg domains.waf                               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

OUTOUT="CLEANX"

if [ "${SEP}" == "" ] ; then
SEP=":" 
fi

FINAL_LINE=""

#echo "Spaces: ${ARGS_LEN[0]} - ${ARGS_LEN[1]} - ${ARGS_LEN[2]}"
i=0
for word_line in "${@}" ; do
#   5      7        9
#-Cada argumento indica el espacio de la linea

CURRENT_WORD=${word_line}
CURRENT_LEN="${ARGS_LEN[${i}]}"
CURRENT_WORD_LEN="${#CURRENT_WORD}"
SYMBOL=""

if [ ${CURRENT_WORD_LEN} -gt  ${CURRENT_LEN} ]  ; then
SYMBOL="$(linea_caracter @ ${CURRENT_LEN} )"
else 
LEN_SPACE_LINE=$(expr ${CURRENT_LEN} - ${CURRENT_WORD_LEN} )
SYMBOL="${CURRENT_WORD}$(linea_caracter ' ' ${LEN_SPACE_LINE} )"
fi

if [ "${i}" != "0" ] ; then
SEPF="${SEP}"
else
SEPF=""
fi

FINAL_LINE="${FINAL_LINE}${SEPF}${SYMBOL}"
let i++
done

if [ "${OUTOUT}" == "" ] ; then
#echo "${FINAL_LINE}"
A=B
fi

prtyline_sep_line_OUT="${FINAL_LINE}"
fi
}
