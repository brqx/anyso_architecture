#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2018
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (03) ] 
#--------------------------------------------------------------------------------
#-- webserv_drop_domain
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- apache_drvs  - lighttp_drvs
#-- ws_getline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Elimina un Virtual server domain en arquitectura Brqx
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T delete virtual_server domain
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P ID [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E webserv_drop_domain LINE PATH LANG -- Crea el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
webserv_drop_domain()
{
VER="0.0.5"
DEP="03"		# Depth script

webserv_drop_domain_FUN="webserv_drop_domain"
webserv_drop_domain_NFO="Elimina un VS Domain para multiples webservers [$VER]($DEP) @${QP}"
webserv_drop_domain_FMT="webserv_drop_domain LINE [SITE_LANG] [SITE_DOMAIN]"
webserv_drop_domain_EXA="webserv_drop_domain LINE es"

webserv_drop_domain_OUT=0
webserv_drop_domain_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${webserv_drop_domain_NFO}" "${webserv_drop_domain_FMT}" "${webserv_drop_domain_EXA}"
#--------------------------------------------------------------------------------
else
FIND_LINE=${1}
SITE_LANGUAGE=${2}
SITE_DOMAIN=${3}

ws_getline ${FIND_LINE}

VS_PATH="${VS_PATH}${LANGUAGE}/"
LOGS_PATH="${LOGS_PATH}${LANGUAGE}/"
HOME_PATH="${HOME_PATH}${LANGUAGE}/"

#Delete config VS PATH

rmrf ${HOME_PATH} ${VS_PATH} ${LOGS_PATH}

echo "Folders deleted : ${HOME_PATH} ${VS_PATH} ${LOGS_PATH}"
SITE_LANGUAGE=""
SITE_DOMAIN=""
fi
}
