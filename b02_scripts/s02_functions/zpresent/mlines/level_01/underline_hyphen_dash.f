#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- underline_hyphen_dash
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- linea_hyphen_dash - multi_line_basic
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Permite generar lineas subrayado para terminales
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generate multi underlines strings hyphen_dash
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P MULTI_STRING
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E underline_hyphen_dash MULTI_STRING -- Genera multi lines con encabezado bonito
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
underline_hyphen_dash()
{
VER="0.0.5"							;QV="BRQX Arq 2016"
FUNC="underline_hyphen_dash"
underline_hyphen_dash_OUT=0

underline_hyphen_dash_NFO="Permite generar lineas underline (con subrayado) para terminales hyphen_dashes [$VER]($DEP) ${QV}"
underline_hyphen_dash_FMT="underline_hyphen_dash TEXT"
underline_hyphen_dash_EXA="underline_hyphen_dash TEXT"



if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${underline_hyphen_dash_NFO}" "${underline_hyphen_dash_FMT}" "${underline_hyphen_dash_EXA}"
#--------------------------------------------------------------------------------

else

LINE_CONTENT="${@}"

#-Tenemos 
multi_line_basic "${LINE_CONTENT}"
echo "#$(linea_caracter '==--'	102)"		

fi
}
