#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (03) ] 
#--------------------------------------------------------------------------------
#-- dru_subdomain_create
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- dru_settings_create  - drul - druf - dru_cache_create - dru_modules_create
#-- info_cluster_site_create - ws_subdline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Crea estructura Site Drupal en subdominio
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
#E dru_subdomain_create LINE PATH LANG -- Crea el VS Drupal identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
dru_subdomain_create()
{
VER="0.0.5"

dru_subdomain_create_FUN="dru_subdomain_create"
dru_subdomain_create_NFO="Crea estructura Site Drupal en subdominio [$VER]($DEP) @${QP}"
dru_subdomain_create_FMT="dru_subdomain_create LINE [SITELANGUAGE] [SITE_DOMAIN]"
dru_subdomain_create_EXA="dru_subdomain_create LINE es"

dru_subdomain_create_OUT=0
dru_subdomain_create_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" -o "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${dru_subdomain_create_NFO}" "${dru_subdomain_create_FMT}" "${dru_subdomain_create_EXA}"
#--------------------------------------------------------------------------------
else
SUBD_LINE=${1}
MAIN_LINE=${2}
SITE_LANGUAGE_DRUPAL=${3}
SITE_DOMAIN_DRUPAL=${4}

SITE_DOMAIN=${SITE_DOMAIN_DRUPAL}
SITE_LANGUAGE=${SITE_LANGUAGE_DRUPAL}

ws_subdline ${SUBD_LINE} ${MAIN_LINE}


if [ "${DRUPAL_VERSION}" == "80" ]	; then 

echo "${F}::Es 80 copiamos"

cp -rf  /brqx/lnk/drupal/v80/core/* ${LAN_HOME_PATH}			# */ 

cp -rf  /brqx/lnk/drupal/v80/core/.htaccess ${LAN_HOME_PATH}

chow ${LAN_HOME_PATH}
fi

#-Generate Drupal Settings

dru_subdomain_settings 		${SUBD_LINE} ${MAIN_LINE}  ${SITE_LANGUAGE_DRUPAL} ${SITE_DOMAIN_DRUPAL}

#-GENERATING DRUPAL LINKS STRUCTURE

drul  						${DRUPAL_VERSION} ${LAN_HOME_PATH} 
druf  						${DRUPAL_VERSION} ${LAN_HOME_PATH}

#-Cache and Files links

dru_subdomain_cache_files  	${SUBD_LINE} ${MAIN_LINE} ${SITE_LANGUAGE_DRUPAL} 

dru_subdomain_link_modules  ${SUBD_LINE} ${MAIN_LINE} ${SITE_LANGUAGE_DRUPAL} 

SITE_DOMAIN=""
SITE_LANGUAGE=""

fi
}
