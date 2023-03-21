#!/bin/bash
##-------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2018
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.1" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- nginx_cr_domain
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
#E nginx_cr_domain LINE PATH LANG -- Crea el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
nginx_cr_domain()
{
VER="0.1.0"					;QP="Brqx Agile Architecture 2018"

nginx_cr_domain_OUT=0
nginx_cr_domain_MSG=""
nginx_cr_domain_ERR=""

nginx_cr_domain_FUN="nginx_cr_domain"
nginx_cr_domain_NFO="Crea un Virtual server Nginx  [$VER]($DEP) @${QP}"
nginx_cr_domain_FMT="nginx_cr_domain LINE [SITE_LANG] [SITE_DOMAIN]"
nginx_cr_domain_EXA="nginx_cr_domain LINE es"


if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${nginx_cr_domain_NFO}" "${nginx_cr_domain_FMT}" "${nginx_cr_domain_EXA}"
#--------------------------------------------------------------------------------
else
FIND_LINE=${1}
SITE_LANGUAGE=${2}
SITE_DOMAIN=${3}

ws_getline ${FIND_LINE}

TEMPLATE_NAME="template_com.tplt"
WWW_TEMPLATE_NAME="www_${TEMPLATE_NAME}"

# Drupal or MAgento
FASTCGI_NAME="template_com.cong"

LETSNCRYPT_NAME="template_com.letsncrypt"
NODEJS_NAME="template_com.page"
MAGENTO_NAME="template_com.shop"


WS_TYPE="nginx"

if [ "${PRODUCT}" == "magento" ] ; then

TEMPLATE_PATH="/host/tplt/${WS_TYPE}/${PRODUCT}${PRODUCT_VERSION}/domain/"

else

TEMPLATE_PATH="/host/tplt/${WS_TYPE}/${PRODUCT}/domain/"

fi


TEMPLATE_FULL_NAME="${TEMPLATE_PATH}${TEMPLATE_NAME}"
WWW_TEMPLATE_FULL_NAME="${TEMPLATE_PATH}${WWW_TEMPLATE_NAME}"

TEMPLATE_FASTCGI_NAME="${TEMPLATE_PATH}${FASTCGI_NAME}"

TEMPLATE_LETSNCRYPT_NAME="${TEMPLATE_PATH}${LETSNCRYPT_NAME}"

TEMPLATE_NODEJS_NAME="${TEMPLATE_PATH}${NODEJS_NAME}"

TEMPLATE_MAGENTO_NAME="${TEMPLATE_PATH}${MAGENTO_NAME}"

#-Server information example
#---------------------------------------------------
#Deployment Servers - apache
#SERVERS=lighttp:nginx:nginxhh:httpd:gwan
#---------------------------------------------------
#ENGINE_NGINX=hiphop
#ENGINE_LIGHTTP=php70
#---------------------------------------------------

nginx_cr_domain_OUT=$(expr  ${nginx_cr_domain_OUT} + ${ws_getline_OUT})
nginx_cr_domain_ERR="${nginx_cr_domain_ERR}${ws_getline_ERR}"


VS_PATH="${VS_PATH}${LANGUAGE}/${WS_TYPE}/"

TEMPLATE_FULL_NAME_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_DOMAIN}"
WWW_TEMPLATE_FULL_NAME_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/www_${VS_DOMAIN}"

TEMPLATE_LETSNCRYPT_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_LETSNCRYPT}"
TEMPLATE_NODEJS_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_NODEJS}"
TEMPLATE_MAGENTO_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_MAGENTO}"

TEMPLATE_FASTCGI_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_FCGI}"


# echo "Nginx - ${CLEAN_DOMAIN} - ${VS_FCGI}"

echp "Template : ${TEMPLATE_FULL_NAME}"
echp "DestTemp : ${TEMPLATE_FULL_NAME_LEVEL}"


TEMPLATE_FOLDER_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/"

FULL_VS_DOMAIN_PATH="${VS_PATH}${VS_DOMAIN}"

mkc ${TEMPLATE_FOLDER_LEVEL}												


echo "y" | cp -f ${TEMPLATE_FULL_NAME} ${TEMPLATE_FULL_NAME_LEVEL}    		   	  2> /dev/null

echo "y" | cp -f ${WWW_TEMPLATE_FULL_NAME} ${WWW_TEMPLATE_FULL_NAME_LEVEL}    	2> /dev/null

