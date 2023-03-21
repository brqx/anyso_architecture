#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.1" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#--------------------------------------------------------------------------------
#-- wscs_nocluster (alias wscsn)
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wscr_subdomain  - wscsl_multi_lang
#-- ws_getline - ws_restart_services
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Crea un subdominio no cluster Nivel 1
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
#E wscs_nocluster mainwar palillos -- Crea el VS identificado por el ID y SUBID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wscs_nocluster()
{
VER="0.1.1"
DEP="01"		# Depth script

wscs_nocluster_FUN="wscs_nocluster"
wscs_nocluster_NFO="Crea un VS subdominio no cluster en arquitectura Brqx [$VER]($DEP)@${QP}"
wscs_nocluster_FMT="wscs_nocluster LINE SITE_LANG SITE_DOMAIN"
wscs_nocluster_EXA="wscs_nocluster espalillos"

wscs_nocluster_OUT=0
wscs_nocluster_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wscs_nocluster_NFO}" "${wscs_nocluster_FMT}" "${wscs_nocluster_EXA}"
#--------------------------------------------------------------------------------
else

IDSITE=${1}

ws_getsubdomainline
wscs_nocluster_OUT=$(expr  ${wscs_nocluster_OUT} + ${ws_getsubdomainline_OUT})
wscs_nocluster_ERR="${wscs_nocluster_ERR}${ws_getsubdomainline_ERR}"


if [ "${ws_getsubdomainline_OUT}" == "0" ] ; then
#--STA_IF_[01] - [IF ws_getsubdomainline_CORRECT] -------------------------------

if [ "${MODE}" == "lang" ] ; then
#--STA_IF_[02] - [IF MODE] ------------------------------------------------------
wscsl_multi_lang ${IDSITE} 

wscs_nocluster_OUT=$(expr  ${wscs_nocluster_OUT} + ${wscsl_multi_lang_OUT})
wscs_nocluster_ERR="${wscs_nocluster_ERR}${wscsl_multi_lang_ERR}"

else
## - NO MULTI LANGUAGE SITE - MAY BE SERVER OR CLUSTER SITE

wscr_subdomain ${SUBD_LINE} ${MAIN_LINE}  

wscs_nocluster_OUT=$(expr  ${wscs_nocluster_OUT} + ${wscr_subdomain_OUT})
wscs_nocluster_ERR="${wscs_nocluster_ERR}${wscr_subdomain_ERR}"

### ADD CREATE USER !!!!

##myucygr ${MAIN_IDSITE}                              &> /dev/null

#- Reiniciar servicios
###ws_restart_services

#--END_IF_[02] - [IF MODE] ------------------------------------------------------
fi

#--END_IF[01] - [IF SUBD_LINE] --------------------------------------------------
fi

if [ "${wscs_nocluster_OUT}" != "0" ] ; then
wscs_nocluster_ERR="#+${wscs_nocluster_FUN}::##${wscs_nocluster_ERR}"
footer_error "${wscs_nocluster_ERR}" "${wscs_nocluster_ERR}"
fi

fi
}
