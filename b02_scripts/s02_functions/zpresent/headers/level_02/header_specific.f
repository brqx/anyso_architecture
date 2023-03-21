#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.3" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- header_specific
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- linea_caracter
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Permite generar lineas multiples para terminales
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generate specific header
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P FORMAT [EXAMPLE]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E header_specific format [example] Genera multi lines con encabezado bonito
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
header_specific()
{
VER="0.0.3"
FUNC="header_specific"

header_specific_NFO="Generacion de estructura de cabecera especifica [$VER]"
header_specific_FMT="header_specific LINE"
header_specific_EXA="header_specific LINE"


header_specific_OUT=0


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${header_specific_NFO}" "${header_specific_FMT}" "${header_specific_EXA}"
#--------------------------------------------------------------------------------
else

LINE_FORMAT="${1}"
LINE_EXAMPLE="${2}"

#-Tenemos 

FULL_FORMAT="# Format  : ${LINE_FORMAT}"
FULL_EXAMPLE="# Example : ${LINE_EXAMPLE}" 

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE ESPECIFICA
#--------------------------------------------------------------------------------
echo "${FULL_FORMAT}"
#--------------------------------------------------------------------------------
echo "#$(linea_caracter '-' 102)"
#--------------------------------------------------------------------------------

if [ "${LINE_EXAMPLE}" != "" ] ; then
echo "${FULL_EXAMPLE}"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
echo "#$(linea_caracter '==--' 102)"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
fi

LINE_EXAMPLE=
LINE_FORMAT=

fi
}
