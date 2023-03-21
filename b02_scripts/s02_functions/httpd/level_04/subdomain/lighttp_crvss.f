#!/bin/bash
##-------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.3" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- lighttp_create_subdomain
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_template_create
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
#E lighttp_create_subdomain LINE PATH LANG -- Crea el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
lighttp_create_subdomain()
{
VER="0.0.4"						;QP="Brqx Agile Architecture 2016"

lighttp_create_subdomain_OUT=0
lighttp_create_subdomain_MSG=""
lighttp_create_subdomain_ERR=""

lighttp_create_subdomain_FUN="lighttp_create_subdomain"
lighttp_create_subdomain_NFO="Crea un Virtual server Lighttp Subdomain [$VER]($DEP) @${QP}"
lighttp_create_subdomain_FMT="lighttp_create_subdomain LINE [SITE_LANG] [SITE_DOMAIN]"
lighttp_create_subdomain_EXA="lighttp_create_subdomain LINE es"


if [ "${1}" == "-?" -o "${1}" == "" -o "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${lighttp_create_subdomain_NFO}" "${lighttp_create_subdomain_FMT}" "${lighttp_create_subdomain_EXA}"
#--------------------------------------------------------------------------------
else
SUBD_LINE=${1}
MAIN_LINE=${2}
SITE_LANGUAGE=${3}
SITE_DOMAIN=${4}

#-Web Server Type - Lighttp
WS_TYPE="lighttp"

FASTCGI_NAME="fastcgi.tplt"
TEMPLATE_NAME="subtemplate_com.tplt"
TEMPLATE_PORT="subtemplate_port.tplt"

WWWTEMPLATE_NAME="www_subtemplate_com.tplt"
WWWTEMPLATE_PORT="www_subtemplate_port.tplt"

TEMPLATE_PATH="/host/tplt/${WS_TYPE}/"

ws_subdline ${SUBD_LINE} ${MAIN_LINE}
lighttp_create_subdomain_OUT=$(expr  ${lighttp_create_subdomain_OUT} + ${ws_subdline_OUT})
lighttp_create_subdomain_ERR="${lighttp_create_subdomain_ERR}${ws_subdline_ERR}"



TEMPLATE_FULL_NAME="${TEMPLATE_PATH}${TEMPLATE_NAME}"
TEMPLATE_FULL_PORT="${TEMPLATE_PATH}${TEMPLATE_PORT}"

WWWTEMPLATE_FULL_NAME="${TEMPLATE_PATH}${WWWTEMPLATE_NAME}"
WWWTEMPLATE_FULL_PORT="${TEMPLATE_PATH}${WWWTEMPLATE_PORT}"

TEMPLATE_FASTCGI_NAME="${TEMPLATE_PATH}${FASTCGI_NAME}"

VS_PATH="${VS_PATH}${LANGUAGE}/${WS_TYPE}/"

TEMPLATE_FULL_NAME_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_DOMAIN}"
TEMPLATE_FULL_NAME_PORT="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_PORT}"

WWWTEMPLATE_FULL_NAME_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/www_${VS_DOMAIN}"
WWWTEMPLATE_FULL_NAME_PORT="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/www_${VS_PORT}"

if [ "${MODE}" == "lang" ] ; then

    TEMPLATE_FASTCGI_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_FCGI}"

else

    TEMPLATE_FASTCGI_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_FCGI}"
  
fi  

TEMPLATE_FOLDER_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/"

FULL_VS_DOMAIN_PATH="${VS_PATH}${VS_DOMAIN}"
FULL_VS_DOMAIN_PORT="${VS_PATH}${VS_PORT}"


if [ -f ${FULL_VS_DOMAIN_PATH} ] ; then
rm -f ${FULL_VS_DOMAIN_PATH}
rm -f ${FULL_VS_DOMAIN_PORT}
fi

echo "y" | cp -f ${TEMPLATE_FULL_NAME} 		${TEMPLATE_FULL_NAME_LEVEL}    			2> /dev/null
echo "y" | cp -f ${TEMPLATE_FULL_PORT} 		${TEMPLATE_FULL_NAME_PORT}    			2> /dev/null

echo "y" | cp -f ${WWWTEMPLATE_FULL_NAME} 	${WWWTEMPLATE_FULL_NAME_LEVEL}    		2> /dev/null
echo "y" | cp -f ${WWWTEMPLATE_FULL_PORT} 	${WWWTEMPLATE_FULL_NAME_PORT}    		2> /dev/null

echo "y" | cp -f ${TEMPLATE_FASTCGI_NAME} 	${TEMPLATE_FASTCGI_LEVEL}    			2> /dev/null

if [ -f "${TEMPLATE_FULL_NAME_LEVEL}" ] ; then
ws_subtemplate_create  	${MAIN_LINE} ${TEMPLATE_FULL_NAME_LEVEL} 	${WS_TYPE}	${LANGUAGE}
ws_subtemplate_create  	${MAIN_LINE} ${TEMPLATE_FULL_NAME_PORT} 	${WS_TYPE}	${LANGUAGE}

ws_subtemplate_create  	${MAIN_LINE} ${WWWTEMPLATE_FULL_NAME_LEVEL} ${WS_TYPE}	${LANGUAGE}
ws_subtemplate_create  	${MAIN_LINE} ${WWWTEMPLATE_FULL_NAME_PORT} 	${WS_TYPE}	${LANGUAGE}


ws_subtemplate_create  	${MAIN_LINE} ${TEMPLATE_FASTCGI_LEVEL} 		${WS_TYPE}	${LANGUAGE}

##echo "ws_subtemplate_update 	${SUBD_LINE} ${TEMPLATE_FULL_NAME_LEVEL} ${LANGUAGE} ${WS_TYPE}"
ws_subtemplate_update 	${SUBD_LINE} ${MAIN_LINE} ${TEMPLATE_FULL_NAME_LEVEL} 		${WS_TYPE}	${LANGUAGE}
ws_subtemplate_update 	${SUBD_LINE} ${MAIN_LINE} ${TEMPLATE_FULL_NAME_PORT} 		${WS_TYPE}	${LANGUAGE}

ws_subtemplate_update 	${SUBD_LINE} ${MAIN_LINE} ${WWWTEMPLATE_FULL_NAME_LEVEL} 	${WS_TYPE}	${LANGUAGE}
ws_subtemplate_update 	${SUBD_LINE} ${MAIN_LINE} ${WWWTEMPLATE_FULL_NAME_PORT} 	${WS_TYPE}	${LANGUAGE}

ws_subtemplate_update 	${SUBD_LINE} ${MAIN_LINE} ${TEMPLATE_FASTCGI_LEVEL} 		${WS_TYPE}	${LANGUAGE}

else

lighttp_create_subdomain_COD=10
lighttp_create_subdomain_EER="#-NO EXISTE LA PLANTILLA : ${TEMPLATE_FULL_NAME_LEVEL}hh ##"

lighttp_create_subdomain_OUT=$(expr  ${lighttp_create_subdomain_OUT} + ${lighttp_create_subdomain_COD})
lighttp_create_subdomain_ERR="${lighttp_create_subdomain_ERR}${lighttp_create_subdomain_EER}"

fi


if [  "${lighttp_create_subdomain_OUT}" != "0" ] ; then
lighttp_create_subdomain_ERR="# ${lighttp_create_subdomain_FUN}::##${lighttp_create_subdomain_ERR}"
footer_error "${lighttp_create_subdomain_ERR}"
fi


#-Empty variables : 
SITE_LANGUAGE=""
SITE_DOMAIN=""
fi
}
