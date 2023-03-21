#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.3" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- multi_footer
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- linea_caracter
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
#E multi_footer MULTI_STRING -- Genera multi lines con encabezado bonito
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
multi_footer()
{
VER="0.0.3"
FUNC="multi_footer"

multi_footer_NFO="Generacion de estructura de pie comun [$VER]"
multi_footer_FMT="multi_footer SELECTOR NFO MSG EROR"
multi_footer_EXA="multi_footer SELECTOR NFO MSG EROR"


multi_footer_OUT=0


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " "  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ck_NFO}" "${ck_FMT}" "${ck_EXA}"
#--------------------------------------------------------------------------------
else

SW_VALUE="${1}"
NFO_CONTENT="${2}"
MSG_CONTENT="${3}"
ERROR_CONTENT="${4}"


if [ "${SW_VALUE}" == "0" ]	; then
footer_msg 	 "${NFO_CONTENT}"		"${MSG_CONTENT}"
else
footer_error "${NFO_CONTENT}"		"${ERROR_CONTENT}"
fi

fi
}
