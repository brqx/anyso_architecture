#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.4" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_exist
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_gdcreate - ws_infoline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Comprueba si un site existe en el sistema
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create virtual_server cluster multilanguage
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P ID
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_exist [ID] -- Comprueba si un site existe en el sistema
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_exist()
{
VER="0.0.3"

ws_exist_FUN="ws_exist"
ws_exist_NFO="Comprueba si un site existe en el sistema [$VER]($DEP)@${QP}"
ws_exist_FMT="ws_exist IDSITE"
ws_exist_EXA="ws_exist espalillos"

ws_exist_OUT=0
ws_exist_ERR=""


if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_exist_NFO}" "${ws_exist_FMT}" "${ws_exist_EXA}"
#--------------------------------------------------------------------------------
else
IDSITE=${1}

ws_gdcreate
ws_exist_OUT=$(expr  ${ws_exist_OUT} + ${ws_gdcreate_OUT})
ws_exist_ERR="${ws_exist_ERR}${ws_gdcreate_ERR}"

if [ "${ws_gdcreate_OUT}" == "0" ] ; then
#--STA_IF_[01] - START [IF ws_getdomainline_CORRECT] ----------------------------

VS_PATH="${VS_PATH}[apache|lighttp|gwan]"
LOGS_PATH="${LOGS_PATH}[apache|lighttp|gwan]"

EXIST_PATH=""
if [ -d ${HOME_PATH} ] ; then
EXIST_PATH="EXIST_STRUCTURE"
fi

ws_infoline wsnf

#--[01] - END [IF ws_getdomainline] -----------------------------------------------------
fi

if [ "${ws_exist_OUT}" != "0" ] ; then
wscd_ERR="# ${ws_exist_FUN}::##${ws_exist_ERR}"
footer_error "${ws_exist_ERR}"
fi

fi
}
