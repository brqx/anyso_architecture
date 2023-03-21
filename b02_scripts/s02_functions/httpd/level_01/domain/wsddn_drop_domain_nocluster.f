#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.4" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#--------------------------------------------------------------------------------
#-- wsdd_nocluster
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wsdr_domain  - wsddl_multi_lang
#-- ws_getline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Elimina un VS domain en arquitectura Brqx
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T drop virtual_server cluser
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P ID [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wsdd_nocluster mainwar palillos -- Borra el VS identificado por el ID y SUBID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wsdd_nocluster()
{
VER="0.0.4"
DEP="01"		# Depth script

wsdd_nocluster_FUN="wsdd_nocluster"
wsdd_nocluster_NFO="Elimina un VS dominio no cluster en arquitectura Brqx [$VER]($DEP)@{QP}"
wsdd_nocluster_FMT="wsdd_nocluster IDSITE"
wsdd_nocluster_EXA="wsdd_nocluster espalillos"

wsdd_nocluster_OUT=0
wsdd_nocluster_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsdd_nocluster_NFO}" "${wsdd_nocluster_FMT}" "${wsdd_nocluster_EXA}"
#--------------------------------------------------------------------------------
else

IDSITE=${1}

ws_gddrop
wsdd_nocluster_OUT=$(expr  ${wsdd_nocluster_OUT} + ${ws_gddrop_OUT})
wsdd_nocluster_ERR="${wsdd_nocluster_ERR}${ws_gddrop_ERR}"

if [ "${ws_gddrop_OUT}" == "0" ] ; then
#--STA_IF_[01] - [IF ws_getdomainline_CORRECT] ----------------------------------


if [ "${MODE}" == "lang" ] ; then
#--STA_IF_[02] - [IF LANG] ------------------------------------------------------

wsddl_multi_lang ${IDSITE}  

else
## - NO MULTI LANGUAGE SITE - MAY BE SERVER OR CLUSTER SITE

wsdr_domain ${FIND_LINE}   

### DONT DROP USER !!!!

#- Reiniciar servicios
##ws_restart_services

#--[02] - END [IF MULTI LANG] ---------------------------------------------------
fi

#--[01] - END [IF FINDLINE] -----------------------------------------------------
fi

if [ "${wsdd_nocluster_OUT}" != "0" ] ; then
wsdd_nocluster_ERR="# ${FUNC}::##${wsdd_nocluster_ERR}"
footer_error "${wsdd_nocluster_ERR}"
fi


fi
}
