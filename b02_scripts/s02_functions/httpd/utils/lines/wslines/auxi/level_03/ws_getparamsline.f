#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.2.1" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_getparamsline
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_ckparamsline  
#-- ws_getdomainparamsline - ws_getsvparamsline - ws_getbkparamsline
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
#E ws_getparamsline -- Obtiene valores para la FINDLINE
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_getparamsline()
{
VER="0.2.1"

ws_getparamsline_OUT=0
ws_getparamsline_ERR=""
ws_getparamsline_MSG=""

ws_getparamsline_FUN="ws_getparamsline"
ws_getparamsline_NFO="Define las variables ren razon a la linea de configuracion de entrada[$VER]"
ws_getparamsline_FMT="ws_getparamsline LINE"
ws_getparamsline_EXA="ws_getparamsline LINE"


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_getline_NFO}" "${ws_getline_FMT}" "${ws_getline_EXA}"
#--------------------------------------------------------------------------------

else

PARAMS_FIND_LINE=${1}
PARAMS_FIND_TMP="${PARAMS_FIND_LINE}_tmp"

SERVER_NFO_FILE=/brqi/zzc/server.nfo
ENGINES_FILE=/brqi/zzc/engines.run

if [ -f "${PARAMS_FIND_LINE}" ] ; then

cat  ${PARAMS_FIND_LINE} | grep -v "^#" > ${PARAMS_FIND_TMP}

#-1.Obtenemos los parametros de dominio
ws_getdomainparamsline

#-2.Obtenemos los parametros de servidor
ws_getsvparamsline

#-3.Obtenemos los parametros de backup
ws_getbkparamsline


#-4.Actualizamos los parametros a valores por defecto o entradas de la funcion
ws_ckparamsline 

ws_getparamsline_OUT=$(expr  ${ws_getparamsline_OUT} + ${ws_ckparamsline_OUT})
ws_getparamsline_ERR="${ws_getparamsline_ERR}${ws_ckparamsline_ERR}"


#-Borramos el fichero temporal
rm -f ${PARAMS_FIND_TMP}

else

ws_getparamsline_OUT=40
ws_getparamsline_ERR="#-Error en linea de configuracion ##"

fi


if [ "${ws_getparamsline_OUT}" != "0" ] ; then
ws_getparamsline_ERR="+${ws_getparamsline_FUN}::##${ws_getparamsline_ERR}"
footer_error "${ws_getparamsline_ERR}"
fi


fi
}
