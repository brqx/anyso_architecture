#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.8" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- footer_error_force
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- underline_normal - multi_line_header
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Permite generar lineas multiples para terminales
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generate common header
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P MULTI_STRING
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E footer_error_force MULTI_STRING -- Genera multi lines con encabezado bonito
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
footer_error_force()
{
VER="0.0.8"

footer_error_force_FUN="footer_error_force"
footer_error_force_NFO="Generacion de estructua de pie para casos de error [$VER]($DEP)"
footer_error_force_FMT="footer_error_force TEXT"
footer_error_force_EXA="footer_error_force TEXT"

footer_error_force_OUT=0


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${footer_error_force_NFO}" "${footer_error_force_FMT}" "${footer_error_force_EXA}"
#--------------------------------------------------------------------------------
else

NFO_CONTENT_L2="${1}"
ERROR_CONTENT_L2="${2}"

#- Nueva variable SHOW_ONLY_LAST_TRACE_STACK
#- La idea es decidir si mostramos todo o solo el ultimo o los n ultimos mensajes
#- La variable usada para decidir el numero de mensajes es NUM_STACK_MESSAGES_TO_SHOW

#echo "A ${FUNCNAME[0]}  	- ${CALL_FUNC}" # footer_error_force
#echo "B ${FUNCNAME[1]}  	- ${CALL_FUNC}" # function to print

#-El orden de llamada sera 4 cuando se invoque desde la shell : root - bash - script - footer_error_force
top_of_stack=$(( ${#FUNCNAME[@]} - 4 ))

##echo "Imprimiendo : ${CALL_FUNC} - ${FUNCNAME[*]}"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- PIE MENSAJE ESPECIFICO
#--------------------------------------------------------------------------------
upperline_normal "#${NFO_CONTENT_L2}"
#--------------------------------------------------------------------------------

if [ "${ERROR_CONTENT_L2}" != "" ]	; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
multi_line_header "${ERROR_CONTENT_L2}"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
fi


fi
}
