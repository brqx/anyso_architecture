#!/bin/bash
##-------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2020
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.8" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- nginx_cr_domssl
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_template_create
#-- ws_getline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Crea un Virtual server domain Nginx en arquitectura Brqx
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create virtual_server domain nginx
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P ID [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E nginx_cr_domssl LINE PATH LANG -- Crea el VS Domain SSL identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
nginx_cr_domssl()
{
VER="0.0.7"					;QP="Brqx Agile Architecture 2018"

nginx_cr_domssl_OUT=0
nginx_cr_domssl_MSG=""
nginx_cr_domssl_ERR=""

nginx_cr_domssl_FUN="nginx_cr_domssl"
nginx_cr_domssl_NFO="Crea un Virtual server Nginx Ssl  [$VER]($DEP) @${QP}"
nginx_cr_domssl_FMT="nginx_cr_domssl LINE [SITE_LANG] [SITE_DOMAIN]"
nginx_cr_domssl_EXA="nginx_cr_domssl LINE es"


if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${nginx_cr_domssl_NFO}" "${nginx_cr_domssl_FMT}" "${nginx_cr_domssl_EXA}"
#--------------------------------------------------------------------------------
else
FIND_LINE=${1}
SITE_LANGUAGE=${2}
SITE_DOMAIN=${3}

ws_getline ${FIND_LINE}

TEMPLATE_NAME="template_ssl_com.tplt"
WWW_TEMPLATE_NAME="www_${TEMPLATE_NAME}"

NODEJS_NAME="template_ssl_com.page"

WS_TYPE="nginx"

TEMPLATE_PATH="/host/tplt/${WS_TYPE}/${PRODUCT}/domain/"

TEMPLATE_FULL_NAME="${TEMPLATE_PATH}${TEMPLATE_NAME}"
WWW_TEMPLATE_FULL_NAME="${TEMPLATE_PATH}${WWW_TEMPLATE_NAME}"

TEMPLATE_NODEJS_NAME="${TEMPLATE_PATH}${NODEJS_NAME}"

# /host/tplt/nginx/template_ssl_com.tplt

#-Server information example
#---------------------------------------------------
#Deployment Servers - apache
#SERVERS=lighttp:nginx:nginxhh:httpd:gwan
#---------------------------------------------------
#ENGINE_NGINX=hiphop
#ENGINE_LIGHTTP=php70
#---------------------------------------------------

nginx_cr_domssl_OUT=$(expr  ${nginx_cr_domssl_OUT} + ${ws_getline_OUT})
nginx_cr_domssl_ERR="${nginx_cr_domssl_ERR}${ws_getline_ERR}"


VS_PATH="${VS_PATH}${LANGUAGE}/${WS_TYPE}/"

TEMPLATE_FULL_NAME_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_SSL_DOMAIN}"
WWW_TEMPLATE_FULL_NAME_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/www_${VS_SSL_DOMAIN}"

TEMPLATE_NODEJS_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_SSL_NODEJS}"

TEMPLATE_FOLDER_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/"

FULL_VS_DOMAIN_PATH="${VS_PATH}${VS_DOMAIN}"

mkc ${TEMPLATE_FOLDER_LEVEL}												


echo "y" | cp -f ${TEMPLATE_FULL_NAME} ${TEMPLATE_FULL_NAME_LEVEL}    		   	2> /dev/null

echo "y" | cp -f ${WWW_TEMPLATE_FULL_NAME} ${WWW_TEMPLATE_FULL_NAME_LEVEL}    	2> /dev/null


if  [ "${PRODUCT}" == "nodejs" ] ; then
echo "s" | cp -f ${TEMPLATE_NODEJS_NAME}    ${TEMPLATE_NODEJS_LEVEL}            2> /dev/null
fi

if [ -f "${TEMPLATE_FULL_NAME_LEVEL}" ] ; then

ws_template_create  ${FIND_LINE} ${TEMPLATE_FULL_NAME_LEVEL} 		${WS_TYPE}	${LANGUAGE} ${DOMAIN} 
ws_template_create  ${FIND_LINE} ${WWW_TEMPLATE_FULL_NAME_LEVEL} 	${WS_TYPE}	${LANGUAGE} ${DOMAIN}

if  [ "${PRODUCT}" == "nodejs" ] ; then
ws_template_create  ${FIND_LINE} ${TEMPLATE_NODEJS_LEVEL}      ${WS_TYPE}  ${LANGUAGE} ${DOMAIN}
fi



else
nginx_cr_domssl_COD=10
nginx_cr_domssl_EER="#-NO EXISTE LA PLANTILLA : ${TEMPLATE_FULL_NAME_LEVEL} ##"

nginx_cr_domssl_OUT=$(expr  ${nginx_cr_domssl_OUT} + ${nginx_cr_domssl_COD})
nginx_cr_domssl_ERR="${nginx_cr_domssl_ERR}${nginx_cr_domssl_EER}"
fi


if [  "${nginx_cr_domssl_OUT}" != "0" ] ; then
nginx_cr_domssl_ERR="# ${nginx_cr_domssl_FUN}::##${nginx_cr_domssl_ERR}"
footer_error "${nginx_cr_domssl_ERR}"
fi

#-Empty variables : 
TEMPLATE_FULL_NAME=""
WWW_TEMPLATE_FULL_NAME=""
TEMPLATE_FASTCGI_NAME=""

SITE_LANGUAGE=""
SITE_DOMAIN=""

fi
}
