#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2018
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (02) ] 
#--------------------------------------------------------------------------------
#-- wsdr_subdomain 
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- webserv_drop_subdomain  - gwan_drop_subdomain
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Elimina un VS subdomain en arquitectura Brqx
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
#E wsdr_subdomain LINE HOME MAIN PATH LANG -- Crea el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wsdr_subdomain()
{
VER="0.0.6"

wsdr_subdomain_FUN="wsdr_subdomain"
wsdr_subdomain_NFO="Elimina un VS subdominio en arquitectura Brqx [$VER]($DEP)@${QP}"
wsdr_subdomain_FMT="wsdr_subdomain LINE SITE_LANG SITE_DOMAIN"
wsdr_subdomain_EXA="wsdr_subdomain espalillos"

wsdr_subdomain_OUT=0
wsdr_subdomain_ERR=""

if [ "${1}" == "-?" -o "${1}" == ""  -o "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsdr_subdomain_NFO}" "${wsdr_subdomain_FMT}" "${wsdr_subdomain_EXA}"
#--------------------------------------------------------------------------------
else
SUBD_LINE=${1}
MAIN_LINE=${2}
SITE_LANGUAGE_L2=${3} 
SITE_DOMAIN_L2=${4}

#-Gwan
gwan_drop_subdomain    ${SUBD_LINE} ${MAIN_LINE} 	${SITE_LANGUAGE_L2} 	${SITE_DOMAIN_L2}
wsdr_subdomain_OUT=$(expr  ${wsdr_subdomain_OUT} + ${gwan_drop_subdomain_OUT})
wsdr_subdomain_ERR="${wsdr_subdomain_ERR}${gwan_drop_subdomain_ERR}"


#-Apache
webserv_drop_subdomain ${SUBD_LINE} ${MAIN_LINE}   	${SITE_LANGUAGE_L2} 	${SITE_DOMAIN_L2} 
wsdr_subdomain_OUT=$(expr  ${wsdr_subdomain_OUT} + ${webserv_drop_subdomain_OUT})
wsdr_subdomain_ERR="${wsdr_subdomain_ERR}${webserv_drop_subdomain_ERR}"

if [ "${wsdr_subdomain_OUT}" != "0" ] ; then
wsdr_subdomain_ERR="#+${wsdr_subdomain_FUN}::##${wsdr_subdomain_ERR}"
footer_error "${wsdr_subdomain_NFO}" "${wsdr_subdomain_ERR}"
fi


fi
}
