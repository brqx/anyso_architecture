#!/bin/bash
#
# Script version 0.0.4
#
#Crea una linea bonita - bien espaciada 
prtyline_set_line()
{
VER="0.0.4"

prtyline_set_line_FUN="prtyline_set_line"
prtyline_set_line_NFO="Genera lineas con formato: Pretty Lines [$VER]"
prtyline_set_line_FMT="prtyline_set_line STRING"
prtyline_set_line_EXA="prtyline_set_line house is pretty"

F=${prtyline_set_line_FUN}

prtyline_set_line_OUT=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${prtyline_set_line_NFO}" "${prtyline_set_line_FMT}" "${prtyline_set_line_EXA}"
#--------------------------------------------------------------------------------

else

OUTOUT="CLEANX"

if [ "${FILLED_CHAR}" == "" 	] ; then
#-Por defecto el caracter de relleno es el espacio
FILLED_CHAR=" "
fi

if [ "${OVERFLOW_CHAR}" == "" 	] ; then
#-Por defecto el caracter de relleno en caso de linea mas grande
OVERFLOW_CHAR="@"
fi

#-Primero miramos si hay array de entrada definido

if [ "${WORD_LENG_ARRAY}" == "" ] ; then
#No hay array de entrada definido. Lo definimos
WORD_LENG_ARRAY=${#}

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
WORD_ARRAY[11]="${12}"
WORD_ARRAY[12]="${13}"
WORD_ARRAY[13]="${14}"
WORD_ARRAY[14]="${15}"
WORD_ARRAY[15]="${16}"
WORD_ARRAY[16]="${17}"
WORD_ARRAY[17]="${18}"
WORD_ARRAY[18]="${19}"
WORD_ARRAY[19]="${20}"
WORD_ARRAY[20]="${21}"

fi

FINAL_LINE=""

#Quiero conseguir 'Palabras 01' ' Palabras 02' 'Palabras 03'

word_count=0  # Word count

while [ $word_count -lt ${WORD_LENG_ARRAY} ] ; do
#-Cada argumento indica el espacio de la linea

CURRENT_WORD="${WORD_ARRAY[${word_count}]}"
CURRENT_SPACE_LEN="${ARGS_LEN[${word_count}]}"
CURRENT_WORD_LEN=${#CURRENT_WORD}
SYMBOL=""

#echo "Palabra : $word_count : $CURRENT_WORD_LEN < $CURRENT_SPACE_LEN : ${CURRENT_WORD}"

if [ ${CURRENT_WORD_LEN} -gt  ${CURRENT_SPACE_LEN} ]  ; then

if [ "${OVERFLOW_CHAR}" == " " ] ; then 
SYMBOL="$(linea_caracter ' ' ${CURRENT_SPACE_LEN} )"
else
SYMBOL="$(linea_caracter ${OVERFLOW_CHAR} ${CURRENT_SPACE_LEN} )"
fi

else 
LEN_SPACE_LINE=$(expr ${CURRENT_SPACE_LEN} - ${CURRENT_WORD_LEN} )

if [ "${FILLED_CHAR}" == " " ] ; then 
SYMBOL="${CURRENT_WORD}$(linea_caracter ' ' ${LEN_SPACE_LINE} )"
else
SYMBOL="${CURRENT_WORD}$(linea_caracter ${FILLED_CHAR} ${LEN_SPACE_LINE} )"
fi

fi

FINAL_LINE="${FINAL_LINE}${SYMBOL}"
##echo "Sym-${SYMBOL}-"
##echo "Line-${FINAL_LINE}-"

let word_count++
done

prtyline_set_line_OUT="${FINAL_LINE}"

#-Empty variables
WORD_LENG_ARRAY=

WORD_ARRAY[0]=""
WORD_ARRAY[1]=""
WORD_ARRAY[2]=""
WORD_ARRAY[3]=""
WORD_ARRAY[4]=""
WORD_ARRAY[5]=""
WORD_ARRAY[6]=""
WORD_ARRAY[7]=""
WORD_ARRAY[8]=""
WORD_ARRAY[9]=""
WORD_ARRAY[10]=""
WORD_ARRAY[11]=""
WORD_ARRAY[12]=""
WORD_ARRAY[13]=""
WORD_ARRAY[14]=""
WORD_ARRAY[15]=""
WORD_ARRAY[16]=""
WORD_ARRAY[17]=""
WORD_ARRAY[18]=""
WORD_ARRAY[19]=""
WORD_ARRAY[20]=""
WORD_ARRAY[21]=""
WORD_ARRAY[22]=""

fi
}
