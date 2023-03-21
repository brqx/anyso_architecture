#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wccd_cluster
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wscd_nocluster (server)
#-- ws_getline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Crea un VS Cluster Domain en arquitectura Brqx
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
#E wccd mainwar -- Crea el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wccd_cluster()
{
VER="0.0.4"
DEP="00"		# Depth script

wccd_cluster_FUN="wccd_cluster"
wccd_cluster_NFO="Crea un VS Cluster  dominio en arquitectura Brqx [$VER]($DEP)"
wccd_cluster_FMT="wccd_cluster IDSITE"
wccd_cluster_EXA="wccd_cluster espalillos"

wccd_cluster_OUT=0
wccd_cluster_MSG=""
wccd_cluster_ERR=""


if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wccd_cluster_NFO}" "${wccd_cluster_FMT}" "${wccd_cluster_EXA}"
#--------------------------------------------------------------------------------
else

IDSITE=${1}
SITE_DOMAIN=""
SITE_LANGUAGE=""

ws_gdcreate
wccd_cluster_OUT=$(expr  ${wccd_cluster_OUT} + ${ws_gdcreate_OUT})
wccd_cluster_ERR="${wccd_cluster_ERR}${ws_gdcreate_ERR}"

if [ "${ws_gdcreate_OUT}" == "0" ] ; then
#--STA_IF_[01] - START [IF ws_getdomainline_CORRECT] ----------------------------


if [ "${MODE}" == "klus" -o "${MODE}" == "lang" ] ; then
#--STA_IF_[02] - START [IF CLUSTER] ---------------------------------------------

#-- CLUSTER SITE
echo "----- CLUSTER SITE -----"

COMMAND="wscd_nocluster ${IDSITE}"

echo "CLUSTER $COMMAND"
wscd_nocluster ${IDSITE}
##cop "${COMMAND}"

else
#-- SERVER SITE

wscd_nocluster ${IDSITE} 

#--END_IF_[02] - END [IF CLUSTER] -----------------------------------------------
fi

#--END_IF_[01] - END [IF ws_getdomainline_CORRECT] ------------------------------
fi

if [ "${wccd_cluster_OUT}" != "0" ] ; then

wccd_cluster_ERR="# ${wccd_cluster_FUN}::##${wccd_cluster_ERR}"
footer_error "${wccd_cluster_ERR}"
fi

fi
}
