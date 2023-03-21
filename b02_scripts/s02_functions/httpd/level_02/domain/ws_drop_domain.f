#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.4" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (02) ] 
#--------------------------------------------------------------------------------
#-- wsdr_domain 
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- webserv_drop_domain  - gwan_drvs
#-- ws_getline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Elimina un VS domain en arquitectura Brqx
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
#E wsdr_domain LINE PATH LANG -- Borra el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wsdr_domain()
{
VER="0.0.4"
DEP="02"		# Depth script

wsdr_domain_FUN="wsdr_domain"
wsdr_domain_NFO="Elimina un VS dominio no cluster en arquitectura Brqx [$VER]($DEP)@${QP}"
wsdr_domain_FMT="wsdr_domain LINE SITE_LANG SITE_DOMAIN"
wsdr_domain_EXA="wsdr_domain espalillos"


if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsdr_domain_NFO}" "${wsdr_domain_FMT}" "${wsdr_domain_EXA}"
#--------------------------------------------------------------------------------
else
FIND_LINE=${1}
SITE_LANGUAGE_L2=${2} 
SITE_DOMAIN_L2=${3}

#-Gwan
gwan_drvs    		${FIND_LINE} ${SITE_LANGUAGE_L2} ${SITE_DOMAIN_L2} 

#-Apache - Lighttp - Nginx - Logs
webserv_drop_domain ${FIND_LINE}  ${SITE_LANGUAGE_L2} ${SITE_DOMAIN_L2} 

fi
}
