#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.8" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_subdline
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_getparamsline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Obtiene una linea de valores de un fichero de configuracion
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T get values settings file
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P FIND_LINE
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_subdline [FINDLINE] -- Obtinee valores para la FINDLINE
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_subdline()
{
VER="0.1.0"

ws_subdline_FUN="ws_subdline"
ws_subdline_NFO="Obtiene una linea de valores de un fichero de configuracion [$VER]"
ws_subdline_FMT="ws_subdline LINE MAIN_LINE"
ws_subdline_EXA="ws_subdline LINE"

ws_subdline_OUT=0
ws_subdline_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" -o "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_subdline_NFO}" "${ws_subdline_FMT}" "${ws_subdline_EXA}"
#--------------------------------------------------------------------------------
else

SUBD_LINE_INT=${1}
MAIN_LINE_INT_SUB=${2}

SITE_DOMAIN_SUB=${SITE_DOMAIN}
SITE_LANGUAGE_SUB=${SITE_LANGUAGE}

#-No hay opcion de fallo en la llamada a los valores del dominio
ws_mainline ${MAIN_LINE_INT_SUB}

SITE_DOMAIN=${SITE_DOMAIN_SUB}
SITE_LANGUAGE=${SITE_LANGUAGE_SUB}

ws_getparamsline "${SUBD_LINE_INT}"
ws_subdline_OUT=$(expr  ${ws_subdline_OUT} + ${ws_getparamsline_OUT})
ws_subdline_ERR="${ws_subdline_ERR}${ws_getparamsline_ERR}"


ws_setsubparamsline
ws_subdline_OUT=$(expr  ${ws_subdline_OUT} + ${ws_setsubparamsline_OUT})
ws_subdline_ERR="${ws_subdline_ERR}${ws_setsubparamsline_ERR}"


if [ "${ws_subdline_OUT}" != "0" ] ; then
ws_subdline_ERR="#+${ws_subdline_FUN}::##${ws_subdline_ERR}"
footer_error "${ws_subdline_NFO}" "${ws_subdline_ERR}"
fi


fi
}
