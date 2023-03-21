#!/bin/bash
# ------------------------------------------------------
#
# Script version 0.0.0.1
#
# Funciones para presentar de forma homogenea listados
# ------------------------------------------------------

format_text_length()
{
VER="0.0.0.1"
FEC="2022-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Formateamos el texto para que tenga la misma longitud en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : fmt | format_text_length INFO               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

INFO="${*}"

INFO_LENGTH=${#INFO}

if [ "${DESIRED_LENGTH}" == "" ] ; then
DESIRED_LENGTH=20
fi

#
# grulla       -
# escorpion    -
# rinoceronte_africano -

SPACES=$(expr  ${DESIRED_LENGTH} - ${INFO_LENGTH} )

if [ $SPACES -gt 0 ] ; then
echo "${INFO}$(printf %${SPACES}s)"
else
echo "${INFO} - [ needed format adjust !! ]"
fi

fi
}

set_text_length()
{
VER="0.0.0.1"
FEC="2022-Jul"
##"${1}" == "-?" -o

if [ "${1}" == "-?" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Establecemos la longitud de los textos para formatearlos en arquitectura Brqx [$VER] [$FEC] "
echo "=========================================================="
echo "Format  : stl | set_text_length LEN               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

LEN="$1"

if [ "${LEN}" != "" ] ; then
DESIRED_LENGTH=${LEN}
fi

fi
}
