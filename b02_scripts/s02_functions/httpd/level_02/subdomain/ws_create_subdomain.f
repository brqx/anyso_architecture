#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.8" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (02) ] 
#--------------------------------------------------------------------------------
#-- wscr_subdomain 
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- webserv_create_subdomain  - gwan_create_subdomain - dru_site_create
#-- ws_subdline
#-- ws_cache_create - ws_info_create - ws_create_hola_link - ws_sync_ram 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Crea un Virtual server domain en arquitectura Brqx
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
#E wscr_subdomain LINE PATH LANG -- Crea el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wscr_subdomain()
{
VER="0.0.8"

wscr_subdomain_FUN="wscr_subdomain"
wscr_subdomain_NFO="Crea un VS subdominio en arquitectura Brqx [$VER]($DEP)@${QP}"
wscr_subdomain_FMT="wscr_subdomain LINES SITE_LANG SITE_DOMAIN"
wscr_subdomain_EXA="wscr_subdomain LINES espalillos"

wscr_subdomain_OUT=0
wscr_subdomain_ERR=""


if [ "${1}" == "-?" -o "${1}" == "" -o "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wscr_subdomain_NFO}" "${wscr_subdomain_FMT}" "${wscr_subdomain_EXA}"
#--------------------------------------------------------------------------------
else
SUBD_LINE=${1}
MAIN_LINE=${2}
SITE_LANGUAGE_L2=${3} 
SITE_DOMAIN_L2=${4}

#-Apache - Lighttp - Nginx
webserv_create_subdomain 		${SUBD_LINE} ${MAIN_LINE} ${SITE_LANGUAGE_L2} ${SITE_DOMAIN_L2}  
wscr_subdomain_OUT=$(expr  ${wscr_subdomain_OUT} + ${webserv_create_subdomain_OUT})
wscr_subdomain_ERR="${wscr_subdomain_ERR}${webserv_create_subdomain_ERR}"

if [ "${PRODUCT}" == "drupal" ] ; then
  if [ "${VARIANT}" != "image_cache" ] ; then
#-Drupal
dru_subdomain_create 		${SUBD_LINE} ${MAIN_LINE} ${SITE_LANGUAGE_L2} ${SITE_DOMAIN_L2}   
wscr_subdomain_OUT=$(expr  ${wscr_subdomain_OUT} + ${dru_subdomain_create_OUT})
wscr_subdomain_ERR="${wscr_subdomain_ERR}${dru_subdomain_create_ERR}"
  fi
fi

SITE_LANGUAGE=${SITE_LANGUAGE_L2}
SITE_DOMAIN=${SITE_DOMAIN_L2}

ws_subdline ${SUBD_LINE} ${MAIN_LINE}

## pers/drupal/v50/cache/emp/flat/zd_main_flat/es/lighttp    /home/ser/zd/main/es/zdom/emp/truck/zd_main_truck/es/lcache

## echp ${FOLDER_BASE}
#echo "ANTES_DE_CREAR ${LCACHE_FOLDER_BASE}    ${LAN_HOME_PATH}lcache"

ws_cache_create 

ws_info_create 

ws_create_hola_link 

if [ "${VARIANT}" != "image_cache" ] ; then
ws_sync_ram 
fi

# VS_PATH /host/serv/arq/node/zd_main_node/es/

chow ${LAN_HOME_PATH}	${LAN_LOGS_PATH}	${LAN_VS_PATH}	${LAN_CACHE_PATH}

chow ${MAINHOME_PATH}

if [ "${wscr_subdomain_OUT}" != "0" ] ; then
wscr_subdomain_ERR="#+${wscr_subdomain_FUN}::##${wscr_subdomain_ERR}"
footer_error "${wscr_subdomain_NFO}" "${wscr_subdomain_ERR}"
fi

fi
}
