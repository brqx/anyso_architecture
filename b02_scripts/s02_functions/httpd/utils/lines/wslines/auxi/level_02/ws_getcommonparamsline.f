#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.2" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- d-ws_getcommonparamsline-
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_ckdomainsline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Comprueba los parametros de la linea y actualiza valores por defecto
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T check parameters line
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P 
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_getcommonparamsline [FINDLINE] -- Obtiene valores para la FINDLINE
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_getcommonparamsline()
{
VER="0.1.2"

ws_getcommonparamsline_OUT=0
ws_getcommonparamsline_ERR=""
ws_getcommonparamsline_MSG=""

ws_getcommonparamsline_FUN="ws_getcommonparamsline"
ws_getcommonparamsline_NFO="Obtiene una linea de valores de un fichero de configuracion [$VER]"
ws_getcommonparamsline_FMT="ws_getcommonparamsline"
ws_getcommonparamsline_EXA="ws_getcommonparamsline"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_getcommonparamsline_NFO}" "${ws_getcommonparamsline_FMT}" "${ws_getcommonparamsline_EXA}"
#--------------------------------------------------------------------------------
else

#- Parte Comun para Dominios y Subdominios

MAIN_FILES_FOLDER_BASE="${FOLDER_BASE}files/${MAIN_SITE_PATH}"

FILES_FOLDER_BASE="${FOLDER_BASE}files/${SITE_PATH}"
OLD_FILES_FOLDER_BASE="${OLD_FOLDER_BASE}files/${SITE_PATH}"

RAM_FILES_FOLDER_BASE="${RAM_FOLDER_BASE}files/${SITE_PATH}"
MAIN_RAM_FILES_FOLDER_BASE="${RAM_FOLDER_BASE}files/${MAIN_SITE_PATH}"

CACHE_FOLDER_BASE="${FOLDER_BASE}cache/${SITE_PATH}"
OLD_CACHE_FOLDER_BASE="${OLD_FOLDER_BASE}cache/${SITE_PATH}"

RAM_LAN_FILES_PATH="${RAM_FILES_FOLDER_BASE}${LANGUAGE}"
MAIN_RAM_LAN_FILES_PATH="${MAIN_RAM_FILES_FOLDER_BASE}${LANGUAGE}"

MAIN_LAN_FILES_PATH="${MAIN_FILES_FOLDER_BASE}${LANGUAGE}"
LAN_FILES_PATH="${FILES_FOLDER_BASE}${LANGUAGE}"
OLD_LAN_FILES_PATH="${OLD_FILES_FOLDER_BASE}${LANGUAGE}"

LAN_CACHE_PATH="${CACHE_FOLDER_BASE}${LANGUAGE}/"
OLD_LAN_CACHE_PATH="${OLD_CACHE_FOLDER_BASE}${LANGUAGE}/"

#-Requiere VS_PATH para poder comprobar que realmente existe un site con otros valores

#echo "Depurando ${VS_PATH}"

ws_ckdomainsline
ws_getcommonparamsline_OUT=$(expr  ${ws_getcommonparamsline_OUT} + ${ws_ckdomainsline_OUT})
ws_getcommonparamsline_ERR="${ws_getcommonparamsline_ERR}${ws_ckdomainsline_ERR}"


#-Debemos insertar las estrategias de backup de los sites y de los servidores
#-Pendiente ---


if [ "${ws_getcommonparamsline_OUT}" != "0" ] ; then
ws_getcommonparamsline_ERR="+ ${ws_getcommonparamsline_FUN}::##${ws_getcommonparamsline_ERR}"
footer_error "${ws_getcommonparamsline_ERR}"
fi


fi
}
