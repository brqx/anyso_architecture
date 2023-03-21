#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wsdd
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wscr_subdomain  - wscsl_multi_lang
#-- ws_getline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Elimina un Virtual server domain en arquitectura Brqx
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
#E wsdd mainwar -- Borra el VS identificado por el ID y SUBID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wsdd()
{
VER="0.0.6"
DEP="00"		# Depth script


wsdd_FUN="wsdd"
wsdd_NFO="Elimina un VS  dominio en arquitectura Brqx [$VER]($DEP)"
wsdd_FMT="wsdd IDSITE"
wsdd_EXA="wsdd espalillos"

wsdd_OUT=0
wsdd_MSG=""
wsdd_ERR=""


if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsdd_NFO}" "${wsdd_FMT}" "${wsdd_EXA}"
#--------------------------------------------------------------------------------
else

IDSITE=${1}

SITE_DOMAIN=""
SITE_LANGUAGE=""

ws_gddrop
wsdd_OUT=$(expr  ${wsdd_OUT} + ${ws_gddrop_OUT})
wsdd_ERR="${wsdd_ERR}${ws_gddrop_ERR}"

if [ "${ws_gddrop_OUT}" == "0" ] ; then
#--STA_IF_[01] - [IF ws_getdomainline_CORRECT] ----------------------------------

if [ "${MODE}" == "klus" -o "${MODE}" == "lang" ] ; then
#--STA_IF_[02] - [IF CLUSTER] ---------------------------------------------------

wcdd_cluster ${IDSITE}  

else
wsdd_nocluster ${IDSITE}  

#--END_IF_[02] - [IF CLUSTER] ---------------------------------------------------
fi

#--END_IF_[01] - [IF ws_getdomainline_CORRECT] ----------------------------------
fi

if [ "${wsdd_OUT}" != "0" ] ; then

wsdd_ERR="# ${wsdd_OUT_FUN}::##${wsdd_ERR}"
footer_error "${wsdd_ERR}"

fi


fi
}
