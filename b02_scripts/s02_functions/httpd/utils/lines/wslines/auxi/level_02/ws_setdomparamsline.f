#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.2" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- d-ws_setdomparamsline-
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
#E ws_setdomparamsline [FINDLINE] -- Obtiene valores para la FINDLINE
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_setdomparamsline()
{
VER="0.1.2"

ws_setdomparamsline_OUT=0
ws_setdomparamsline_ERR=""
ws_setdomparamsline_MSG=""

ws_setdomparamsline_FUN="ws_setdomparamsline"
ws_setdomparamsline_NFO="Obtiene una linea de valores de un fichero de configuracion [$VER]"
ws_setdomparamsline_FMT="ws_setdomparamsline"
ws_setdomparamsline_EXA="ws_setdomparamsline"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_setdomparamsline_NFO}" "${ws_setdomparamsline_FMT}" "${ws_setdomparamsline_EXA}"
#--------------------------------------------------------------------------------
else

#- Parte especifica solo de dominios

#echo "Depurando - Div ${DIVISION} - Pry ${PROJECT} - MSi ${MAIN_SITE}"

#-Home path to create cache image sites
MAIN_SITE_PATH="${DIVISION}/${PROJECT}/${MAIN_SITE}/"

#echo "Depurando - Div ${DIVISION} - Pry ${PROJECT} - SI ${SITE}"

SITE_PATH="${DIVISION}/${PROJECT}/${SITE}/"

HOME_PATH="/${MODEVS}/${SITE_PATH}"

#-Home path to create cache image sites
MAIN_HOME_PATH="/${MODEVS}/${MAIN_SITE_PATH}"

DB_SITE_VERSION=$( echo "${SITE_VERSION}" | tr -d ".")

if    [ "${PRODUCT}" == "drupal" ] ; then

DATABASE="${PROJECT}_${ENVIRONMENT}${DRUPAL_VERSION}${PROJECT}${SITE}${REPLICATION_TAG}_${LANGUAGE}V${DB_SITE_VERSION}"

elif  [ "${PRODUCT}" == "magento" ] ; then

DATABASE="${PROJECT}_${ENVIRONMENT}${MAGENTO_VERSION}${PROJECT}${SITE}${REPLICATION_TAG}_${LANGUAGE}V${DB_SITE_VERSION}"

fi

ws_getcommonparamsline

#- Call to : ws_ckdomainsline

if [ "${ws_setdomparamsline_OUT}" != "0" ] ; then
ws_setdomparamsline_ERR="# ${ws_setdomparamsline_FUN}::##${ws_setdomparamsline_ERR}"
footer_error "${ws_setdomparamsline_ERR}"
fi


fi
}
