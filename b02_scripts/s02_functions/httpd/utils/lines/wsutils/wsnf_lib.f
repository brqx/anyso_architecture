#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- wsnf
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Muestra los valores del Virtual Server
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T domain virtual server show
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P FIND_LINE
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wsnf [IDSITE] -- Reporta informcion del SITE indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wsnf()
{
VER="0.0.4"
SITE_DOMAIN=""
SITE_LANGUAGE=""

wsnf_FUN="wsnf"
wsnf_NFO="Accede a un subdominio [$VER]($DEP)@${QP}"
wsnf_FMT="wsnf ID SUBID"
wsnf_EXA="wsnf espalillos"

wsnf_OUT=0
wsnf_ERR=""


if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsnf_NFO}" "${wsnf_FMT}" "${wsnf_EXA}"
#--------------------------------------------------------------------------------
else

OUTOUT="CLEANX"

IDSITE=${1}

ws_gdcreate
wsnf_OUT=$(expr  ${wsnf_OUT} + ${ws_gdcreate_OUT})
wsnf_ERR="${wsnf_ERR}${ws_gdcreate_ERR}"

if [ "${ws_gdcreate_OUT}" == "0" ] ; then
#--STA_IF_[01] - START [IF ws_getdomainline_CORRECT] ----------------------------

VS_PATH="${VS_PATH}[apache|lighttp|gwan]"
LOGS_PATH="${LOGS_PATH}[apache|lighttp|gwan]"

EXIST_PATH=""
if [ -d ${HOME_PATH} ] ; then
EXIST_PATH="EXIST_STRUCTURE"
fi

ws_infoline wsnf

#--END_IF_[01] - START [IF ws_getdomainline_CORRECT] ----------------------------
fi

if [ "${wsnf_OUT}" != "0" ] ; then
wsnf_ERR="# ${wsnf_FUN}::##${wsnf_ERR}"
footer_error "${wsnf_ERR}"
fi

OUTOUT="CLEAN"

fi
}