if  [ "${PRODUCT}" != "none" -a  "${PRODUCT}" != "" ] ; then
echp "s" | cp -f ${TEMPLATE_LETSNCRYPT_NAME}        ${TEMPLATE_LETSNCRYPT_LEVEL}        2> /dev/null
fi

# Drupal Product [5-7]
if    [ "${PRODUCT}" == "drupal" ] ; then
echo "s" | cp -f ${TEMPLATE_FASTCGI_NAME}     ${TEMPLATE_FASTCGI_LEVEL}
elif  [ "${PRODUCT}" == "magento" -a "${PRODUCT_VERSION}" == "19" ] ; then
echo "s" | cp -f ${TEMPLATE_FASTCGI_NAME}     ${TEMPLATE_FASTCGI_LEVEL}    
elif  [ "${PRODUCT}" == "magento" ] ; then
echo "s" | cp -f ${TEMPLATE_MAGENTO_NAME}      ${TEMPLATE_MAGENTO_LEVEL}    
elif  [ "${PRODUCT}" == "nodejs" ] ; then
echo "s" | cp -f ${TEMPLATE_NODEJS_NAME}    ${TEMPLATE_NODEJS_LEVEL}    				2> /dev/null
elif  [ "${PRODUCT}" != "none" ] ; then
echo "No_product : ${PRODUCT} cp -f ${TEMPLATE_SHOP_NAME}     ${TEMPLATE_SHOP_LEVEL}    "
fi

if [ -f "${TEMPLATE_FULL_NAME_LEVEL}" ] ; then
#----------------------------------------------------------------------------------
# [STA_IF_02]

ws_template_create  ${FIND_LINE} ${TEMPLATE_FULL_NAME_LEVEL} 		 ${WS_TYPE}	${LANGUAGE} ${DOMAIN} 
ws_template_create  ${FIND_LINE} ${WWW_TEMPLATE_FULL_NAME_LEVEL} ${WS_TYPE}	${LANGUAGE} ${DOMAIN}

if  [ "${PRODUCT}" != "none" -a  "${PRODUCT}" != "" ] ; then
ws_template_create  ${FIND_LINE} ${TEMPLATE_LETSNCRYPT_LEVEL}    ${WS_TYPE} ${LANGUAGE} ${DOMAIN}
fi

if    [ "${PRODUCT}" == "drupal" ] ; then
ws_template_create  ${FIND_LINE} ${TEMPLATE_FASTCGI_LEVEL}      ${WS_TYPE}  ${LANGUAGE} ${DOMAIN}
elif  [ "${PRODUCT}" == "magento" -a "${PRODUCT_VERSION}" == "19" ] ; then
ws_template_create  ${FIND_LINE} ${TEMPLATE_FASTCGI_LEVEL}      ${WS_TYPE}  ${LANGUAGE} ${DOMAIN}
elif  [ "${PRODUCT}" == "magento" ] ; then
ws_template_create  ${FIND_LINE} ${TEMPLATE_MAGENTO_LEVEL}      ${WS_TYPE}  ${LANGUAGE} ${DOMAIN}
elif  [ "${PRODUCT}" == "nodejs" ] ; then
ws_template_create  ${FIND_LINE} ${TEMPLATE_NODEJS_LEVEL}      ${WS_TYPE}  ${LANGUAGE} ${DOMAIN}
fi

else
nginx_cr_domain_COD=10
nginx_cr_domain_EER="#-NO EXISTE LA PLANTILLA : ${TEMPLATE_FULL_NAME_LEVEL} ##"

nginx_cr_domain_OUT=$(expr  ${nginx_cr_domain_OUT} + ${nginx_cr_domain_COD})
nginx_cr_domain_ERR="${nginx_cr_domain_ERR}${nginx_cr_domain_EER}"
# [END_IF_02]
#----------------------------------------------------------------------------------

fi


if [  "${nginx_cr_domain_OUT}" != "0" ] ; then
nginx_cr_domain_ERR="# ${nginx_cr_domain_FUN}::##${nginx_cr_domain_ERR}"
footer_error "${nginx_cr_domain_ERR}"
fi

#-Empty variables : 
TEMPLATE_FULL_NAME=""
WWW_TEMPLATE_FULL_NAME=""
TEMPLATE_FASTCGI_NAME=""

SITE_LANGUAGE=""
SITE_DOMAIN=""

fi
}
