#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.0" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_gsdrop
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
#E ws_gsdrop  -- Gestiona valores para la FINDLINE
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#WS Get SubDomain Line for CreateDomain Cases
ws_gsdrop()
{
VER="0.1.0"
FUNC="ws_gsdrop"

ws_gsdrop_OUT=0
ws_gsdrop_ERR=""
ws_gsdrop_MSG=""

ws_gsdrop_FUN="ws_gsdrop"
ws_gsdrop_NFO="Gestiona una linea de valores de un fichero de configuracion [$VER]"
ws_gsdrop_FMT="ws_gsdrop LINE"
ws_gsdrop_EXA="ws_gsdrop LINE"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_gsdrop_NFO}" "${ws_gsdrop_FMT}" "${ws_gsdrop_EXA}"
#--------------------------------------------------------------------------------
else

#-Requiere que se haya definido IDSITE en la funcion inicial de llamada

ws_getsubdomainline
ws_gsdrop_OUT=$(expr  ${ws_gsdrop_OUT} + ${ws_getsubdomainline_OUT})
ws_gsdrop_ERR="${ws_gsdrop_ERR}${ws_getsubdomainline_ERR}"

if [ "${ws_gsdrop_OUT}" == "0" ] ; then
#--STA_IF_[01] - [IF ws_getdomainline_CORRECT] ----------------------------------

if 		[ "${PROJECT_TYPE}" 		== "subdomain" 	] ; then 
#--STA_IF_[02] - [IF CHECK DOMAIN ] ---------------------------------------------

if [ "${DOMAIN_EXIST}" == "0" ] ; then
#--STA_IF_[03] - [IF DOMAIN_DONT EXIST ] ----------------------------------------

ws_gsdrop_EER="#-DANGER : DOMAIN DON'T EXIST IN CLUSTER STRUCTURE ##"
ws_gsdrop_COD=10		## Pound value for this case
ws_gsdrop_OUT=$(expr  ${ws_gsdrop_OUT} + ${ws_gsdrop_COD})
ws_gsdrop_ERR="${ws_gsdrop_ERR}${ws_gsdrop_EER}"


#--END_IF_[03] - END [IF DOMAIN_DONT_EXIST] -------------------------------------
fi

else
ws_gsdrop_EER="#-E30:Wrong Project Type : ${IDSITE} is domain type ##"
ws_gsdrop_COD=30

ws_gsdrop_OUT=$(expr  ${ws_gsdrop_OUT} + ${ws_gsdrop_COD})
ws_gsdrop_ERR="${ws_gsdrop_ERR}${ws_gsdrop_EER}"


#--END_IF_[02] - [IF CHECK DOMAIN ] ---------------------------------------------
fi


#--END_IF_[01] - START [IF ws_getdomainline_CORRECT] ----------------------------
fi

if [ "${ws_gsdrop_OUT}" != "0" ] ; then
wscd_ERR="# ${ws_gsdrop_FUN}::##${ws_gsdrop_ERR}"
footer_error "${ws_gsdrop_ERR}"
fi


fi
}
