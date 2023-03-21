#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wsgo 
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_getsiteline 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Accede al Virtual server domain en arquitectura Brqx
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T go access virtual_server domain
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P ID [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wsgo mainrct -- Accede all VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wsgo()
{
VER="0.0.6"
FUNC="wsgo"

wsgo_OUT=0
wsgo_MSG=""
wsgo_ERR=""

wsgo_NFO="Accede al site (domain|subdomain) indicado por el ID de entrada [$VER]"
wsgo_FMT="wsgo ID [SUB_ID]"
wsgo_EXA="wsgo mainrct"


if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsgo_NFO}" "${wsgo_FMT}" "${wsgo_EXA}"
#--------------------------------------------------------------------------------
else

IDSITE=${1}
SUBD=${2}

SITE_DOMAIN=""
SITE_LANGUAGE=""

ws_getsiteline 
wsgo_OUT=$(expr  ${wsgo_OUT} + ${ws_getsiteline_OUT})
wsgo_ERR="${wsgo_ERR}${ws_getsiteline_ERR}"

# Call to ws_gdcreate | ws_gscreate


if 		[ "${ws_getsiteline_OUT}" 		== "0" 			] ; then
#--STA_IF_[01] - [IF CHECK IDSITE ] ---------------------------------------------

OLDPWD=$PWD
cd ${LAN_HOME_PATH}
ls -la

#--STA_IF_[01] - [IF CHECK IDSITE ] ---------------------------------------------
fi

if [ "${wsgo_OUT}" != "0" ] ; then

wsgo_ERR="${FUNC}::##${wsgo_ERR}"
footer_error "${wsgo_ERR}"

fi

fi
}
