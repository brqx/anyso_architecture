#!/bin/bash
##-------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2018
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.1" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- nginx_create_subdomain
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
#E nginx_create_subdomain LINE PATH LANG -- Crea el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
nginx_create_subdomain()
{
VER="0.1.1"					;QP="Brqx Agile Architecture 2018"

nginx_create_subdomain_OUT=0
nginx_create_subdomain_MSG=""
nginx_create_subdomain_ERR=""

nginx_create_subdomain_FUN="nginx_create_subdomain"
nginx_create_subdomain_NFO="Crea un Virtual server Nginx Subdomain [$VER]($DEP) @${QP}"
nginx_create_subdomain_FMT="nginx_create_subdomain LINE [SITE_LANG] [SITE_DOMAIN]"
nginx_create_subdomain_EXA="nginx_create_subdomain LINE es"


if [ "${1}" == "-?" -o "${1}" == "" -o "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${nginx_create_subdomain_NFO}" "${nginx_create_subdomain_FMT}" "${nginx_create_subdomain_EXA}"
#--------------------------------------------------------------------------------
else
SUBD_LINE=${1}
MAIN_LINE=${2}
SITE_LANGUAGE=${3}
SITE_DOMAIN=${4}

ws_subdline ${SUBD_LINE} ${MAIN_LINE}
nginx_create_subdomain_OUT=$(expr  ${nginx_create_subdomain_OUT} + ${ws_subdline_OUT})
nginx_create_subdomain_ERR="${nginx_create_subdomain_ERR}${ws_subdline_ERR}"


TEMPLATE_NAME="subtemplate_com.tplt"
WWW_TEMPLATE_NAME="www_subtemplate_com.tplt"

# Drupal or Magento
FASTCGI_NAME="subtemplate_com.cong"

LETSNCRYPT_NAME="subtemplate_com.letsncrypt"
NODEJS_NAME="subtemplate_com.page"
MAGENTO_NAME="subtemplate_com.shop"


WS_TYPE="nginx"

if [ "${PRODUCT}" == "magento" ] ; then

TEMPLATE_PATH="/host/tplt/${WS_TYPE}/${PRODUCT}${PRODUCT_VERSION}/subdomain/"

else

TEMPLATE_PATH="/host/tplt/${WS_TYPE}/${PRODUCT}/subdomain/"

fi


#-Server information example
#---------------------------------------------------
#Deployment Servers - apache
#SERVERS=lighttp:nginx:nginxhh:httpd:gwan
#---------------------------------------------------
#ENGINE_NGINX=hiphop
#ENGINE_LIGHTTP=php70
#---------------------------------------------------

# subtemplate_com.letsncrypt
# subtemplate_com.page
# subtemplate_com.tplt
# www_subtemplate_com.tplt


TEMPLATE_FULL_NAME="${TEMPLATE_PATH}${TEMPLATE_NAME}"
WWW_TEMPLATE_FULL_NAME="${TEMPLATE_PATH}${WWW_TEMPLATE_NAME}"

TEMPLATE_FASTCGI_NAME="${TEMPLATE_PATH}${FASTCGI_NAME}"

TEMPLATE_LETSNCRYPT_NAME="${TEMPLATE_PATH}${LETSNCRYPT_NAME}"

TEMPLATE_NODEJS_NAME="${TEMPLATE_PATH}${NODEJS_NAME}"

TEMPLATE_MAGENTO_NAME="${TEMPLATE_PATH}${MAGENTO_NAME}"

VS_PATH="${VS_PATH}${LANGUAGE}/${WS_TYPE}/"

TEMPLATE_FULL_NAME_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_DOMAIN}"
WWW_TEMPLATE_FULL_NAME_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/www_${VS_DOMAIN}"

TEMPLATE_LETSNCRYPT_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_LETSNCRYPT}"
TEMPLATE_NODEJS_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_NODEJS}"
TEMPLATE_MAGENTO_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_MAGENTO}"

TEMPLATE_FASTCGI_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_FCGI}"


#/host/tplt/nginx/subtemplate_com.tplt
# /host/tplt/nginx/nodejs/subdomain/subtemplate_com.tplt

echp "Template : ${TEMPLATE_FULL_NAME}"
echp "DestTemp : ${TEMPLATE_FULL_NAME_LEVEL}"

TEMPLATE_FOLDER_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/"

FULL_VS_DOMAIN_PATH="${VS_PATH}${VS_DOMAIN}"


if 	[ "${WS_TYPE}" == "nginx" ] ; then
# [STA_IF_02]

#Borramos el fichero si ya existiese
if [ -f ${FULL_VS_DOMAIN_PATH} ] ; then
rm -f ${FULL_VS_DOMAIN_PATH}
fi

echo "s" | cp -f ${TEMPLATE_FULL_NAME}        ${TEMPLATE_FULL_NAME_LEVEL}         		 # 2> /dev/null

#echo "y" | cp -f ${TEMPLATE_FULL_NAME} 			  ${TEMPLATE_FULL_NAME_LEVEL}    			  2> /dev/null
echo "s" | cp -f ${WWW_TEMPLATE_FULL_NAME} 		${WWW_TEMPLATE_FULL_NAME_LEVEL}  		    2> /dev/null

if  [ "${PRODUCT}" != "none" -a  "${PRODUCT}" != "" ] ; then
echo "s" | cp -f ${TEMPLATE_LETSNCRYPT_NAME}        ${TEMPLATE_LETSNCRYPT_LEVEL}      2> /dev/null
fi

