#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.2" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_setsubparamsline
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wdom
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
#E ws_setsubparamsline [FINDLINE] -- Obtiene valores para la FINDLINE
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_setsubparamsline()
{
VER="0.1.2"

ws_setsubparamsline_OUT=0
ws_setsubparamsline_ERR=""
ws_setsubparamsline_MSG=""

ws_setsubparamsline_FUN="ws_setsubparamsline"
ws_setsubparamsline_NFO="Obtiene una linea de valores de un fichero de configuracion [$VER]"
ws_setsubparamsline_FMT="ws_setsubparamsline"
ws_setsubparamsline_EXA="ws_setsubparamsline"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_setsubparamsline_NFO}" "${ws_setsubparamsline_FMT}" "${ws_setsubparamsline_EXA}"
#--------------------------------------------------------------------------------
else

#- Tenemos dos variables MAIN_SITE (site principal para cache de imagenes) y MAINSITE (padre en subdominios)

MAIN_SITE_PATH="${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${MAIN_SITE}/"

SITE_PATH="${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/"

MAIN_HOME_PATH="${MAINHOME_PATH}zdom/${MAIN_SITE_PATH}"
HOME_PATH="${MAINHOME_PATH}zdom/${SITE_PATH}"

DB_SITE_VERSION=$( echo "${SITE_VERSION}" | tr -d ".")

if    [ "${PRODUCT}" == "drupal" ] ; then


DATABASE="${MAINPROJECT}_${MAINENVIRONMENT}${DRUPAL_VERSION}${MAINPROJECT}${MAINSITE}${SITE}${REPLICATION_TAG}_${LANGUAGE}"
DATABASE_EFULL="${MAINPROJECT}_${MAINENVIRONMENT}${DRUPAL_VERSION}${MAINPROJECT}E${MAINSITE}E${SITE}${REPLICATION_TAG}_${LANGUAGE}V${DB_SITE_VERSION}"

elif  [ "${PRODUCT}" == "magento" ] ; then

DATABASE="${MAINPROJECT}_${MAINENVIRONMENT}${MAGENTO_VERSION}${MAINPROJECT}${MAINSITE}${SITE}${REPLICATION_TAG}_${LANGUAGE}"
#-Db con separadores y version
DATABASE_EFULL="${MAINPROJECT}_${MAINENVIRONMENT}${MAGENTO_VERSION}${MAINPROJECT}E${MAINSITE}E${SITE}${REPLICATION_TAG}_${LANGUAGE}V${DB_SITE_VERSION}"

fi

ws_getcommonparamsline


if [ "${ws_setsubparamsline_OUT}" != "0" ] ; then
ws_setsubparamsline_ERR="# ${ws_setsubparamsline_FUN}::##${ws_setsubparamsline_ERR}"
footer_error "${ws_setsubparamsline_ERR}"
fi


fi
}
