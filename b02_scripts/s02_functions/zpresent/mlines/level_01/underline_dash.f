#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- underline_dash
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- linea_dash - multi_line_basic
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Permite generar lineas underlines para terminales
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generate multi underlines strings dash
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P MULTI_STRING
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E underline_dash MULTI_STRING -- Genera multi lines con encabezado bonito
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
underline_dash()
{
VER="0.0.5"							;QV="BRQX Arq 2016"
FUNC="underline_dash"
underline_dash_OUT=0

underline_dash_NFO="Permite generar lineas underline (con subrayado) para terminales dashes [$VER]($DEP) ${QV}"
underline_dash_FMT="underline_dash TEXT"
underline_dash_EXA="underline_dash TEXT"



if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${underline_dash_NFO}" "${underline_dash_FMT}" "${underline_dash_EXA}"
#--------------------------------------------------------------------------------

else

LINE_CONTENT="${@}"

#-Tenemos 
multi_line_basic "${LINE_CONTENT}"
echo "#$(linea_caracter '=-'	102)"		

fi
}
