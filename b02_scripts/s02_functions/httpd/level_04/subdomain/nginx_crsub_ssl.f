#!/bin/bash
##-------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2018
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.2" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- nginx_cr_subssl
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_subtemplate_create - ws_subtemplate_update
#-- ws_subdline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Crea un Virtual server subdomain nginx en arquitectura Brqx
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
#E nginx_cr_subssl LINE PATH LANG -- Crea el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
nginx_cr_subssl()
{
VER="0.0.2"					;QP="Brqx Agile Architecture 2018"

nginx_cr_subssl_OUT=0
nginx_cr_subssl_MSG=""
nginx_cr_subssl_ERR=""

nginx_cr_subssl_FUN="nginx_cr_subssl"
nginx_cr_subssl_NFO="Crea un Virtual server Nginx Subdomain Ssl [$VER]($DEP) @${QP}"
nginx_cr_subssl_FMT="nginx_cr_subssl LINE [SITE_LANG] [SITE_DOMAIN]"
nginx_cr_subssl_EXA="nginx_cr_subssl LINE es"


if [ "${1}" == "-?" -o "${1}" == "" -o "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${nginx_cr_subssl_NFO}" "${nginx_cr_subssl_FMT}" "${nginx_cr_subssl_EXA}"
#--------------------------------------------------------------------------------
else
SUBD_LINE=${1}
MAIN_LINE=${2}
SITE_LANGUAGE=${3}
SITE_DOMAIN=${4}

ws_subdline ${SUBD_LINE} ${MAIN_LINE}
nginx_cr_subssl_OUT=$(expr  ${nginx_cr_subssl_OUT} + ${ws_subdline_OUT})
nginx_cr_subssl_ERR="${nginx_cr_subssl_ERR}${ws_subdline_ERR}"


TEMPLATE_NAME="subtemplate_ssl_com.tplt"
WWW_TEMPLATE_NAME="www_subtemplate_ssl_com.tplt"

NODEJS_NAME="subtemplate_ssl_com.page"

WS_TYPE="nginx"

TEMPLATE_PATH="/host/tplt/${WS_TYPE}/${PRODUCT}/subdomain/"

#-Server information example
#---------------------------------------------------
#Deployment Servers - apache
#SERVERS=lighttp:nginx:nginxhh:httpd:gwan
#---------------------------------------------------
#ENGINE_NGINX=hiphop
#ENGINE_LIGHTTP=php70
#---------------------------------------------------

TEMPLATE_FULL_NAME="${TEMPLATE_PATH}${TEMPLATE_NAME}"
WWW_TEMPLATE_FULL_NAME="${TEMPLATE_PATH}${WWW_TEMPLATE_NAME}"

TEMPLATE_NODEJS_NAME="${TEMPLATE_PATH}${NODEJS_NAME}"

VS_PATH="${VS_PATH}${LANGUAGE}/${WS_TYPE}/"

TEMPLATE_FULL_NAME_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_SSL_DOMAIN}"
WWW_TEMPLATE_FULL_NAME_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/www_${VS_SSL_DOMAIN}"


TEMPLATE_NODEJS_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_SSL_NODEJS}"

TEMPLATE_FOLDER_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/"

FULL_VS_DOMAIN_PATH_SSL="${VS_PATH}${VS_SSL_DOMAIN}"



if [ "${WS_TYPE}" == "nginx" ] ; then

if [ -f ${FULL_VS_DOMAIN_PATH_SSL} ] ; then
rm -f ${FULL_VS_DOMAIN_PATH_SSL}
fi

echo "y" | cp -f ${TEMPLATE_FULL_NAME} 			  ${TEMPLATE_FULL_NAME_LEVEL}    			  2> /dev/null
echo "y" | cp -f ${WWW_TEMPLATE_FULL_NAME} 		${WWW_TEMPLATE_FULL_NAME_LEVEL}    		2> /dev/null

##echo "${nginx_cr_subssl_FUN}:: cp -f ${TEMPLATE_FASTCGI_NAME} 		${TEMPLATE_FASTCGI_LEVEL}"

if  [ "${PRODUCT}" == "nodejs" ] ; then
echo "s" | cp -f ${TEMPLATE_NODEJS_NAME}    ${TEMPLATE_NODEJS_LEVEL}            2> /dev/null
fi


if [ -f "${TEMPLATE_FULL_NAME_LEVEL}" ] ; then

ws_subtemplate_create  	${MAIN_LINE} ${TEMPLATE_FULL_NAME_LEVEL} 					${WS_TYPE}	${LANGUAGE}
ws_subtemplate_create  	${MAIN_LINE} ${WWW_TEMPLATE_FULL_NAME_LEVEL} 				${WS_TYPE}	${LANGUAGE}


ws_subtemplate_update 	${SUBD_LINE} ${MAIN_LINE} ${TEMPLATE_FULL_NAME_LEVEL} 		${WS_TYPE}	${LANGUAGE} 
ws_subtemplate_update 	${SUBD_LINE} ${MAIN_LINE} ${WWW_TEMPLATE_FULL_NAME_LEVEL} 	${WS_TYPE}	${LANGUAGE}

if  [ "${PRODUCT}" == "nodejs" ] ; then

ws_subtemplate_create  	${MAIN_LINE} ${TEMPLATE_NODEJS_LEVEL} 					${WS_TYPE}	${LANGUAGE}
ws_subtemplate_update 	${SUBD_LINE} ${MAIN_LINE} ${TEMPLATE_NODEJS_LEVEL} 		${WS_TYPE}	${LANGUAGE} 

fi



else
nginx_cr_subssl_COD=10
nginx_cr_subssl_EER="#-NO EXISTE LA PLANTILLA : ${TEMPLATE_FULL_NAME_LEVEL} ##"

nginx_cr_subssl_OUT=$(expr  ${nginx_cr_subssl_OUT} + ${nginx_cr_subssl_COD})
nginx_cr_subssl_ERR="${nginx_cr_subssl_ERR}${nginx_cr_subssl_EER}"

# [END_IF_03]
fi

# [END_IF_02]
fi


if [  "${nginx_cr_subssl_OUT}" != "0" ] ; then
nginx_cr_subssl_ERR="# ${nginx_cr_subssl_FUN}::##${nginx_cr_subssl_ERR}"
footer_error "${nginx_cr_subssl_ERR}"
fi


#-Empty variables : 
SITE_LANGUAGE=""
SITE_DOMAIN=""

fi
}
