#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.4" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- header_full
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- header_common - header_specific
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Permite generar lineas multiples para terminales
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generate full header
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P FORMAT [EXAMPLE]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E header_full format [example] Genera multi lines con encabezado bonito
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
header_full()
{
VER="0.0.4"

header_full_FUN="header_full"
header_full_NFO="Generacion de estructura de cabecera completa"
header_full_FMT="INFO [FORMAT] [EXAMPLE]"
header_full_EXA="INFO [FORMAT] [EXAMPLE]"

header_full_OUT=0


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${header_full_NFO}" "${header_full_FMT}" "${header_full_EXA}"
#--------------------------------------------------------------------------------
else

LINE_INFORMATION="${1}"
LINE_FORMAT="${2}"
LINE_EXAMPLE="${3}"

#-Tenemos 


if [ "${LINE_INFORMATION}" != "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMUN
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
header_common "${LINE_INFORMATION}"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

if [ "${LINE_FORMAT}" != "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE ESPECIFICA
#--------------------------------------------------------------------------------
header_specific "${LINE_FORMAT}" "${LINE_EXAMPLE}"
#--------------------------------------------------------------------------------
fi


fi



fi
}