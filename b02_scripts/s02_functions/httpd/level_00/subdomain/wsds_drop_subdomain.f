#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wsds
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wsdr_subdomain  - wsdsl_multi_lang
#-- ws_subdline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Elimina un Virtual server subdomain en arquitectura Brqx
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T delete virtual_server cluser
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P ID [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wsds mainwar cinco -- Borra el VS identificado por el ID y SUBID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wsds()
{
VER="0.0.5"
DEP="00"		# Depth script

wsds_FUN="wsds"
wsds_NFO="Elimina un VS subdominio multi idioma [$VER]($DEP)@${QP}"
wsds_FMT="wsds LINE SITE_LANG SITE_DOMAIN"
wsds_EXA="wsds espalillos"

wsds_OUT=0
wsds_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsds_NFO}" "${wsds_FMT}" "${wsds_EXA}"
#--------------------------------------------------------------------------------

else
IDSITE=${1}
ID_SUBD=${2}
SITE_DOMAIN=""
SITE_LANGUAGE=""

ws_gsdrop

wsds_OUT=$(expr  ${wsds_OUT} + ${ws_gsdrop_OUT})
wsds_ERR="${wsds_ERR}${ws_gsdrop_ERR}"

if [ "${ws_gsdrop_OUT}" == "0" ] ; then
#--STA_IF_[01] - [IF DOMAIN_EXIST] ----------------------------------------------


if [ "${MODE}" == "klus" -o "${MODE}" == "lang" ] ; then
#--STA_IF_[02] - [IF MULTI LANGUAGE] --------------------------------------------


wcds_cluster ${IDSITE}  

wsds_OUT=$(expr  ${wsds_OUT} + ${wcds_cluster_OUT})
wsds_ERR="${wsds_ERR}${wcds_cluster_ERR}"


else
wsds_nocluster ${IDSITE}   

wsds_OUT=$(expr  ${wsds_OUT} + ${wsds_nocluster_OUT})
wsds_ERR="${wsds_ERR}${wcds_nocluster_ERR}"

#--END_IF_[02] - [IF MULTI LANGUAGE] --------------------------------------------
fi

#--[01] - END [IF FINDLINE] --------------------------------------------------------------------
fi

if [ "${wsds_OUT}" != "0" ] ; then
wsds_ERR="#+${wsds_FUN}::##${wsds_ERR}"
footer_error "${wsds_NFO}" "${wsds_ERR}"
fi

fi

}
