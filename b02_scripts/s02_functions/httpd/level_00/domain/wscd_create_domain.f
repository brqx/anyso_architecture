#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2017
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.1" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- d-wscd-
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wccd_cluster (cluster) - wscd_nocluster (server)
#-- ws_gdcreate
#-- footer_basic - header_full
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Crea un Vs Domain en arquitectura Brqx en todos los servidores
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create virtual_server domain
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P ID [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wscd mainwar 			-- Crea el VS identificado por el ID
#E wscd thisisthewar.com 	-- Crea el VS identificado por el dominio
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wscd()
{
VER="0.1.1"
DEP="00"		# Depth script
wscd_FUN="wscd"
wscd_NFO="Crea un VS  dominio en arquitectura Brqx [$VER]($DEP)"
wscd_FMT="wscd IDSITE"
wscd_EXA="wscd espalillos | wscd mispalillos.com"

wscd_OUT=0
wscd_MSG=""
wscd_ERR=""


if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wscd_NFO}" "${wscd_FMT}" "${wscd_EXA}"
#--------------------------------------------------------------------------------
else
#-Vamos a poner una nueva funcionalidad. Se puede llamar por el dominio tambien

IDSITE=${1}
SITE_DOMAIN=""
SITE_LANGUAGE=""

ws_gdcreate
wscd_OUT=$(expr  ${wscd_OUT} + ${ws_gdcreate_OUT})
wscd_ERR="${wscd_ERR}${ws_gdcreate_ERR}"

if [ "${ws_gdcreate_OUT}" == "0" ] ; then
#--STA_IF_[01] - START [IF ws_getdomainline_CORRECT] ----------------------------

#-Aqui ha sido correcto el chequeo pero y si es un subdominio deberia haber dado error


if [ "${MODE}" == "klus" -o "${MODE}" == "lang" ] ; then
#--STA_IF_[02] - START [IF CLUSTER] ---------------------------------------------
#-- CLUSTER SITE - MAY BE MULTI LANGUAGE OR NOT

wccd_cluster ${IDSITE}  

else
## - NO CLUSTER - DOMAIN - NO MULTI LANGUAGE

wscd_nocluster ${IDSITE}  

#--[02] - END [IF CLUSTER] ------------------------------------------------------
fi
#--[01] - END [IF ws_getdomainline] -----------------------------------------------------
fi

if [ "${wscd_OUT}" != "0" ] ; then
wscd_ERR="#+${wscd_FUN}::##${wscd_ERR}"
footer_error "${wscd_NFO}" "${wscd_ERR}"
fi

fi
}
