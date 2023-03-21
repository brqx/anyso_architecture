#!/bin/bash
##-------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2017
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.8" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- d-lighttp_cr_domain-
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
#E lighttp_cr_domain LINE PATH LANG -- Crea el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
lighttp_cr_domain()
{
VER="0.0.6"						;QP="Brqx Agile Architecture 2016"

lighttp_cr_domain_OUT=0
lighttp_cr_domain_ERR=""

lighttp_cr_domain_FUN="lighttp_cr_domain"
lighttp_cr_domain_NFO="Crea un Virtual server Lighttpd  [$VER]($DEP) @${QP}"
lighttp_cr_domain_FMT="lighttp_cr_domain LINE [SITE_LANG] [SITE_DOMAIN]"
lighttp_cr_domain_EXA="lighttp_cr_domain LINE es"


if [ "${DOMAIN}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${lighttp_cr_domain_NFO}" "${lighttp_cr_domain_FMT}" "${lighttp_cr_domain_EXA}"
#--------------------------------------------------------------------------------
else
FIND_LINE=${1}
SITE_LANGUAGE=${2}
SITE_DOMAIN=${3}

ws_getline ${FIND_LINE}

#-Web Server Type - Lighttp
WS_TYPE="lighttp"

TEMPLATE_NAME="template_com.tplt"
TEMPLATE_PORT="template_port.tplt"

WWW_TEMPLATE_NAME="www_${TEMPLATE_NAME}"
FASTCGI_NAME="fastcgi_${PRODUCT}.tplt"

WWW_TEMPLATE_NAME="www_template_com.tplt"
WWW_TEMPLATE_PORT="www_template_port.tplt"

TEMPLATE_PATH="/host/tplt/${WS_TYPE}/"

TEMPLATE_FULL_NAME="${TEMPLATE_PATH}${TEMPLATE_NAME}"
TEMPLATE_FULL_PORT="${TEMPLATE_PATH}${TEMPLATE_PORT}"

WWW_TEMPLATE_FULL_NAME="${TEMPLATE_PATH}${WWW_TEMPLATE_NAME}"
WWW_TEMPLATE_FULL_PORT="${TEMPLATE_PATH}${WWW_TEMPLATE_PORT}"

TEMPLATE_FASTCGI_NAME="${TEMPLATE_PATH}${FASTCGI_NAME}"

lighttp_cr_domain_OUT=$(expr  ${lighttp_cr_domain_OUT} + ${ws_getline_OUT})
lighttp_cr_domain_ERR="${lighttp_cr_domain_ERR}${ws_getline_ERR}"


VS_PATH="${VS_PATH}${LANGUAGE}/${WS_TYPE}/"

TEMPLATE_FULL_NAME_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_DOMAIN}"
TEMPLATE_FULL_NAME_PORT="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_PORT}"

WWW_TEMPLATE_FULL_NAME_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/www_${VS_DOMAIN}"
WWW_TEMPLATE_FULL_NAME_PORT="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/www_${VS_PORT}"

if [ "${MODE}" == "lang" ] ; then

  if [ "${LANGUAGE}" == "aa"                              ] ; then     
      TEMPLATE_FASTCGI_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_FCGI}"
    
  elif [ "${TYPE_LAN_SITE}"  == "multidomain"             ] ; then
      TEMPLATE_FASTCGI_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_FCGI}"
  else
      TEMPLATE_FASTCGI_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_FCGI}"

##      TEMPLATE_FASTCGI_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/${LANGUAGE}_${VS_FCGI}"
  fi
else
  
  TEMPLATE_FASTCGI_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_FCGI}"
  
fi  

TEMPLATE_FOLDER_LEVEL="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/"

FULL_VS_DOMAIN_PATH="${VS_PATH}${VS_DOMAIN}"
FULL_VS_DOMAIN_PORT="${VS_PATH}${VS_PORT}"


if [ -f ${FULL_VS_DOMAIN_PATH} ] ; then
rm -f ${FULL_VS_DOMAIN_PATH}
rm -f ${FULL_VS_DOMAIN_PORT}
fi

mkc ${TEMPLATE_FOLDER_LEVEL}												

echo "y" | cp -f ${TEMPLATE_FULL_NAME}      ${TEMPLATE_FULL_NAME_LEVEL}    	2> /dev/null
echo "y" | cp -f ${TEMPLATE_FULL_PORT}      ${TEMPLATE_FULL_NAME_PORT}    	2> /dev/null


echo "y" | cp -f ${WWW_TEMPLATE_FULL_NAME}  ${WWW_TEMPLATE_FULL_NAME_LEVEL}    	2> /dev/null
echo "y" | cp -f ${WWW_TEMPLATE_FULL_PORT}  ${WWW_TEMPLATE_FULL_NAME_PORT}    	2> /dev/null

echo "y" | cp -f ${TEMPLATE_FASTCGI_NAME}   ${TEMPLATE_FASTCGI_LEVEL}    			2> /dev/null

# /host/tplt/lighttp/fastcgi_drupal.tplt  ---: /host/lang/per/rct/unixy/aa/lighttp/unixy_es_fastcgi_drupal.cong
# echp "${TEMPLATE_FASTCGI_NAME}  ---: ${TEMPLATE_FASTCGI_LEVEL}"


if [ -f "${TEMPLATE_FULL_NAME_LEVEL}" ] ; then
ws_template_create  ${FIND_LINE} ${TEMPLATE_FULL_NAME_LEVEL} 		${WS_TYPE}	${LANGUAGE} ${DOMAIN}
ws_template_create  ${FIND_LINE} ${TEMPLATE_FULL_NAME_PORT}  		${WS_TYPE}	${LANGUAGE} ${DOMAIN}

ws_template_create  ${FIND_LINE} ${WWW_TEMPLATE_FULL_NAME_LEVEL} 	${WS_TYPE}	${LANGUAGE} ${DOMAIN}
ws_template_create  ${FIND_LINE} ${WWW_TEMPLATE_FULL_NAME_PORT}  	${WS_TYPE}	${LANGUAGE} ${DOMAIN}

ws_template_create  ${FIND_LINE} ${TEMPLATE_FASTCGI_LEVEL} 			${WS_TYPE}	${LANGUAGE} ${DOMAIN}

else
lighttp_cr_domain_COD=10
lighttp_cr_domain_EER="#-NO EXISTE LA PLANTILLA : ${TEMPLATE_FULL_NAME_LEVEL} ##"

lighttp_cr_domain_OUT=$(expr  ${lighttp_cr_domain_OUT} + ${lighttp_cr_domain_COD})
lighttp_cr_domain_ERR="${lighttp_cr_domain_ERR}${lighttp_cr_domain_EER}"

fi


if [  "${lighttp_cr_domain_OUT}" != "0" ] ; then
lighttp_cr_domain_ERR="# ${lighttp_cr_domain_FUN}::##${lighttp_cr_domain_ERR}"
footer_error "${lighttp_cr_domain_ERR}"
fi



#-Empty variables : 
TEMPLATE_PATH=""
TEMPLATE_NAME=""
SITE_DOMAIN=""
SITE_LANGUAGE=""

fi
}