# Drupal Product [5-7]
if    [ "${PRODUCT}" == "drupal" ] ; then
echo "s" | cp -f ${TEMPLATE_FASTCGI_NAME} 		${TEMPLATE_FASTCGI_LEVEL}               2> /dev/null
elif  [ "${PRODUCT}" == "magento" -a "${PRODUCT_VERSION}" == "19" ] ; then
echo "s" | cp -f ${TEMPLATE_FASTCGI_NAME} 		${TEMPLATE_FASTCGI_LEVEL}               2> /dev/null
elif  [ "${PRODUCT}" == "magento" ] ; then
echo "s" | cp -f ${TEMPLATE_MAGENTO_NAME} 			${TEMPLATE_MAGENTO_LEVEL}             2> /dev/null    
echo "s" | cp -f ${TEMPLATE_SHOP_NAME} 		${TEMPLATE_SHOP_LEVEL}    					  2> /dev/null    

elif  [ "${PRODUCT}" == "nodejs" ] ; then
echo "s" | cp -f ${TEMPLATE_NODEJS_NAME} 		${TEMPLATE_NODEJS_LEVEL}                  2> /dev/null    
elif  [ "${PRODUCT}" != "none" ] ; then
echo "No_product  : ${PRODUCT}  cp -f ${TEMPLATE_SHOP_NAME} 		${TEMPLATE_SHOP_LEVEL}    "
fi

if [ -f "${TEMPLATE_FULL_NAME_LEVEL}" ] ; then
#----------------------------------------------------------------------------------
# [STA_IF_03]


ws_subtemplate_create  	${MAIN_LINE} ${TEMPLATE_FULL_NAME_LEVEL} 					${WS_TYPE}	${LANGUAGE}
ws_subtemplate_create  	${MAIN_LINE} ${WWW_TEMPLATE_FULL_NAME_LEVEL} 				${WS_TYPE}	${LANGUAGE}


ws_subtemplate_update 	${SUBD_LINE} ${MAIN_LINE} ${TEMPLATE_FULL_NAME_LEVEL} 		${WS_TYPE}	${LANGUAGE} 
ws_subtemplate_update 	${SUBD_LINE} ${MAIN_LINE} ${WWW_TEMPLATE_FULL_NAME_LEVEL} 	${WS_TYPE}	${LANGUAGE}

if  [ "${PRODUCT}" != "none" -a  "${PRODUCT}" != "" ] ; then
ws_subtemplate_create   ${MAIN_LINE} ${TEMPLATE_LETSNCRYPT_LEVEL}           ${WS_TYPE}  ${LANGUAGE}
ws_subtemplate_update 	${SUBD_LINE} ${MAIN_LINE} ${TEMPLATE_LETSNCRYPT_LEVEL} 		${WS_TYPE}	${LANGUAGE} 
fi

if    [ "${PRODUCT}" == "drupal" ] ; then
ws_subtemplate_create  	${MAIN_LINE} ${TEMPLATE_FASTCGI_LEVEL} 						${WS_TYPE}	${LANGUAGE}
ws_subtemplate_update 	${SUBD_LINE} ${MAIN_LINE} ${TEMPLATE_FASTCGI_LEVEL} 		${WS_TYPE}	${LANGUAGE}
elif  [ "${PRODUCT}" == "magento" -a "${PRODUCT_VERSION}" == "19" ] ; then
ws_subtemplate_create  	${MAIN_LINE} ${TEMPLATE_FASTCGI_LEVEL} 						${WS_TYPE}	${LANGUAGE}
ws_subtemplate_update 	${SUBD_LINE} ${MAIN_LINE} ${TEMPLATE_FASTCGI_LEVEL} 		${WS_TYPE}	${LANGUAGE}

elif  [ "${PRODUCT}" == "magento"  ] ; then
ws_subtemplate_create  	${MAIN_LINE} ${TEMPLATE_MAGENTO_LEVEL} 						${WS_TYPE}	${LANGUAGE}
ws_subtemplate_update 	${SUBD_LINE} ${MAIN_LINE} ${TEMPLATE_MAGENTO_LEVEL} 			${WS_TYPE}	${LANGUAGE}
elif  [ "${PRODUCT}" == "nodejs" ] ; then
ws_subtemplate_create  	${MAIN_LINE} ${TEMPLATE_NODEJS_LEVEL} 						${WS_TYPE}	${LANGUAGE}
ws_subtemplate_update 	${SUBD_LINE} ${MAIN_LINE} ${TEMPLATE_NODEJS_LEVEL} 		    ${WS_TYPE}	${LANGUAGE}
fi


else
nginx_create_subdomain_COD=10
nginx_create_subdomain_EER="#-NO EXISTE LA PLANTILLA : ${TEMPLATE_FULL_NAME_LEVEL} ##"

nginx_create_subdomain_OUT=$(expr  ${nginx_create_subdomain_OUT} + ${nginx_create_subdomain_COD})
nginx_create_subdomain_ERR="${nginx_create_subdomain_ERR}${nginx_create_subdomain_EER}"

# [END_IF_03]
#----------------------------------------------------------------------------------
fi

# [END_IF_02]
fi

if [  "${nginx_create_subdomain_OUT}" != "0" ] ; then
nginx_create_subdomain_ERR="# ${nginx_create_subdomain_FUN}::##${nginx_create_subdomain_ERR}"
footer_error "${nginx_create_subdomain_ERR}"
fi


#-Empty variables : 
SITE_LANGUAGE=""
SITE_DOMAIN=""

fi
}
