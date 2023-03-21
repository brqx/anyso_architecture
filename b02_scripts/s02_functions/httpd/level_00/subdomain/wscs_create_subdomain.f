#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.2" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wscs
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wccs_cluster (cluster) - wscs_nocluster (server)
#-- ws_subdline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Crea un VS Subdominio en arquitectura Brqx en todos los servidores
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create virtual_server cluser
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P ID [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wscs mainwar_palillos    -- Crea el VS identificado por el ID
#E wscs palillos.abrqx.com  -- Crea el VS identificado por el DOMINIO
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wscs()
{
VER="0.1.2"
DEP="00"		# Depth script

wscs_OUT=0
wscs_ERR=""

wscs_FUN="wscs"
wscs_NFO="Crea un VS  subdominio en arquitectura Brqx [$VER]($DEP)"
wscs_FMT="wscs IDSITE"
wscs_EXA="wscs espalillos"


if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wscs_NFO}" "${wscs_FMT}" "${wscs_EXA}"
#--------------------------------------------------------------------------------
else
IDSITE=${1}
ID_SUBD=${2}

SITE_DOMAIN=""
SITE_LANGUAGE=""

ws_gscreate
wscs_OUT=$(expr  ${wscs_OUT} + ${ws_gscreate_OUT} )
wscs_ERR="${wscs_ERR}${ws_gscreate_ERR}"

#echp "CODIGO SALIDA : ${ws_gscreate_OUT} - ${wscs_OUT} + ${ws_gscreate_OUT}"

if [ "${ws_gscreate_OUT}" == "0" ] ; then
#--STA_IF_[01] - START [IF ws_getdomainline_CORRECT] ----------------------------

if [ "${MODE}" == "klus" -o "${MODE}" == "lang" ] ; then
#--STA_IF_[02] - START [IF CLUSTER] ---------------------------------------------

wccs_cluster ${IDSITE}

wscs_OUT=$(expr  ${wscs_OUT} + ${wccs_cluster_OUT} )
wscs_ERR="${wscs_ERR}${wccs_cluster_ERR}"

else
## - NO CLUSTER - SUBDOMAIN NO MULTI LANGUAGE

wscs_nocluster ${IDSITE}  

wscs_OUT=$(expr  ${wscs_OUT} + ${wscs_nocluster_OUT} )
wscs_ERR="${wscs_ERR}${wscs_nocluster_ERR}"

#--END_IF_[02] - START [IF CLUSTER] ---------------------------------------------
fi

#--STA_IF_[01] - START [IF ws_getdomainline_CORRECT] ----------------------------
fi

if [ "${wscs_OUT}" != "0" ] ; then
wscs_ERR="#+${wscs_FUN}::##${wscs_ERR}"
footer_error "${wscs_NFO}" "${wscs_ERR}"
fi


fi
}
