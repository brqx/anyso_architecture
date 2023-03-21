#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- multi_line_normal
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- linea_normal - multi_line_basic
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Permite generar lineas multiples para terminales
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generate multi lines strings normal
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P MULTI_STRING
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E multi_line_normal MULTI_STRING -- Genera multi lines con encabezado bonito
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
multi_line_normal()
{
VER="0.0.5"							;QV="BRQX Arq 2016"
FUNC="multi_line_normal"
multi_line_normal_OUT=0

multi_line_normal_NFO="Permite generar lineas multiples para terminales normales [$VER]($DEP) ${QV}"
multi_line_normal_FMT="multi_line_normal TEXT"
multi_line_normal_EXA="multi_line_normal TEXT"



if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${multi_line_normal_NFO}" "${multi_line_normal_FMT}" "${multi_line_normal_EXA}"
#--------------------------------------------------------------------------------

else

LINE_CONTENT="${@}"

#-Tenemos 
echo "#$(linea_normal 	102)"		
multi_line_basic "${LINE_CONTENT}"
echo "#$(linea_normal 	102)"		

fi
}
