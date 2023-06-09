#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.3" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- header_dual_common
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
#T generate common header dual
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P MULTI_STRING
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E header_dual_common MULTI_STRING -- Genera multi lines con encabezado bonito
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
header_dual_common()
{
VER="0.0.3"
FUNC="header_dual_common"

header_dual_common_NFO="Generacion de estructura de cabecera dual comun [$VER]"
header_dual_common_FMT="header_dual_common LINE"
header_dual_common_EXA="header_dual_common LINE"


header_dual_common_OUT=0


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_getline_NFO}" "${ws_getline_FMT}" "${ws_getline_EXA}"
#--------------------------------------------------------------------------------
else

#-Formato:
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
# LINE_CONTENT_01
#================================================================================
# LINE_CONTENT_02
#--------------------------------------------------------------------------------


LINE_CONTENT_01="${1}"
LINE_CONTENT_02="${2}"

FULL_FORMAT="# Format  : ${LINE_CONTENT_02}"


#-Tenemos 

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMUN
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
echo "#$(linea_caracter '==--' 	102)	"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
multi_line_basic "${LINE_CONTENT_01}"	
#================================================================================
echo "#$(linea_caracter '=' 	102)	"
#================================================================================

if [ "${LINE_CONTENT_02}" != "" ] ; then
#================================================================================
multi_line_basic "${FULL_FORMAT}"	
#--------------------------------------------------------------------------------
echo "#$(linea_caracter '-' 	102)	"
#--------------------------------------------------------------------------------
fi

LINE_CONTENT_01=
LINE_CONTENT_02=

fi
}
