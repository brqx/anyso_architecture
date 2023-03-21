#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- gwan_drvs
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_getline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Elimina un VS Gwan domain en arquitectura Brqx
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T delete virtual_server gwan domain
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P ID [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E gwan_crvs LINE PATH LANG -- Crea el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
gwan_drvs()
{
VER="0.0.5"						;QP="Brqx Agile Architecture 2016"
DEP="04"		# Depth script

gwan_drvs_FUN="gwan_drvs"
gwan_drvs_NFO="Elimina un Virtual Server Domain Gwan  [$VER]($DEP) @${QP}"
gwan_drvs_FMT="gwan_drvs LINE [SITE_LANG] [SITE_DOMAIN]"
gwan_drvs_EXA="gwan_drvs LINE es"

gwan_drvs_OUT=0
gwan_drvs_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${gwan_drvs_NFO}" "${gwan_drvs_FMT}" "${gwan_drvs_EXA}"
#--------------------------------------------------------------------------------
else
FIND_LINE=${1}
SITE_LANGUAGE=${2}
SITE_DOMAIN=${3}

ws_getline ${FIND_LINE}

gwan_drvs_OUT=$(expr  ${gwan_drvs_OUT} + ${ws_getline_OUT})
gwan_drvs_ERR="${gwan_drvs_ERR}${ws_getline_ERR}"


#-Web Server Type - Apache
WS_TYPE="gwan"

HOME_PATH="${HOME_PATH}${LANGUAGE}/"

VS_PATH="${VS_PATH}${LANGUAGE}/${WS_TYPE}/"
LOGS_PATH="${LOGS_PATH}${LANGUAGE}/${WS_TYPE}/"
GWAN_SITE="/srv/gwan/sites/${MODE}/${DIVISION}/${PROJECT}/${SITE}/"

FULL_VS_DOMAIN_PATH="${VS_PATH}/${VS_DOMAIN}"

GWAN_PATH="/srv/gwan/${IP_SERVER}:8080/"

if [ -f ${FULL_VS_DOMAIN_PATH} ] ; then
##echo "rm -rf ${GWAN_PATH}$(cat ${FULL_VS_DOMAIN_PATH} )"
rm -rf ${GWAN_PATH}$(cat ${FULL_VS_DOMAIN_PATH} )
rmf ${FULL_VS_DOMAIN_PATH}
fi

if [ -L ${GWAN_SITE}${LANGUAGE} ] ; then
unlink ${GWAN_SITE}${LANGUAGE}
fi

#Create config VS PATH
rmrf ${VS_PATH}	${LOGS_PATH}	${GWAN_SITE}


if [  "${gwan_drvs_OUT}" != "0" ] ; then
gwan_drvs_ERR="# ${gwan_drvs_FUN}::##${gwan_drvs_ERR}"
footer_error "${gwan_drvs_ERR}"
fi


SITE_LANGUAGE=""
SITE_DOMAIN=""

fi
}
