#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.9" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (02) ] 
#-------------------------------------------------------------------
#-- wscr_domain 
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- webserv_create_domain  - gwan_crvs - dru_site_create
#-- ws_cache_create
#-- ws_getline
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I #- Crea un Virtual server domain en arquitectura Brqx
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T create virtual_server cluser
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P ID [PJ_PATH]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wscr_domain LINE PATH LANG -- Crea el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
wscr_domain()
{
VER="0.0.9"						;QP="Brqx Agile Architecture 2016"
DEP="01"						# Depth script

wscr_domain_FUN="wscr_domain"
wscr_domain_NFO="Crea un VS dominio no cluster en arquitectura Brqx [$VER]($DEP)@${QP}"
wscr_domain_FMT="wscr_domain LINE SITE_LANG SITE_DOMAIN"
wscr_domain_EXA="wscr_domain espalillos"

wscr_domain_OUT=0
wscr_domain_ERR=""

F=${wscr_domain_FUN}

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wscr_domain_NFO}" "${wscr_domain_FMT}" "${wscr_domain_EXA}"
#--------------------------------------------------------------------------------
else
FIND_LINE=${1}
SITE_LANGUAGE_L2=${2} 
SITE_DOMAIN_L2=${3}

#-Apache - Httpd - Lighttp - Nginx - Gwan
webserv_create_domain 	${FIND_LINE} ${SITE_LANGUAGE_L2} 	${SITE_DOMAIN_L2}  
wscr_domain_OUT=$(expr  ${wscr_domain_OUT} + ${webserv_create_domain_OUT})
wscr_domain_ERR="${wscr_domain_ERR}${webserv_create_domain_ERR}"


SITE_LANGUAGE=${SITE_LANGUAGE_L2}
SITE_DOMAIN=${SITE_DOMAIN_L2}


if [ "${PRODUCT}" == "drupal" ] ; then
  if [ "${VARIANT}" != "image_cache" ] ; then
#-Drupal
dru_domain_create   	${FIND_LINE} ${SITE_LANGUAGE_L2}   	${SITE_DOMAIN_L2}
wscr_domain_OUT=$(expr  ${wscr_domain_OUT} + ${dru_domain_create_OUT})
wscr_domain_ERR="${wscr_domain_ERR}${dru_domain_create_ERR}"
  fi
fi

#-Presupone que ya se ha definido LAN_HOME_PATH y LAN_CACHE_CREATE 
ws_cache_create

#-Presupone que ya se ha definido LAN_HOME_PATH y PRODUCT_VERSION 
ws_info_create 

#-Presupone que ya se ha definido LAN_HOME_PATH 
ws_create_hola_link 


if [ "${VARIANT}" != "image_cache" ] ; then
ws_sync_ram 
fi


#-Cargamos la function para que tenga los paths sin dependencida del tipo de servidor

chow ${LAN_HOME_PATH}	${LAN_LOGS_PATH}	${LAN_VS_PATH}	${LAN_CACHE_PATH}

if [ "${wscr_domain_OUT}" != "0" ] ; then
wscr_domain_ERR="#+${wscr_domain_FUN}::##${wscr_domain_ERR}"
footer_error "${wscr_domain_NFO}" "${wscr_domain_ERR}"
fi


fi
}
