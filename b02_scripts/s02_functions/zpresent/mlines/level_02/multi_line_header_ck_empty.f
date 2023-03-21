#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.4" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- multi_line_header_check_empty
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- multi_line_header
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Permite generar lineas multiples para terminales solo si hay contenido
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generate multi lines strings header check empty
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P MULTI_STRING
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E multi_line_header_check_empty MULTI_STRING -- Genera multi lines con encabezado bonito
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
multi_line_header_check_empty()
{
VER="0.0.3"
FUNC="multi_line_header"
multi_line_header_check_empty_OUT=0

multi_line_header_check_empty_NFO="Genera lineas multiples para terminales solo si hay contenido [$VER]($DEP) ${QV}"
multi_line_header_check_empty_FMT="multi_line_header_check_empty TEXT"
multi_line_header_check_empty_EXA="multi_line_header_check_empty TEXT"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${multi_line_header_check_empty_NFO}" "${multi_line_header_check_empty_FMT}" "${multi_line_header_check_empty_EXA}"
#--------------------------------------------------------------------------------
elif [ "${1}" != ""] ; then

LINE_CONTENT="${@}"

multi_line_header "${LINE_CONTENT}"

fi
}
