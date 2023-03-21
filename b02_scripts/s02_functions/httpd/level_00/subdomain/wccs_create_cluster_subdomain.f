#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wccs_cluster
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wccd_cluster (cluster) - wscd_nocluster (server)
#-- ws_subdline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Crea un VS Cluster SubDomain en arquitectura Brqx
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
#E wccs_cluster mainwar palillos -- Crea el VS identificado por el ID y el SubD
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wccs_cluster()
{
VER="0.0.4"
DEP="00"		# Depth script

wccs_cluster_FUN="wccs_cluster"
wccs_cluster_NFO="Crea un VS  subdominio en arquitectura Brqx [$VER]($DEP)"
wccs_cluster_FMT="wccs_cluster IDSITE"
wccs_cluster_EXA="wccs_cluster espalillos"

wccs_cluster_OUT=0
wccs_cluster_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wccs_cluster_NFO}" "${wccs_cluster_FMT}" "${wccs_cluster_EXA}"
#--------------------------------------------------------------------------------
else
IDSITE=${1}
ID_SUBD=${2}
SITE_DOMAIN=""
SITE_LANGUAGE=""

ws_gscreate
wccs_cluster_OUT=$(expr  ${wccs_cluster_OUT} + ${ws_gscreate_OUT})
wccs_cluster_ERR="${wccs_cluster_ERR}${ws_gscreate_ERR}"


if [ "${ws_gscreate_OUT}" == "0" ] ; then
#--STA_IF_[01] -  [IF DOMAIN_EXIST] ---------------------------------------------


if [ "${MODE}" == "klus" -o "${MODE}" == "lang" ] ; then
#--STA_IF_[02] - [IF  CLUSTER SITE] ---------------------------------------------

COMMAND="wscs_nocluster ${IDSITE}"
echo "----- CLUSTER SITE : ${COMMAND} -----"

wscs_nocluster ${IDSITE} 
##cop "${COMMAND}"

else
#-- SERVER SITE

wscs_nocluster ${IDSITE} 

#--END_IF_[02] - [IF  CLUSTER SITE] ---------------------------------------------
fi


#--END_IF_[01] - [IF ws_gscreate_CORRECT] ---------------------------------------
fi

if [ "${wccs_cluster_OUT}" != "" ] ; then
wccs_cluster_ERR="# ${wccs_cluster_FUN}::##${wccs_cluster_ERR}"
footer_error "${wccs_cluster_ERR}"
fi


fi
}
