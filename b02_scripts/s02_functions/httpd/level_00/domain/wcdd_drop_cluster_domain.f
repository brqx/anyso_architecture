#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wcdd_cluster
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wsdd_nocluster (server)
#-- ws_getline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Elimina un VS Cluster Domain en arquitectura Brqx
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
#E wcdd_cluster mainwar -- Crea el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wcdd_cluster()
{
VER="0.0.6"
DEP="00"		# Depth script

wcdd_cluster_FUN="wcdd_cluster"
wcdd_cluster_NFO="Elimina un VS  dominio en arquitectura Brqx [$VER]($DEP)"
wcdd_cluster_FMT="wcdd_cluster IDSITE"
wcdd_cluster_EXA="wcdd_cluster espalillos"

wcdd_cluster_OUT=0
wcdd_cluster_MSG=""
wcdd_cluster_ERR=""



if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wcdd_cluster_NFO}" "${wcdd_cluster_FMT}" "${wcdd_cluster_EXA}"
#--------------------------------------------------------------------------------

else

IDSITE=${1}
SITE_DOMAIN=""
SITE_LANGUAGE=""

ws_gddrop
wcdd_cluster_OUT=$(expr  ${wcdd_cluster_OUT} + ${ws_gddrop_OUT})
wcdd_cluster_ERR="${wcdd_cluster_ERR}${ws_gddrop_ERR}"

if [ "${ws_gddrop_OUT}" == "0" ] ; then
#--STA_IF_[01] - [IF ws_getdomainline_CORRECT] ----------------------------------

if [ "${MODE}" == "klus" -o "${MODE}" == "lang" ] ; then
#--STA_IF_[02] - [IF CLUSTER] ---------------------------------------------------

COMMAND="wsdd_nocluster ${IDSITE} ${PROJECT_PATH}"

wsdd_nocluster ${IDSITE}
#cop "${COMMAND}"

else
#-- SERVER SITE

wsdd_nocluster ${IDSITE} 

#--END_IF_[02] - [IF CLUSTER] ---------------------------------------------------
fi

#--END_IF_[01] - [IF FINDLINE] --------------------------------------------------
fi
   
if [ "${wcdd_cluster_OUT}" != "0" ] ; then

wcdd_cluster_ERR="# ${wcdd_cluster_FUN}::##${wcdd_cluster_ERR}"
footer_error "${wcdd_cluster_ERR}"

fi


fi
}
