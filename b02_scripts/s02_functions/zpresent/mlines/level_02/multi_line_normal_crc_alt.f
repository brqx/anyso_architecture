#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.4" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- multi_line_normal_crc_alt
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- linea_caracter - multi_line_basic
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Permite generar lineas multiples para terminales
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generate multi lines strings header
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P MULTI_STRING
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E multi_line_normal_crc_alt MULTI_STRING -- Genera multi lines con encabezado bonito
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
multi_line_normal_crc_alt()
{
VER="0.0.4"								;QV="Brqx Agile Architecture 2016"
FUNC="multi_line_normal_crc_alt"
multi_line_normal_crc_alt_OUT=0

multi_line_normal_crc_alt_NFO="Permite generar lineas multiples para terminales con salida de comando [$VER]($DEP)"
multi_line_normal_crc_alt_FMT="multi_line_normal_crc_alt TEXT COMMAND"
multi_line_normal_crc_alt_EXA="multi_line_normal_crc_alt TEXT COMMAND"


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${multi_line_normal_crc_alt_NFO}" "${multi_line_normal_crc_alt_FMT}" "${multi_line_normal_crc_alt_EXA}"
#--------------------------------------------------------------------------------
else
#Result: 

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#CONTENT_01
#-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-=
#CONTENT_02
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

LINE_CONTENT_01="${1}"
LINE_CONTENT_02="${2}"

#-Tenemos 
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
echo "#$(linea_caracter '==--' 102)"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

multi_line_basic "# ${LINE_CONTENT_01}"

#--------------------------------------------------------------------------------
echo "#$(linea_caracter -==	102)"		
#--------------------------------------------------------------------------------

if [ "${LINE_CONTENT_02}" != "" ] ; then

multi_line_basic "# ${LINE_CONTENT_02}"

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
echo "#$(linea_alterna 	102)"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

fi

fi
}
