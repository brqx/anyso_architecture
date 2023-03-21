#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2017
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.1" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#--------------------------------------------------------------------------------
#-- d-wscd_nocluster-
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wscr_domain  - wscdl_multi_lang
#-- ws_getline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Crea un Virtual server domain en arquitectura Brqx
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create virtual_server domain nocluster
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P ID [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wscd_nocluster mainwar -- Crea el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wscd_nocluster()
{
VER="0.1.1"								;QP="Brqx Agile Architecture 2016"
DEP="01"		# Depth script

wscd_nocluster_FUN="wscd_nocluster"
wscd_nocluster_NFO="Crea un VS dominio no cluster en arquitectura Brqx [$VER]($DEP)@{QP}"
wscd_nocluster_FMT="wscd_nocluster IDSITE"
wscd_nocluster_EXA="wscd_nocluster espalillos"

wscd_nocluster_OUT=0
wscd_nocluster_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wscd_nocluster_NFO}" "${wscd_nocluster_FMT}" "${wscd_nocluster_EXA}"
#--------------------------------------------------------------------------------

else

IDSITE=${1}

ws_gdcreate
wscd_nocluster_OUT=$(expr  ${wscd_nocluster_OUT} + ${ws_gdcreate_OUT})
wscd_nocluster_ERR="${wscd_nocluster_ERR}${ws_gdcreate_ERR}"

if [ "${ws_gdcreate_OUT}" == "0" ] ; then
#--STA_IF_[01] - [IF ws_getdomainline_CORRECT] ----------------------------------

if [ "${MODE}" == "lang" ] ; then
#--STA_IF_[02] - [IF MULTI LANG] ------------------------------------------------
wscdl_multi_lang ${IDSITE} 

else
## - NO MULTI LANGUAGE SITE - MAY BE SERVER OR CLUSTER SITE

wscr_domain ${FIND_LINE}

#--END_IF_[02] - [IF MULTI LANG] ------------------------------------------------
fi

### ADD CREATE USER !!!!

myucygr ${PROJECT}                              &> /dev/null

#- Reiniciar servicios
ws_restart_services

#--END_IF_[01] - [IF ws_getdomainline_CORRECT] ----------------------------------
fi

if [ "${wscd_nocluster_OUT}" != "0" ] ; then
wscd_nocluster_ERR="#+${wscd_nocluster_FUN}::##${wscd_nocluster_ERR}"
footer_error "${wscd_nocluster_NFO}" "${wscd_nocluster_ERR}"
fi


fi
}
