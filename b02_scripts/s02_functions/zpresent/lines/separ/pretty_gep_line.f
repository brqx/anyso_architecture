#!/bin/bash
#
# Script version 0.0.3
#
#Crea una linea bonita - bien espaciada 
prtyline_gep_line()
{
VER="0.0.3"

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Obtiene estructuras para la linea pasada					"
echo "=========================================================="
echo "Format  : prtyline_gep_line LINE							"
echo "----------------------------------------------------------"
echo "Example : prtyline_gep_line LINE                          "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

OUTOUT="CLEANX"

if [ "${SEP}" == "" ] ; then
SEP=":" 
fi

FULL_LINE="${@}"
LEN_FULL_LINE="${#FULL_LINE}"

i=0  # Contador para las palabras
j=0  # Contador para las posiciones
current_start=0  #Inicio capturas


while [ $j -le ${LEN_FULL_LINE} ]  ; do
#...#....|
#${string:position:length}

CURRENT_CHAR="${FULL_LINE:${j}:1}"

if [ "${CURRENT_CHAR}" == "$(echo ${SEP})" ] ; then
#La subcadena i es desde el inicio anterior hasta la posicion anterior
distance=$(expr $j - $current_start) 

WORDS_OUT[$i]=${FULL_LINE:${current_start}:${distance}}
current_start=$( expr $j + 1 ) 

let i++
fi

let j++
done
#Falta la ultima palabra
distance=$(expr $j - $current_start) 
WORDS_OUT[$i]=${FULL_LINE:${current_start}:${distance}}

#-Ya hemos recupeardo las cadenas, ahora tenemos que limpiarlas de espacios

j=0
while [ $j -le $i ] ; do
CURRENT_WORD="${WORDS_OUT[$j]}"
CURRENT_WORD=$(echo "${CURRENT_WORD}"| tr -s " " )

INIT_CHAR="${CURRENT_WORD:0:1}"
LAST_POSITION="$( expr ${#CURRENT_WORD} - 1 )"
END_CHAR="${CURRENT_WORD:${LAST_POSITION}:1}"


if [ "${INIT_CHAR}" == " " ] ; then
#-Correcto siempre
CURRENT_WORD=$( echo "${CURRENT_WORD}"| cut -d " " -f2- )
fi

if [ "${END_CHAR}" == " " ] ; then
#No es correcto si hay espacios entre medias
LEN_CURRENT_WORD="$(expr ${#CURRENT_WORD} - 1 )"
CURRENT_WORD=${CURRENT_WORD:0:${LEN_CURRENT_WORD}}
##CURRENT_WORD=$( echo ${CURRENT_WORD} | cut -d " " -f1 )
fi

WORDS_OUT[$j]="${CURRENT_WORD}"
echo "$j --- -${WORDS_OUT[$j]}-"
let j++
done

fi
}
