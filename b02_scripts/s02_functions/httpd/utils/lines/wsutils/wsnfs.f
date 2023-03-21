#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wsnfs
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_getline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Informa de un VS Subdominio en Arquitectura Brqx
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T informa virtual_server subdomain
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P ID [SUB_ID] [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wsnfs mainwar palillos -- Informa del Subdominio indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wsnfs()
{
VER="0.0.6"

wsnfs_OUT=0
wsnfs_ERR=""

wsnfs_FUN="wsnfs"
wsnfs_NFO="Informa de un subdominio[$VER]($DEP)"
wsnfs_FMT="wsnfs IDSITE"
wsnfs_EXA="wsnfs espalillos"

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsnfs_NFO}" "${wsnfs_FMT}" "${wsnfs_EXA}"
#--------------------------------------------------------------------------------
else

IDSITE=${1}
ID_SUBD=${2}

SITE_DOMAIN=""
SITE_LANGUAGE=""

ws_getsubdomainline
wsnfs_OUT=$(expr  ${wsnfs_OUT} + ${ws_getsubdomainline_OUT} )
wsnfs_ERR="${wsnfs_ERR}${ws_getsubdomainline_ERR}"

if [ "${ws_getsubdomainline_OUT}" == "0" ] ; then
#--STA_IF_[01] - START [IF ws_getdomainline_CORRECT] ----------------------------

VS_PATH="${VS_PATH}[apache|lighttp|gwan]/${CLEAN_DOMAIN}.conf"
LOGS_PATH="${LOGS_PATH}[apache|lighttp|gwan]/${CLEAN_DOMAIN}.log"

EXIST_PATH=""
if [ -d ${HOME_PATH} ] ; then
EXIST_PATH="EXIST_STRUCTURE"
fi

OUTOUT="CLEANX"
ws_infoline wsnfs_nocluster
OUTOUT="CLEAN"


#--STA_IF_[01] - START [IF ws_getdomainline_CORRECT] ----------------------------
fi

if [ "${wsnfs_OUT}" != "0" ] ; then
wsnfs_ERR="# ${wsnfs_FUN}::##${wsnfs_ERR}"
echo "footer_error ${wsnfs_ERR}"
fi


fi
}
