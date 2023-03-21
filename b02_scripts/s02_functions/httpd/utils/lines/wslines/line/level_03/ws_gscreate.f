#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.9" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_gscreate
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_getsubdomainline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Gestionamos los valores correctos de las lineas para dominio
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
#E ws_gscreate  -- Gestiona valores para la FINDLINE
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#WS Get SubDomain Line for CreateDomain Cases
ws_gscreate()
{
VER="0.1.0"

ws_gscreate_OUT=0
ws_gscreate_ERR=""
ws_gscreate_MSG=""

ws_gscreate_FUN="ws_gscreate"
ws_gscreate_NFO="Gestiona una linea de valores de un fichero de configuracion [$VER]"
ws_gscreate_FMT="ws_gscreate LINE"
ws_gscreate_EXA="ws_gscreate LINE"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_gscreate_NFO}" "${ws_gscreate_FMT}" "${ws_gscreate_EXA}"
#--------------------------------------------------------------------------------
else

#-Requiere que se haya definido IDSITE en la funcion inicial de llamada

ws_getsubdomainline
#echp "${ws_gscreate_OUT} + ${ws_getsubdomainline_OUT}"
ws_gscreate_OUT=$(expr  ${ws_gscreate_OUT} + ${ws_getsubdomainline_OUT})
ws_gscreate_ERR="${ws_gscreate_ERR}${ws_getsubdomainline_ERR}"


if [ "${ws_gscreate_OUT}" == "0" ] ; then
#--STA_IF_[01] - START [IF ws_getdomainline_CORRECT] ----------------------------

if 		[ "${PROJECT_TYPE}" 		== "subdomain" 	] ; then 
#--STA_IF_[02] - [IF CHECK DOMAIN ] ---------------------------------------------

if [ "${DOMAIN_EXIST_IN_DIFFERENT_PATH}" != "0" ] ; then
#--STA_IF_[03] -  [IF DOMAIN_EXIST CREATE] ---------------------------------

ws_gscreate_EER="#-E20:DOMAIN or ID ${IDSITE} EXIST WITH DIFFERENT DATA ##"
ws_gscreate_COD=10		## Pound value for this case
ws_gscreate_OUT=$(expr  ${ws_gscreate_OUT} + ${ws_gscreate_COD})
ws_gscreate_ERR="${ws_gscreate_ERR}${ws_gscreate_EER}"

find /host -type f -name ${CLEAN_DOMAIN}.conf  | grep "/${CLEAN_DOMAIN}.conf" | grep -v "${VS_PATH}"


#--END_IF_[03] - END [IF DOMAIN_EXIST CREATE] -----------------------------------
fi

else
ws_gscreate_EER="#-E30:Wrong Project Type : ${IDSITE} is domain type ##"
ws_gscreate_COD=30

ws_gscreate_OUT=$(expr  ${ws_gscreate_OUT} + ${ws_gscreate_COD})
ws_gscreate_ERR="${ws_gscreate_ERR}${ws_gscreate_EER}"


#--END_IF_[02] - [IF CHECK DOMAIN ] ---------------------------------------------
fi


#--END_IF_[01] - START [IF ws_getdomainline_CORRECT] ----------------------------
fi

if [ "${ws_gscreate_OUT}" != "0" ] ; then
ws_gscreate_ERR="+${ws_gscreate_FUN}::##${ws_gscreate_ERR}"
footer_error "${ws_gscreate_ERR}"
fi


fi
}
