#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (03) ] 
#--------------------------------------------------------------------------------
#-- dru_site_create
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- dru_settings_create  - drul - druf - dru_cache_create - dru_modules_create
#-- info_cluster_site_create - ws_getline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I #- Crea un Estrutura Drupal para un Virtual Server 
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
#E dru_site_create LINE LANG -- Crea el VS Drupal identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
dru_domain_create()
{
VER="0.0.5"

dru_domain_create_FUN="dru_domain_create"
dru_domain_create_NFO="Crea estructura Site Drupal [$VER]($DEP) @${QP}"
dru_domain_create_FMT="dru_site_create LINE [SITELANGUAGE] [SITE_DOMAIN]"
dru_domain_create_EXA="dru_site_create LINE es"

dru_domain_create_OUT=0
dru_domain_create_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${dru_domain_create_NFO}" "${dru_domain_create_FMT}" "${dru_domain_create_EXA}"
#--------------------------------------------------------------------------------
else
FIND_LINE=${1}
SITE_LANGUAGE_DRUP=${2}
SITE_DOMAIN_DRUP=${3}

SITE_LANGUAGE=${SITE_LANGUAGE_DRUP}
SITE_DOMAIN=${SITE_DOMAIN_DRUP}

ws_getline ${FIND_LINE}

#-Generate Drupal Settings

#-Revisar 80
if [ "${DRUPAL_VERSION}" == "80" ]	; then 

echo "${F}::Es 80 copiamos"

cp -rf /brqx/lnk/drupal/v80/core/* ${LAN_HOME_PATH}			# */ 

cp -rf  /brqx/lnk/drupal/v80/core/.htaccess ${LAN_HOME_PATH}

chow ${LAN_HOME_PATH}

fi

#-Generate Drupal Settings

dru_domain_settings 		${FIND_LINE} ${SITE_LANGUAGE_DRUP} ${SITE_DOMAIN_DRUP}

#-GENERATING DRUPAL LINKS STRUCTURE

drul  						${DRUPAL_VERSION} ${LAN_HOME_PATH} 
druf  						${DRUPAL_VERSION} ${LAN_HOME_PATH}

#-Cache and Files links

dru_domain_cache_files  	${FIND_LINE}  ${SITE_LANGUAGE_DRUP} 

dru_domain_link_modules  	${FIND_LINE}  ${SITE_LANGUAGE_DRUP} 

SITE_LANGUAGE=""
fi
}
