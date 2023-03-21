#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scripting Unix - AGILE ARQ - Rct - 2019
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- d-ws_create_hola_link-
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Genera estructura enlaces hola - hello link html
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create virtual_server cluser
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P FIND_LINE [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_create_hola_link_content LINE PATH LANG -- Crea el VS Drupal identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_create_hola_link()
{
VER="0.1.5"
DEP="00"		# Depth script

ws_create_hola_link_content_FUN="ws_create_hola_link_content"
ws_create_hola_link_content_NFO="Genera estructura enlaces hola - hello link html php  [$VER]($DEP) @${QP}"
ws_create_hola_link_content_FMT="dru_site_create LINE [SITELANGUAGE] [SITE_DOMAIN]"
ws_create_hola_link_content_EXA="dru_site_create LINE es"

F=${ws_create_hola_link_content_FUN}

ws_create_hola_link_content_OUT=0
ws_create_hola_link_content_ERR=""

if [ "${1}" == "-?"  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_create_hola_link_content_NFO}" "${ws_create_hola_link_content_FMT}" "${ws_create_hola_link_content_EXA}"
#--------------------------------------------------------------------------------
else

#-La idea es generar una estructura comun para dominio y subdominio

CURRENT_DATE=$(date "+%Y_%m_%d")
STATIC_HOLA_FILE=${LAN_HOME_PATH}hola.htm

HELLO_CONTENT="Site : ${CLEAN_DOMAIN} - ${SERVER_NAME} - ${PROJECT} ${DIVISION} ${MODE} ${LANGUAGE} ${SITE} - ${CURRENT_DATE}"
ILINK_PROJECT_CLUSTER_NAME="i_${PROJECT}.php"
ILINK_SERVER_NAME="i_${SERVER_NAME}.php"

ILINK_DOMAIN="${CLEAN_DOMAIN}.php"


HLINK_PROJECT_CLUSTER_NAME="h_${PROJECT}.html"
HLINK_SERVER_NAME="h_${SERVER_NAME}.html"

HLINK_DOMAIN="${CLEAN_DOMAIN}.html"



echo "${HELLO_CONTENT}</br>"               		 								>  ${STATIC_HOLA_FILE}
echo "Servers : [ ${WEBSERVERS} ]</br> "			 	   						>> ${STATIC_HOLA_FILE}
echo "Product [ ${PRODUCT} ] - Product version: [ ${PRODUCT_VERSION} ]</br>"	>> ${STATIC_HOLA_FILE}
echo "Site : [ ${PROJECT} ] - Site Version : [ ${SITE_VERSION} ]</br>"			>> ${STATIC_HOLA_FILE}
echo "Functionalities : </br>"													>> ${STATIC_HOLA_FILE}

if [ "${FUNCTIONALITIES}" != "" ] ; then
echo "Common   --> [ ${FUNCTIONALITIES} ]</br> "   								>> ${STATIC_HOLA_FILE}
fi

if [ "${COM_FUNCTIONALITIES}" != "" ] ; then
echo "Common   --> [ ${COM_FUNCTIONALITIES} ]</br> "   							>> ${STATIC_HOLA_FILE}
fi

if [ "${SPC_FUNCTIONALITIES}" != "" ] ; then
echo "Specific --> [ ${SPC_FUNCTIONALITIES} ]</br> "   							>> ${STATIC_HOLA_FILE}
fi

if [ "${NEW_FUNCTIONALITIES}" != "" ] ; then
echo "News     --> [ ${NEW_FUNCTIONALITIES} ]</br> "   							>> ${STATIC_HOLA_FILE}
fi

chow ${STATIC_HOLA_FILE}											

#Variant de momento no recuerdo que es
if [ "${VARIANT}" != "image_cache" ] ; then

# Creamos index1 - /brqx/base/html/designs/truck 
if [ ! -d ${FULL_DESIGN_PATH} ] ; then
  mkc ${FULL_DESIGN_PATH}
fi

## echo "linking ${FULL_DESIGN_PATH}/v01 -->  ${LAN_PAGE_PATH_FOR_LINK}index1"


#-Gestion de subdominios
LNK_PROJECT=${PROJECT}
if  [ "${PROJECT_TYPE}" == "subdomain"  ] ; then 
LNK_PROJECT=${MAINPROJECT}
fi

LNK_PRODUCT_VERSION=${PRODUCT_VERSION}
if [ "${PRODUCT_VERSION}" == "nover"  ] ; then 
LNK_PRODUCT_VERSION="XX"
fi

if [ "${PRODUCT}" == "drupal" -o  "${PRODUCT}" == "magento19" -o  "${PRODUCT}" == "magento22" ] ; then

#DIVISION is arq
# lnk /brqx/pers/drupal/v50/phpfiles/ser/zt/info.php /home/ser/zt/main/es/info.php

lnk "/brqx/pers/${MAIN_PRODUCT}/v${LNK_PRODUCT_VERSION}/phpfiles/ser/aa/info.php" "${LAN_HOME_PATH}info.php"


#-Info links
lnk ${LAN_HOME_PATH}info.php ${LAN_HOME_PATH}${ILINK_SERVER_NAME}       

lnk ${LAN_HOME_PATH}info.php ${LAN_HOME_PATH}${ILINK_DOMAIN}       

lnk ${LAN_HOME_PATH}info.php ${LAN_HOME_PATH}${ILINK_PROJECT_CLUSTER_NAME}  

elif [ "${PRODUCT}" == "nodejs" ] ; then
ws_create_node_structure  

fi

else
#-Link for cache image site
lnk ${MAIN_LAN_HOME_PATH} ${LAN_HOME_PATH} 

fi  

# Info page will be loaded directly in new architecture
lnk ${LAN_HOME_PATH}hola.htm ${LAN_HOME_PATH}info.html
	
lnk ${LAN_HOME_PATH}hola.htm ${LAN_HOME_PATH}${HLINK_SERVER_NAME}			

lnk ${LAN_HOME_PATH}hola.htm ${LAN_HOME_PATH}${HLINK_DOMAIN}     

lnk ${LAN_HOME_PATH}hola.htm ${LAN_HOME_PATH}${HLINK_PROJECT_CLUSTER_NAME}	


fi
}
