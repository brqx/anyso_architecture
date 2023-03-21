#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wcds_cluster
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wcds_cluster (cluster) - wsds_nocluster (server)
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
#E wcds_cluster mainwar palillos -- Crea el VS identificado por el ID y el SubD
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wcds_cluster()
{
VER="0.0.5"
DEP="00"		# Depth script

wcds_cluster_FUN="wcds_cluster"
wcds_cluster_NFO="Elimina un VS subdominio cluster multi idioma [$VER]($DEP)@${QP}"
wcds_cluster_FMT="wcds_cluster LINE SITE_LANG SITE_DOMAIN"
wcds_cluster_EXA="wcds_cluster espalillos"

wcds_cluster_OUT=0
wcds_cluster_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wcds_cluster_NFO}" "${wcds_cluster_FMT}" "${wcds_cluster_EXA}"
#--------------------------------------------------------------------------------
else

IDSITE=${1}
SITE_DOMAIN=""
SITE_LANGUAGE=""

ws_gsdrop
wcds_cluster_OUT=$(expr  ${wcds_cluster_OUT} + ${ws_gsdrop_OUT})
wcds_cluster_ERR="${wcds_cluster_ERR}${ws_gsdrop_ERR}"

if [ "${ws_gsdrop_OUT}" == "0" ] ; then
#--STA_IF_[01] - [IF DOMAIN_EXIST] ----------------------------------------------


if [ "${MODE}" == "klus" -o "${MODE}" == "lang" ] ; then
#--STA_IF_[02] - [IF MULTI LANGUAGE] --------------------------------------------

COMMAND="wsds_nocluster ${IDSITE} ${PROJECT_PATH}"

wsds_nocluster ${IDSITE} 
wcds_cluster_OUT=$(expr  ${wcds_cluster_OUT} + ${wsds_nocluster_OUT})
wcds_cluster_ERR="${wcds_cluster_ERR}${wsds_nocluster_ERR}"

##cop "${COMMAND}"

else
#-- SERVER SITE

wsds_nocluster ${IDSITE} 
wcds_cluster_OUT=$(expr  ${wcds_cluster_OUT} + ${wsds_nocluster_OUT})
wcds_cluster_ERR="${wcds_cluster_ERR}${wsds_nocluster_ERR}"


#--END_IF_[02] - [IF MULTI LANGUAGE] --------------------------------------------
fi

#--END_IF_[01] - END [IF FINDLINE] ----------------------------------------------
fi

if [ "${wcds_cluster_OUT}" != "0" ] ; then
wcds_cluster_ERR="#+${wcds_cluster_FUN}::##${wcds_cluster_ERR}"
footer_error "${wcds_cluster_NFO}" "${wcds_cluster_ERR}"
fi
    

fi
}
