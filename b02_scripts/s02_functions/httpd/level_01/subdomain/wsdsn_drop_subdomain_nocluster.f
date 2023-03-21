#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2018
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#--------------------------------------------------------------------------------
#-- wsds_nocluster (alias wscsn)
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wsdr_subdomain  - wsdsl_multi_lang
#-- ws_subdline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Elimina VS subdomain en arquitectura Brqx
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T drop virtual_server subdomain
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P ID SUB_ID [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wsds_nocluster mainwar palillos -- Crea el VS identificado por el ID y SUBID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wsds_nocluster()
{
VER="0.0.6"
DEP="01"		# Depth script

wsds_nocluster_FUN="wsds_nocluster"
wsds_nocluster_NFO="Elimina un VS subdominio no cluster en arquitectura Brqx [$VER]($DEP)@${QP}"
wsds_nocluster_FMT="wsds_nocluster LINE SITE_LANG SITE_DOMAIN"
wsds_nocluster_EXA="wsds_nocluster espalillos"

wsds_nocluster_OUT=0
wsds_nocluster_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsds_nocluster_NFO}" "${wsds_nocluster_FMT}" "${wsds_nocluster_EXA}"
#--------------------------------------------------------------------------------
else

IDSITE=${1}

ws_getsubdomainline
wsds_nocluster_OUT=$(expr  ${wsds_nocluster_OUT} + ${ws_getsubdomainline_OUT})
wsds_nocluster_ERR="${wsds_nocluster_ERR}${ws_getsubdomainline_ERR}"

if [ "${ws_getsubdomainline_OUT}" == "0" ] ; then
#--STA_IF_[01] - [IF ws_getsubdomainline_CORRECT] -------------------------------

if [ "${MODE}" == "lang" ] ; then
#--STA_IF[02] - [IF MODE LANG] --------------------------------------------------
wsdsl_multi_lang ${IDSITE} 

wsds_nocluster_OUT=$(expr  ${wsds_nocluster_OUT} + ${wsdsl_multi_lang_OUT})
wsds_nocluster_ERR="${wsds_nocluster_ERR}${wsdsl_multi_lang_ERR}"

else
## - NO MULTI LANGUAGE SITE - MAY BE SERVER OR CLUSTER SITE
#----------------------------------------------------------

#- Generamos estructura para Apache

wsdr_subdomain ${SUBD_LINE} ${MAIN_LINE}    

wsds_nocluster_OUT=$(expr  ${wsds_nocluster_OUT} + ${wsdr_subdomain_OUT})
wsds_nocluster_ERR="${wsds_nocluster_ERR}${wsdr_subdomain_ERR}"


### ADD CREATE USER !!!!

##myucygr ${PROJECT}                              &> /dev/null

#- Reiniciar servicios
##ws_restart_services

#--END_IF_[02] - [IF MODE LANG] -------------------------------------------------
fi

#--END_IF_[01] - [IF ws_getsubdomainline_CORRECT] -------------------------------
fi

if [ "${wsds_nocluster_OUT}" != "0" ] ; then
wsds_nocluster_ERR="#+${wsds_nocluster_FUN}::##${wsds_nocluster_ERR}"
footer_error "${wsds_nocluster_NFO}" "${wsds_nocluster_ERR}"
fi


fi
}
