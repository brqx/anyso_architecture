#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2018
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.9" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (03) ] 
#--------------------------------------------------------------------------------
#-- d-webserv_create_subdomain-
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- apache_create_subdomain  - lighttp_create_subdomain
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
#E webserv_create_subdomain LINE PATH LANG -- Crea el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
webserv_create_subdomain()
{
VER="0.0.9"
DEP="03"		# Depth script

webserv_create_subdomain_FUN="webserv_create_subdomain"
webserv_create_subdomain_NFO="Crea un VS Subdomain para multiples webservers [$VER]($DEP) @${QP}"
webserv_create_subdomain_FMT="webserv_create_subdomain SUBDLINE MAINLINE [SITE_LANG] [SITE_DOMAIN]"
webserv_create_subdomain_EXA="webserv_create_subdomain LINES es"

webserv_create_subdomain_OUT=0
webserv_create_subdomain_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" -o "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${webserv_create_domain_NFO}" "${webserv_create_domain_FMT}" "${webserv_create_domain_EXA}"
#--------------------------------------------------------------------------------
else
SUBD_LINE=${1}
MAIN_LINE=${2}
SITE_LANGUAGE_L3=${3}
SITE_DOMAIN_L3=${4}

SITE_LANGUAGE=${SITE_LANGUAGE_L3}
SITE_DOMAIN=${SITE_DOMAIN_L3}

#--Hay que ajustar subdominios tecnico powerp com - net org  (home - host - logs )

ws_subdline ${SUBD_LINE} ${MAIN_LINE}

FULL_HOME_PATH_FINAL="${HOME_PATH}${LANGUAGE}/"

mkc ${FULL_HOME_PATH_FINAL}  


for WS_TYPE in $WEBSERVERS ; do

VS_PATH_FINAL="${VS_PATH}${LANGUAGE}/${WS_TYPE}/"
LOGS_PATH_FINAL="${LOGS_PATH}${LANGUAGE}/${WS_TYPE}/"
TEMPLATE_FOLDER_LEVEL_FINAL="${TEMPLATE_FOLDER_LEVEL}${LANGUAGE}/${WS_TYPE}/"

#Create config VS PATH
mkc ${VS_PATH_FINAL} ${LOGS_PATH_FINAL}	 ${TEMPLATE_FOLDER_LEVEL_FINAL}							


if 		[ "${WS_TYPE}" == "apache" -o "${WS_TYPE}" == "httpd56" -o "${WS_TYPE}" == "httpd7"	] ; then 
#-- Apache Php 5.2 || Apache Php 5.6 - 7

apache_create_subdomain  	${SUBD_LINE} ${MAIN_LINE} ${WS_TYPE} ${SITE_LANGUAGE_L3}	${SITE_DOMAIN_L3} 
webserv_create_subdomain_OUT=$(expr  ${webserv_create_subdomain_OUT} + ${apache_create_subdomain_OUT})
webserv_create_subdomain_ERR="${webserv_create_subdomain_ERR}${apache_create_subdomain_ERR}"


elif 	[ "${WS_TYPE}" == "lighttp"  	] ; then
#-- Lighttp Php 5.2 - 5.6 -  7 - hhvm

lighttp_create_subdomain 	${SUBD_LINE} ${MAIN_LINE}  	${SITE_LANGUAGE_L3}	${SITE_DOMAIN_L3}
webserv_create_subdomain_OUT=$(expr  ${webserv_create_subdomain_OUT} + ${lighttp_create_subdomain_OUT})
webserv_create_subdomain_ERR="${webserv_create_subdomain_ERR}${lighttp_create_subdomain_ERR}"


elif 	[ "${WS_TYPE}" == "nginx" ] ; then
#-- Nginx Php 5.2 - 5.6 -  7 - hhvm

nginx_create_subdomain 		${SUBD_LINE} ${MAIN_LINE}  	${SITE_LANGUAGE_L3}	${SITE_DOMAIN_L3}
webserv_create_subdomain_OUT=$(expr  ${webserv_create_subdomain_OUT} + ${nginx_create_subdomain_OUT})
webserv_create_subdomain_ERR="${webserv_create_subdomain_ERR}${nginx_create_subdomain_ERR}"

# echp "Before Secured site  ${SECURED_SITE}"  
  if    [ "${SECURED_SITE}" == "ssl"      ] ; then

    HOME_PATH_LAN="${HOME_PATH}${LANGUAGE}"

    if [ -d "/etc/letsencrypt/live/${DOMAIN}" ] ; then   
 
      # Certificado letsncrypt
      # Necesitamos el dominio y el path
      # letsencrypt    
  
  
      # Domain is subdomain
      # echo "call letsc ${DOMAIN} ${HOME_PATH}"
      # letc ${DOMAIN} ${HOME_PATH_LAN}
	  echo "LETSNCRYPT : CERT FOLDER EXIST: /etc/letsencrypt/live/${DOMAIN}"
 
      nginx_cr_subssl     ${SUBD_LINE} ${MAIN_LINE}  ${SITE_LANGUAGE_L3} ${SITE_DOMAIN_L3}

	else
      mkc "${HOME_PATH_LAN}/.well-known"
      lnk ${LAN_HOME_PATH}hola.htm ${HOME_PATH_LAN}/.well-known/hola.htm     
    fi
  fi  


elif 	[ "${WS_TYPE}" == "gwan"  	] ; then
#-Gwan

gwan_create_subdomain    	${SUBD_LINE} ${MAIN_LINE} 	${SITE_LANGUAGE_L3} ${SITE_DOMAIN_L3}
webserv_create_subdomain_OUT=$(expr  ${webserv_create_subdomain_OUT} + ${gwan_create_subdomain_OUT})
webserv_create_subdomain_ERR="${webserv_create_subdomain_ERR}${gwan_create_subdomain_ERR}"

fi

# End For
done


if [ "${webserv_create_subdomain_OUT}" != "0" ] ; then
webserv_create_subdomain_ERR="#+${webserv_create_subdomain_FUN}::##${webserv_create_subdomain_ERR}"
footer_error "${webserv_create_subdomain_NFO}" "${webserv_create_subdomain_ERR}"
fi


#-Empty variables : 
SITE_LANGUAGE=""
SITE_DOMAIN=""

fi
}
