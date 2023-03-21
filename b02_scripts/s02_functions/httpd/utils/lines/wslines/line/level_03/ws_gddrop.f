#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.0" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_gddrop
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_getdomainline
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
#E ws_gddrop  -- Gestiona valores para la FINDLINE
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#WS Get Domain Line for CreateDomain Cases
ws_gddrop()
{
VER="0.1.0"
FUNC="ws_gddrop"

ws_gddrop_OUT=0
ws_gddrop_ERR=""
ws_gddrop_MSG=""

ws_gddrop_FUN="ws_gddrop"
ws_gddrop_NFO="Gestiona una linea de valores de un fichero de configuracion [$VER]"
ws_gddrop_FMT="ws_gddrop LINE"
ws_gddrop_EXA="ws_gddrop LINE"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_gddrop_NFO}" "${ws_gddrop_FMT}" "${ws_gddrop_EXA}"
#--------------------------------------------------------------------------------
else

#-Requiere que se haya definido IDSITE en la funcion inicial de llamada

ws_getdomainline
ws_gddrop_OUT=$(expr  ${ws_gddrop_OUT} + ${ws_getdomainline_OUT})
ws_gddrop_ERR="${ws_gddrop_ERR}${ws_getdomainline_ERR}"

if [ "${ws_gddrop_OUT}" == "0" ] ; then
#--STA_IF_[01] - START [IF ws_getdomainline_CORRECT] ----------------------------

if 		[ "${PROJECT_TYPE}" 		== "domain" 	] ; then 
#--STA_IF_[02] - [IF CHECK DOMAIN ] ---------------------------------------------


if [ "${DOMAIN_EXIST}" == "0" ] ; then
#--STA_IF_[03] - START [IF DOMAIN_DONT EXIST] -----------------------------------

ws_gddrop_EER="#-DANGER : DOMAIN DON'T EXIST IN CLUSTER STRUCTURE ##"
ws_gddrop_EMD="find /host -type f -name ${CLEAN_DOMAIN}.conf"

multi_line_command "${ws_gddrop_EER}"	"${ws_gddrop_EMD}"

ws_gddrop_COD=10		## Pound value for this case
ws_gddrop_OUT=$(expr  ${ws_gddrop_OUT} + ${ws_gddrop_COD})
ws_gddrop_ERR="${ws_gddrop_ERR}${ws_gddrop_EER}"


#--END_IF_[03] - END [IF DOMAIN_EXIST CREATE] -----------------------------------
fi

else
ws_gddrop_EER="#-E30:Wrong Project Type : ${IDSITE} is subdomain type ##"
ws_gddrop_COD=30

ws_gddrop_OUT=$(expr  ${ws_gddrop_OUT} + ${ws_gddrop_COD})
ws_gddrop_ERR="${ws_gddrop_ERR}${ws_gddrop_EER}"


#--END_IF_[02] - [IF CHECK DOMAIN ] ---------------------------------------------
fi


#--END_IF_[01] - START [IF ws_getdomainline_CORRECT] ----------------------------
fi

if [ "${ws_gddrop_OUT}" != "0" ] ; then
ws_gddrop="# ${ws_gddrop_FUN}::##${ws_gddrop_ERR}"
footer_error "${ws_gddrop_ERR}"
fi


fi
}
