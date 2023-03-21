#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.3" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- multi_line_command
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
#E multi_line_command MULTI_STRING -- Genera multi lines con encabezado bonito
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
multi_line_command()
{
VER="0.0.3"
FUNC="multi_line_command"
multi_line_command_OUT=0

multi_line_command_NFO="Permite generar lineas multiples para terminales con salida de comando [$VER]($DEP)"
multi_line_command_FMT="multi_line_command TEXT COMMAND"
multi_line_command_EXA="multi_line_command TEXT COMMAND"


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${multi_line_command_NFO}" "${multi_line_command_FMT}" "${multi_line_command_EXA}"
#--------------------------------------------------------------------------------
else

LINE_CONTENT_01="${1}"
COMMAND_02="${2}"

#-Tenemos 
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
echo "#$(linea_caracter '==--' 102)"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

multi_line_basic "# ${LINE_CONTENT_01}"

#--------------------------------------------------------------------------------
echo "#$(linea_caracter '-' 102)"
#--------------------------------------------------------------------------------

eval "${COMMAND_02}"

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
echo "#$(linea_caracter '==--' 102)"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

fi
}
