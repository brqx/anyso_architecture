#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- multi_line_basic
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Permite generar lineas multiples para terminales
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generate multi lines strings
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P MULTI_STRING
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E multi_line_basic MULTI_STRING -- Genera multi lines
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
multi_line_basic()
{
VER="0.0.5"
FUNC="multi_line_basic"
multi_line_basic_OUT=0

multi_line_basic_NFO="Permite generar lineas multiples para terminales basicas [$VER]($DEP)"
multi_line_basic_FMT="multi_line_command TEXT COMMAND"
multi_line_basic_EXA="multi_line_command TEXT COMMAND"


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${multi_line_basic_NFO}" "${multi_line_basic_FMT}" "${multi_line_basic_EXA}"
#--------------------------------------------------------------------------------
else

#-Tenemos 
#echo "#$(linea_caracter '==--' 102)"
#echo "CADENA DE MENSAJES"
#echo "#$(linea_caracter '==--' 102)"

#-Queremos
#multi_line_header "CADENA DE MENSAJES"

LINE_CONTENT="${@}"

LINE_LENGTH_CONTENT=${#LINE_CONTENT}
LINE_LENGTH_PENUM=$( 		expr ${#LINE_CONTENT} - 1 	)
LINE_LENGTH_ANTEPENUM=$( 	expr ${#LINE_CONTENT} - 2 	)


LAST_SEPARATOR=$(echo "${LINE_CONTENT}" | cut -c${LINE_LENGTH_PENUM}-${LINE_LENGTH_CONTENT} )

if [ "${LAST_SEPARATOR}" == "##" ] ; then
LINE_CONTENT=$( echo "${LINE_CONTENT}"| cut -c1-${LINE_LENGTH_ANTEPENUM} )
fi

#-Si la cadena termina en ## eliminamos esos caracteres


#- Nueva vairable SHOW_ONLY_LAST_TRACE_STACK
#- La idea es decidir si mostramos todo o solo el ultimo o los n ultimos mensajes

if [ "${SHOW_ONLY_LAST_TRACE_STACK}" == "" ] ; then 

#Generamos una multi linea en razon de una cadena con separador ##
echo "${LINE_CONTENT}" | sed "s/##/\\n/g"

else

if [ "${NUM_STACK_MESSAGES_TO_SHOW}" == "" ] ; then
NUM_STACK_MESSAGES_TO_SHOW=1
fi

echo "${LINE_CONTENT}" | sed "s/##/\\n/g" | tail -${NUM_STACK_MESSAGES_TO_SHOW} 

SHOW_ONLY_LAST_TRACE_STACK=""
NUM_STACK_MESSAGES_TO_SHOW=""
	
fi


fi
}
