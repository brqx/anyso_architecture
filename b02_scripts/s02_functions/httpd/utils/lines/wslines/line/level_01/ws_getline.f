#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.2" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- d-ws_getline-
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_getparamsline - ws_setdomparamsline
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
#E ws_getline [FINDLINE] -- Obtiene valores para la FINDLINE
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_getline()
{
VER="0.1.2"

ws_getline_OUT=0
ws_getline_ERR=""
ws_getline_MSG=""

ws_getline_FUN="ws_getline"
ws_getline_NFO="Obtiene una linea de valores de un fichero de configuracion [$VER]"
ws_getline_FMT="ws_getline LINE"
ws_getline_EXA="ws_getline LINE"


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_getline_NFO}" "${ws_getline_FMT}" "${ws_getline_EXA}"
#--------------------------------------------------------------------------------
else
#-DUDA IMPORTANTE - REQUIRE QUE ANTES SE HAYA EJECUTADO ws_ckidsite

FIND_LINE=${1}

#echo "Depurando : ${FIND_LINE}"

if [ -f "${FIND_LINE}" ] ; then 

ws_getparamsline "${FIND_LINE}"

ws_getline_OUT=$(expr  ${ws_getline_OUT} + ${ws_getparamsline_OUT})
ws_getline_ERR="${ws_getline_ERR}${ws_getparamsline_ERR}"

#-Parte especifica para dominios
ws_setdomparamsline
ws_getline_OUT=$(expr  ${ws_getline_OUT} + ${ws_setdomparamsline_OUT})
ws_getline_ERR="${ws_getline_ERR}${ws_setdomparamsline_ERR}"

#Call to ws_getcommonparamsline

else
ws_getline_EER="#-E30:FindLine is not a valid file : ${FIND_LINE} ##"
ws_getline_COD=30

ws_getline_OUT=$(expr  ${ws_getline_OUT} + ${ws_getline_COD})
ws_getline_ERR="${ws_getline_ERR}${ws_getline_EER}"

fi

if [ "${ws_getline_OUT}" != "0" ] ; then
ws_getline_ERR="#+${ws_getline_FUN}::##${ws_getline_ERR}"
footer_error "${ws_getline_NFO}" "${ws_getline_ERR}"
fi


fi
}
