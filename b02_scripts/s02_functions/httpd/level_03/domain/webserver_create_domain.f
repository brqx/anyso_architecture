#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2017
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (03) ] 
#--------------------------------------------------------------------------------
#-- d-webserv_create_domain-
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- apache_crvs  - lighttp_crvs
#-- ws_getline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I #- Crea un Virtual server domain en arquitectura Brqx
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
#E webserv_create_domain LINE PATH LANG -- Crea el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
webserv_create_domain()
{
VER="0.0.7"								;QP="Brqx Agile Architecture 2017"
DEP="03"		# Depth script

webserv_create_domain_FUN="webserv_create_domain"
webserv_create_domain_NFO="Crea un VS Domain para multiples webservers [$VER]($DEP) @${QP}"
webserv_create_domain_FMT="webserv_create_domain LINE [SITE_LANG] [SITE_DOMAIN]"
webserv_create_domain_EXA="webserv_create_domain LINE es"

webserv_create_domain_OUT=0
webserv_create_domain_ERR=""

F=${webserv_create_domain_FUN}


if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${webserv_create_domain_NFO}" "${webserv_create_domain_FMT}" "${webserv_create_domain_EXA}"
#--------------------------------------------------------------------------------
else
FIND_LINE=${1}
SITE_LANGUAGE_L3=${2}
SITE_DOMAIN_L3=${3}

#-Antes de proceder debemos comprobar que no existe ya uno igual
SITE_DOMAIN=${SITE_DOMAIN_L3}
SITE_LANGUAGE=${SITE_LANGUAGE_L3}

ws_getline ${FIND_LINE}

HOME_PATH_FINAL="${HOME_PATH}${LANGUAGE}/"

mkc ${HOME_PATH_FINAL}

for WS_TYPE in $WEBSERVERS ; do

VS_PATH_FINAL="${VS_PATH}${LANGUAGE}/${WS_TYPE}"
LOGS_PATH_FINAL="${LOGS_PATH}${LANGUAGE}/${WS_TYPE}"
TEMPLATE_FOLDER_FINAL=${TEMPLATE_FOLDER_LEVEL}${LANGUAGE}/${WS_TYPE}

#Create config VS PATH
mkc ${VS_PATH_FINAL}	${LOGS_PATH_FINAL}	${TEMPLATE_FOLDER_FINAL}	

# Httpd56 y Httpd7 van a permitir importacion directa

if 		[ "${WS_TYPE}" == "apache" ] ; then  
#-- Apache Php 5.2 
apache_cr_domain  		${FIND_LINE} 	${WS_TYPE} 	${SITE_LANGUAGE_L3} ${SITE_DOMAIN_L3}

elif  [  "${WS_TYPE}" == "httpd56" -o "${WS_TYPE}" == "httpd7"  ] ; then
#-- Apache Php 5.6 - 7 (Apache no puede servir php5.6 y php7 a la vez)
httpd_cr_domain      ${FIND_LINE}  ${WS_TYPE}  ${SITE_LANGUAGE_L3} ${SITE_DOMAIN_L3}

elif 	[ "${WS_TYPE}" == "lighttp"  	] ; then
#-- Lighttp Php 5.2 - 5.6 - 7 - hiphop
lighttp_cr_domain 		${FIND_LINE} 	${SITE_LANGUAGE_L3} ${SITE_DOMAIN_L3}

elif 	[ "${WS_TYPE}" == "nginx" 		] ; then
#-- Nginx Php 5.2 - 5.6 -  7 - hhvm

nginx_cr_domain 		${FIND_LINE} 	${SITE_LANGUAGE_L3} ${SITE_DOMAIN_L3}


if    [ "${SECURED_SITE}" == "ssl" ] ; then
    #Solo se puede crear si ya existe el certificado

    # echo "LETSNCRYPT FOLDER : /etc/letsencrypt/live/${DOMAIN}"

  HOME_PATH="${HOME_PATH}${LANGUAGE}"

  if [ -d "/etc/letsencrypt/live/${DOMAIN}" ] ; then   
	  # Letsncript debe hacerlo cuando exista ya
		
      # Certificado letsncrypt - Solo lo creara la primera vez
      # Necesitamos el dominio y el path
      # letsencrypt    
    
  
	  echo "LETSNCRYPT : CERT FOLDER EXIST: /etc/letsencrypt/live/${DOMAIN}"
  
	  # Is not good idea to call certbot if domain is not already created
      ###letc ${DOMAIN} ${HOME_PATH}

      nginx_cr_domssl     ${FIND_LINE}  ${SITE_LANGUAGE_L3} ${SITE_DOMAIN_L3}
	else
      mkc "${HOME_PATH}/.well-known"
      
    fi
  fi  


elif 	[ "${WS_TYPE}" == "gwan"  	] ; then
#-Gwan
gwan_crvs    			${FIND_LINE} 	${SITE_LANGUAGE_L3} ${SITE_DOMAIN_L3}

fi

# End For
done

#-Empty variables : 
SITE_LANGUAGE=""
SITE_DOMAIN=""

fi
}
