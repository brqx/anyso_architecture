#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.3" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- gwan_crvs_sub
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_template_create
#-- ws_subdline
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
#E gwan_create_subdomain LINE PATH LANG -- Borra el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
gwan_create_subdomain()
{
VER="0.0.4"							;QP="Brqx Agile Architecture 2016"

gwan_create_subdomain_OUT=0
gwan_create_subdomain_MSG=""
gwan_create_subdomain_ERR=""

gwan_create_subdomain_FUN="gwan_create_subdomain"
gwan_create_subdomain_NFO="Crea un Virtual server Nginx Subdomain [$VER]($DEP) @${QP}"
gwan_create_subdomain_FMT="gwan_create_subdomain LINE [SITE_LANG] [SITE_DOMAIN]"
gwan_create_subdomain_EXA="gwan_create_subdomain LINE es"


if [ "${DOMAIN}" == "-?" -o "${1}" == "" -o "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${gwan_create_subdomain_NFO}" "${gwan_create_subdomain_FMT}" "${gwan_create_subdomain_EXA}"
#--------------------------------------------------------------------------------
else
SUBD_LINE=${1}
MAIN_LINE=${2}
SITE_LANGUAGE=${3}
SITE_DOMAIN=${4}

ws_subdline ${SUBD_LINE} ${MAIN_LINE}
gwan_create_subdomain_OUT=$(expr  ${gwan_create_subdomain_OUT} + ${ws_subdline_OUT})
gwan_create_subdomain_ERR="${gwan_create_subdomain_ERR}${ws_subdline_ERR}"


#-Web Server Type - Apache
WS_TYPE="gwan"

TEMPLATE_NAME="template_com.tplt"

TEMPLATE_PATH="/host/tplt/${WS_TYPE}/"

FULL_TEMPLATE_PATH="${TEMPLATE_PATH}${TEMPLATE_NAME}"

FULL_HOME_PATH="${HOME_PATH}${LANGUAGE}/"
CACHE_PATH="${CACHE_PATH}${LANGUAGE}/"


VS_PATH="${VS_PATH}${LANGUAGE}/${WS_TYPE}"
LOGS_PATH="${LOGS_PATH}${LANGUAGE}/${WS_TYPE}"
GWAN_SITE="/srv/gwan/sites/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/"

FULL_VS_DOMAIN_PATH="${VS_PATH}/${VS_DOMAIN}"
TEMPLATE_DOMAIN=dominio_template
TEMPLATE_DCLEAN=dominio_clean

GWAN_PATH="/srv/gwan/${IP_SERVER}:8080/"

CACHE_PATH_GWAN="${CACHE_PATH}gwan"

#Create config VS PATH
mkp ${VS_PATH}	${LOGS_PATH}	${GWAN_SITE} 	${CACHE_PATH_GWAN}

if [ -f ${FULL_VS_DOMAIN_PATH} ] ; then
rm -f ${FULL_VS_DOMAIN_PATH}
fi

cp -f ${FULL_TEMPLATE_PATH} ${FULL_VS_DOMAIN_PATH}  # 2> /dev/null

#-GWAN STRUCTURE

sed -i "s/${TEMPLATE_DOMAIN}/${DOMAIN}/g"       ${FULL_VS_DOMAIN_PATH}


#-GENERATING GWAN STRUCTURE

mkdir -p ${GWAN_PATH}$(cat ${FULL_VS_DOMAIN_PATH} )            	2> /dev/null


lnk  ${FULL_HOME_PATH} 		${GWAN_PATH}$(cat ${FULL_VS_DOMAIN_PATH} )/www

lnk  ${LOGS_PATH} 		${GWAN_PATH}$(cat ${FULL_VS_DOMAIN_PATH} )/logs

lnk  ${CACHE_PATH_GWAN} ${GWAN_PATH}$(cat ${FULL_VS_DOMAIN_PATH} )/gzip


lnk  ${GWAN_PATH}$(cat ${FULL_VS_DOMAIN_PATH} ) ${GWAN_SITE}${LANGUAGE}


chown -R apache:apache ${GWAN_PATH}$(cat ${FULL_VS_DOMAIN_PATH} )       2> /dev/null

chow 	${GWAN_SITE}	${HOME_PATH}  ${LOGS_PATH} 		${VS_PATH}      ${CACHE_PATH}	${CACHE_PATH_GWAN}

if [  "${gwan_create_subdomain_OUT}" != "0" ] ; then
gwan_create_subdomain_ERR="# ${gwan_create_subdomain_FUN}::##${gwan_create_subdomain_ERR}"
footer_error "${gwan_create_subdomain_ERR}"
fi

#-Empty variables : 
SITE_LANGUAGE=""
SITE_DOMAIN=""

fi
}
