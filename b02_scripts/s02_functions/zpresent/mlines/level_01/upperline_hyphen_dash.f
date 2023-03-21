#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- upperline_hyphen_dash
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
#T generate multi upperlines strings hyphen_dash
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P MULTI_STRING
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E upperline_hyphen_dash MULTI_STRING -- Genera multi lines con encabezado bonito
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
upperline_hyphen_dash()
{
VER="0.0.5"							;QV="BRQX Arq 2016"
FUNC="upperline_hyphen_dash"
upperline_hyphen_dash_OUT=0

upperline_hyphen_dash_NFO="Permite generar lineas upperline (con subrayado) para terminales hyphen_dashes [$VER]($DEP) ${QV}"
upperline_hyphen_dash_FMT="upperline_hyphen_dash TEXT"
upperline_hyphen_dash_EXA="upperline_hyphen_dash TEXT"



if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${upperline_hyphen_dash_NFO}" "${upperline_hyphen_dash_FMT}" "${upperline_hyphen_dash_EXA}"
#--------------------------------------------------------------------------------

else

LINE_CONTENT="${@}"

echo "#$(linea_caracter '==--'	102)"		

multi_line_basic "${LINE_CONTENT}"

fi
}
