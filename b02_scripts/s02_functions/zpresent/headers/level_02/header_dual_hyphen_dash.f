#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.3" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- header_dual_hyphen_dash
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
#T generate free header
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P MULTI_STRING
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E header_dual_hyphen_dash MULTI_STRING -- Genera multi lines con encabezado bonito
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
header_dual_hyphen_dash()
{
VER="0.0.3"
FUNC="header_dual_hyphen_dash"

header_dual_hyphen_dash_NFO="Generacion de estructura de cabecera dual equals hyphen [$VER]"
header_dual_hyphen_dash_FMT="header_dual_hyphen_dash LINE_01 [LINE_02]"
header_dual_hyphen_dash_EXA="header_dual_hyphen_dash LINE_01 [LINE_02]"

header_dual_hyphen_dash_NFO="Generacion de estructua de cabecer comun"

header_dual_hyphen_dash_OUT=0


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${header_dual_hyphen_dash_NFO}" "${header_dual_hyphen_dash_FMT}" "${header_dual_hyphen_dash_EXA}"
#--------------------------------------------------------------------------------
else

LINE_CONTENT_01="${1}"
LINE_CONTENT_02="${2}"

#-Tenemos 

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMUN
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
echo "#$(linea_caracter '==--' 	102)	"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
echo "# ${LINE_CONTENT_01}"	
#--------------------------------------------------------------------------------
echo "#$(linea_caracter '-' 	102)	"
#--------------------------------------------------------------------------------

if [ "${LINE_CONTENT_02}" != "" ] ; then
echo "# ${LINE_CONTENT_02}"	
#================================================================================
echo "#$(linea_caracter '==--' 	102)	"
#================================================================================
fi

fi
}
