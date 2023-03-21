#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- upperline_normal
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- linea_normal - multi_line_basic
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Permite generar lineas subrayado para terminales
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generate multi upperlines strings normal
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P MULTI_STRING
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E upperline_normal MULTI_STRING -- Genera multi lines con encabezado bonito
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
upperline_normal()
{
VER="0.0.5"							;QV="BRQX Arq 2016"
FUNC="upperline_normal"
upperline_normal_OUT=0

upperline_normal_NFO="Permite generar lineas upperline (con subrayado) para terminales normales [$VER]($DEP) ${QV}"
upperline_normal_FMT="upperline_normal TEXT"
upperline_normal_EXA="upperline_normal TEXT"



if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${upperline_normal_NFO}" "${upperline_normal_FMT}" "${upperline_normal_EXA}"
#--------------------------------------------------------------------------------

else

LINE_CONTENT="${@}"

echo "#$(linea_normal 	102)"		

multi_line_basic "${LINE_CONTENT}"

fi
}
