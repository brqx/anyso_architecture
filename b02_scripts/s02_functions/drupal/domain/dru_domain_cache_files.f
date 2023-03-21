#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- dru_domain_cache_files
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I #- Crea un Estrutura Drupal Cache para un Virtual Server 
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create virtual_server cluser
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P FIND_LINE [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E dru_domain_cache_files LINE PATH LANG -- Crea el VS Drupal identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
dru_domain_cache_files()
{
VER="0.0.5"
DEP="00"		# Depth script


dru_domain_cache_files_FUN="dru_domain_cache_files"
dru_domain_cache_files_NFO="Crea enlaces cache y files para sites drupal en dominios [$VER]($DEP) @${QP}"
dru_domain_cache_files_FMT="dru_domain_cache_files LINE [SITE_LANGUAGE]"
dru_domain_cache_files_EXA="dru_domain_cache_files LINE es"

dru_domain_cache_files_OUT=0
dru_domain_cache_files_ERR=""

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${dru_domain_cache_files_NFO}" "${dru_domain_cache_files_FMT}" "${dru_domain_cache_files_EXA}"
#--------------------------------------------------------------------------------
else
FIND_LINE=${1}
SITE_LANGUAGE=${2}

ws_getline $FIND_LINE

mkc ${LAN_FILES_PATH}	${LAN_CACHE_PATH}		

#- Files drupal link
lnk ${LAN_FILES_PATH} 	${LAN_HOME_PATH}files

#-Cache for Drupal - Boost
lnk ${LAN_CACHE_PATH} 	${LAN_HOME_PATH}cache

if [ "${DRUPAL_VERSION}" == "50" -o "${DRUPAL_VERSION}" == "70" ]	; then 

lnk ${LAN_HOME_PATH}files		${LAN_HOME_PATH}sites/default/files

fi

SITE_LANGUAGE=""
SITE_DOMAIN=""

fi
}
