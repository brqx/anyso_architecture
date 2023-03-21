#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.5" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- gwan_crvs
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_template_create
#-- ws_getline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Crea un VS Gwan domain en arquitectura Brqx
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create virtual_server gwan domain
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P ID [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E gwan_crvs LINE PATH LANG -- Crea el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
gwan_crvs()
{
VER="0.0.4"				;QP="Brqx Agile Architecture 2016"

gwan_crvs_FUN="gwan_crvs"
gwan_crvs_NFO="Crea un Virtual server Gwan  [$VER]($DEP) @${QP}"
gwan_crvs_FMT="gwan_crvs LINE [SITE_LANG] [SITE_DOMAIN]"
gwan_crvs_EXA="gwan_crvs LINE es"

gwan_crvs_OUT=0
gwan_crvs_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${gwan_crvs_NFO}" "${gwan_crvs_FMT}" "${gwan_crvs_EXA}"
#--------------------------------------------------------------------------------
else
FIND_LINE=${1}
SITE_LANGUAGE=${2}
SITE_DOMAIN=${3}

ws_getline ${FIND_LINE}
gwan_crvs_OUT=$(expr  ${gwan_crvs_OUT} + ${ws_getline_OUT})
gwan_crvs_ERR="${gwan_crvs_ERR}${ws_getline_ERR}"


#-Web Server Type - Apache
WS_TYPE="gwan"

TEMPLATE_NAME="template_com.tplt"

TEMPLATE_PATH="/host/tplt/${WS_TYPE}/"

FULL_TEMPLATE_PATH="${TEMPLATE_PATH}${TEMPLATE_NAME}"

HOME_PATH="${HOME_PATH}${LANGUAGE}"
CACHE_PATH="${CACHE_PATH}${LANGUAGE}/"

VS_PATH="${VS_PATH}${LANGUAGE}/${WS_TYPE}/"
LOGS_PATH="${LOGS_PATH}${LANGUAGE}/${WS_TYPE}"
GWAN_SITE="/srv/gwan/sites/${MODE}/${DIVISION}/${PROJECT}/${SITE}/"

CACHE_PATH_GWAN="${CACHE_PATH}gwan"

FULL_VS_DOMAIN_PATH="${VS_PATH}/${VS_DOMAIN}"
TEMPLATE_DOMAIN=dominio_template
TEMPLATE_DCLEAN=dominio_clean

GWAN_PATH="/srv/gwan/${IP_SERVER}:8080/"


#- Copiamos la plantilla en el archivo

#Create config VS PATH
mkp ${VS_PATH}	${LOGS_PATH}	${GWAN_SITE} 	${CACHE_PATH_GWAN}

if [ -f ${FULL_VS_DOMAIN_PATH} ] ; then
rm -f ${FULL_VS_DOMAIN_PATH}
fi

cp -f ${FULL_TEMPLATE_PATH} ${FULL_VS_DOMAIN_PATH}   2> /dev/null

#-GWAN STRUCTURE

sed -i "s/${TEMPLATE_DOMAIN}/${DOMAIN}/g"       ${FULL_VS_DOMAIN_PATH}

#-GENERATING GWAN STRUCTURE

mkdir ${GWAN_PATH}$(cat ${FULL_VS_DOMAIN_PATH} )            2> /dev/null


lnk  ${HOME_PATH} 		${GWAN_PATH}$(cat ${FULL_VS_DOMAIN_PATH} )/www

lnk  ${LOGS_PATH} 		${GWAN_PATH}$(cat ${FULL_VS_DOMAIN_PATH} )/logs

lnk  ${CACHE_PATH_GWAN} ${GWAN_PATH}$(cat ${FULL_VS_DOMAIN_PATH} )/gzip

lnk  ${GWAN_PATH}$(cat ${FULL_VS_DOMAIN_PATH} ) ${GWAN_SITE}${LANGUAGE}


chown -R apache:apache ${GWAN_PATH}$(cat ${FULL_VS_DOMAIN_PATH} )       2> /dev/null

chow 	${GWAN_SITE}	${HOME_PATH}  ${LOGS_PATH} 		${VS_PATH}      ${CACHE_PATH}	${CACHE_PATH_GWAN}

if [  "${gwan_crvs_OUT}" != "0" ] ; then
gwan_crvs_ERR="# ${gwan_crvs_FUN}::##${gwan_crvs_ERR}"
footer_error "${gwan_crvs_ERR}"
fi

#-Empty variables : 
TEMPLATE_PATH=""
TEMPLATE_NAME=""
SITE_LANGUAGE=""
SITE_DOMAIN=""

fi
}
