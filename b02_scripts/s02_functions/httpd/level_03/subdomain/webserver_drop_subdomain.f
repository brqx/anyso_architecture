#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (03) ] 
#--------------------------------------------------------------------------------
#-- webserv_drop_domain
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- apache_drop_subdomain  - lighttp_drop_subdomain
#-- ws_subdline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Elimina un VS subdomain en arquitectura Brqx
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
#E webserv_drop_subdomain LINE PATH LANG -- Crea el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
webserv_drop_subdomain()
{
VER="0.0.5"
DEP="03"		# Depth script

webserv_drop_subdomain_FUN="webserv_drop_subdomain"
webserv_drop_subdomain_NFO="Elimina un VS Subdomain para multiples webservers [$VER]($DEP) @${QP}"
webserv_drop_subdomain_FMT="webserv_drop_subdomain LINE [SITE_LANG] [SITE_DOMAIN]"
webserv_drop_subdomain_EXA="webserv_drop_subdomain LINE es"

webserv_drop_subdomain_OUT=0
webserv_drop_subdomain_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" -o "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${webserv_drop_subdomain_NFO}" "${webserv_drop_subdomain_FMT}" "${webserv_drop_subdomain_EXA}"
#--------------------------------------------------------------------------------
else
SUBD_LINE=${1}
MAIN_LINE=${2}
SITE_LANGUAGE=${3}
SITE_DOMAIN=${4}

#-Antes de proceder debemos comprobar que no existe ya uno igual

ws_subdline ${SUBD_LINE} ${MAIN_LINE}

rmrf ${LAN_HOME_PATH} ${LAN_VS_PATH} ${LAN_LOGS_PATH}

if [ "${webserv_drop_subdomain_OUT}" != "0" ] ; then
webserv_drop_subdomain_ERR="#+${webserv_drop_subdomain_FUN}::##${webserv_drop_subdomain_ERR}"
footer_error "${webserv_drop_subdomain_NFO}" "${webserv_drop_subdomain_ERR}"
fi

#-Empty variables : 
SITE_LANGUAGE=""
SITE_DOMAIN=""

fi
}
