#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- gwan_drvs_sub
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_template_drop
#-- ws_subdline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Elimina un Virtual server domain en arquitectura Brqx
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
#E gwan_drop_subdomain LINE PATH LANG -- Borra el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
gwan_drop_subdomain()
{
VER="0.0.6"							;QP="Brqx Agile Architecture 2016"

gwan_drop_subdomain_OUT=0
gwan_drop_subdomain_MSG=""
gwan_drop_subdomain_ERR=""

gwan_drop_subdomain_FUN="gwan_drop_subdomain"
gwan_drop_subdomain_NFO="Crea un Virtual server Nginx Subdomain [$VER]($DEP) @${QP}"
gwan_drop_subdomain_FMT="gwan_drop_subdomain LINE [SITE_LANG] [SITE_DOMAIN]"
gwan_drop_subdomain_EXA="gwan_drop_subdomain LINE es"


if [ "${DOMAIN}" == "-?" -o "${1}" == "" -o "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${gwan_drop_subdomain_NFO}" "${gwan_drop_subdomain_FMT}" "${gwan_drop_subdomain_EXA}"
#--------------------------------------------------------------------------------
else
SUBD_LINE=${1}
MAIN_LINE=${2}
SITE_LANGUAGE=${3}
SITE_DOMAIN=${4}

ws_subdline ${SUBD_LINE} ${MAIN_LINE}
gwan_drop_subdomain_OUT=$(expr  ${gwan_drop_subdomain_OUT} + ${ws_subdline_OUT})
gwan_drop_subdomain_ERR="${gwan_drop_subdomain_ERR}${ws_subdline_ERR}"

#-Web Server Type - Apache
WS_TYPE="gwan"

FULL_HOME_PATH="${HOME_PATH}${LANGUAGE}/"

VS_PATH="${VS_PATH}${LANGUAGE}/${WS_TYPE}"
LOGS_PATH="${LOGS_PATH}${LANGUAGE}/${WS_TYPE}"
GWAN_SITE="/srv/gwan/sites/${MODE}/${DIVISION}/${PROJECT}/${MAINSITE}_${SITE}/"

#-Plantilla Gwan - Nombre de dominio con dollar
FULL_VS_DOMAIN_PATH="${VS_PATH}/${VS_DOMAIN}"

GWAN_PATH="/srv/gwan/${IP_SERVER}:8080/"

if [ -f ${FULL_VS_DOMAIN_PATH}	] ; then
##echo "rm -rf ${GWAN_PATH}$(cat ${FULL_VS_DOMAIN_PATH} )"
	if [ -d ${GWAN_PATH}$(cat ${FULL_VS_DOMAIN_PATH} )  ] ; then
	rm -rf ${GWAN_PATH}$(cat ${FULL_VS_DOMAIN_PATH} )
	fi

	rmf ${FULL_VS_DOMAIN_PATH}
fi

if [ -L ${GWAN_SITE}${LANGUAGE} ] ; then
unlink ${GWAN_SITE}${LANGUAGE}
fi

rmrf ${VS_PATH} ${LOGS_PATH}  ${GWAN_SITE}


if [  "${gwan_drop_subdomain_OUT}" != "0" ] ; then
gwan_drop_subdomain_ERR="# ${gwan_drop_subdomain_FUN}::##${gwan_drop_subdomain_ERR}"
footer_error "${gwan_drop_subdomain_ERR}"
fi

#-Empty variables : 
SITE_LANGUAGE=""
SITE_DOMAIN=""

fi
}
