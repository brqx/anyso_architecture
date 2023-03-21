#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.3" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- dru_modules_create
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- dru_link_modules
#-- ws_subdline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Genera estructura enlaces simbolicos base y pers para sites Drupal en subdominios
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
#E dru_subdomain_link_modules LINE PATH LANG -- Genera estructura enlaces simbolicos base y pers para sites Drupal en subdominios
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
dru_subdomain_link_modules()
{
VER="0.0.3"

dru_subdomain_link_modules_FUN="dru_subdomain_link_modules"
dru_subdomain_link_modules_NFO="Genera estructura enlaces simbolicos base y pers para sites Drupal en subdominios [$VER]($DEP) @${QP}"
dru_subdomain_link_modules_FMT="dru_subdomain_link_modules LINE [SITE_LANGUAGE] "
dru_subdomain_link_modules_EXA="dru_subdomain_link_modules LINE es"

dru_subdomain_link_modules_OUT=0
dru_subdomain_link_modules_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" -o "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${dru_subdomain_link_modules_NFO}" "${dru_subdomain_link_modules_FMT}" "${dru_subdomain_link_modules_EXA}"
#--------------------------------------------------------------------------------
else
SUBD_LINE=${1}
MAIN_LINE=${2}
SITE_LANGUAGE=${3}

MODULES_BASE="$(         cat  ${SUBD_LINE} | grep 'MOD_BAS'     | cut -d '=' -f2                       )"
THEMES_BASE="$(          cat  ${SUBD_LINE} | grep 'THM_BAS'     | cut -d '=' -f2                       )"
TEMPLATES_BASE="$(       cat  ${SUBD_LINE} | grep 'TPL_BAS'     | cut -d '=' -f2                       )"

MODULES_PERS="$(         cat  ${SUBD_LINE} | grep 'MOD_PER'     | cut -d '=' -f2                       )"
THEMES_PERS="$(          cat  ${SUBD_LINE} | grep 'THM_PER'     | cut -d '=' -f2                       )"
TEMPLATES_PERS="$(       cat  ${SUBD_LINE} | grep 'TPL_PER'     | cut -d '=' -f2                       )"

#-Setting Drupal home Path

ws_subdline ${SUBD_LINE} ${MAIN_LINE}

if [ "${DRUPAL_VERSION}" == "80" ]	; then 
echo "$FUNC - Is 80"
PRODUCTS_BASE=""
else
PRODUCTS_BASE="sites/all/"
fi

DRUPAL_HOME_PATH="${LAN_HOME_PATH}${PRODUCTS_BASE}"

#-Linking modules and themes

dru_link_modules

fi
}
