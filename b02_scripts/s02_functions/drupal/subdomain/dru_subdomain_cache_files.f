#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.3" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- dru_subdomain_cache_files
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Crea un Estrutura Drupal Cache para un Virtual Server 
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create virtual_server cluser
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P LINES [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E dru_subdomain_cache_files LINES LANG -- Crea el VS Drupal identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
dru_subdomain_cache_files()
{
VER="0.0.3"

dru_subdomain_cache_files_FUN="dru_subdomain_cache_files"
dru_subdomain_cache_files_NFO="Crea enlaces cache y files para sites drupal en subdominios [$VER]($DEP) @${QP}"
dru_subdomain_cache_files_FMT="dru_domain_cache_files LINE [SITE_LANGUAGE]"
dru_subdomain_cache_files_EXA="dru_subdomain_cache_files LINE es"

dru_subdomain_cache_files_OUT=0
dru_subdomain_cache_files_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" -o "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${dru_subdomain_cache_files_NFO}" "${dru_subdomain_cache_files_FMT}" "${dru_subdomain_cache_files_EXA}"
#--------------------------------------------------------------------------------
else
SUBD_LINE=${1}
MAIN_LINE=${2}
SITE_LANGUAGE=${3}

ws_subdline ${SUBD_LINE} ${MAIN_LINE}

mkc ${LAN_FILES_PATH}		${LAN_CACHE_PATH}		

#- Files drupa link
lnk ${LAN_FILES_PATH} 		${LAN_HOME_PATH}files

lnk ${LAN_HOME_PATH}files	${LAN_HOME_PATH}sites/default/files

#-Cache for Drupal - Boost
lnk ${LAN_CACHE_PATH} 		${LAN_HOME_PATH}cache

SITE_LANGUAGE=""
SITE_DOMAIN=""

fi
}
