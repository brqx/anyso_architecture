#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- dru_domain_link_modules
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- dru_link_modules
#-- ws_getline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I #- Crea un Estrutura Drupal Info para un Virtual Server 
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
#E dru_domain_link_modules LINE PATH LANG -- Crea el VS Drupal Modules identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
dru_domain_link_modules()
{
VER="0.0.5"

dru_domain_link_modules_FUN="dru_domain_link_modules"
dru_domain_link_modules_NFO="Genera estructura enlaces simbolicos base y pers para sites Drupal [$VER]($DEP) @${QP}"
dru_domain_link_modules_FMT="dru_domain_link_modules LINE [SITE_LANGUAGE] "
dru_domain_link_modules_EXA="dru_domain_link_modules LINE es"

dru_domain_link_modules_OUT=0
dru_domain_link_modules_ERR=""

if [ "${1}" == "-?" -o "${1}" == ""  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${dru_domain_link_modules_NFO}" "${dru_domain_link_modules_FMT}" "${dru_domain_link_modules_EXA}"
#--------------------------------------------------------------------------------

else
FIND_LINE=${1}
SITE_LANGUAGE=${2}

MODULES_BASE="$(         cat  ${FIND_LINE} | grep 'MOD_BAS'     | cut -d '=' -f2                       )"
THEMES_BASE="$(          cat  ${FIND_LINE} | grep 'THM_BAS'     | cut -d '=' -f2                       )"
TEMPLATES_BASE="$(       cat  ${FIND_LINE} | grep 'TPL_BAS'     | cut -d '=' -f2                       )"

MODULES_PERS="$(         cat  ${FIND_LINE} | grep 'MOD_PER'     | cut -d '=' -f2                       )"
THEMES_PERS="$(          cat  ${FIND_LINE} | grep 'THM_PER'     | cut -d '=' -f2                       )"
TEMPLATES_PERS="$(       cat  ${FIND_LINE} | grep 'TPL_PER'     | cut -d '=' -f2                       )"

#-Setting Drupal home Path

ws_getline ${FIND_LINE}

HOME_PATH="${HOME_PATH}${LANGUAGE}/"

if [ "${DRUPAL_VERSION}" == "80" ]	; then 
echo "$FUNC - Is 80"
PRODUCTS_BASE=""
else
PRODUCTS_BASE="sites/all/"
fi

DRUPAL_HOME_PATH="${HOME_PATH}${PRODUCTS_BASE}"

#-Linking modules and themes

dru_link_modules

SITE_LANGUAGE=""
SITE_DOMAIN=""

fi
}
