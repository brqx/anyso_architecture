#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#--------------------------------------------------------------------------------
#-- apache_create_subdomain
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
#E apache_create_subomain LINE PATH LANG -- Crea el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=- 
apache_create_subdomain()
{
VER="0.0.6"						;QP="Brqx Agile Architecture 2016"

apache_create_subdomain_OUT=0
apache_create_subdomain_MSG=""
apache_create_subdomain_ERR=""

apache_create_subdomain_FUN="apache_create_subdomain"
apache_create_subdomain_NFO="Crea un Virtual server Nginx Subdomain [$VER]($DEP) @${QP}"
apache_create_subdomain_FMT="apache_create_subdomain LINE [SITE_LANG] [SITE_DOMAIN]"
apache_create_subdomain_EXA="apache_create_subdomain LINE es"


if [ "${1}" == "-?" -o "${1}" == "" -o "${2}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${apache_create_subdomain_NFO}" "${apache_create_subdomain_FMT}" "${apache_create_subdomain_EXA}"
#--------------------------------------------------------------------------------
else
SUBD_LINE=${1}
MAIN_LINE=${2}
WS_TYPE=${3}
SITE_LANGUAGE=${4}
SITE_DOMAIN=${5}


TEMPLATE_NAME="subtemplate_com.tplt"

TEMPLATE_PATH="/host/tplt/apache/"

ws_subdline ${SUBD_LINE} ${MAIN_LINE}
apache_create_subdomain_OUT=$(expr  ${apache_create_subdomain_OUT} + ${ws_subdline_OUT})
apache_create_subdomain_ERR="${apache_create_subdomain_ERR}${ws_subdline_ERR}"


FULL_SERVER_TEMPLATE_PATH="${TEMPLATE_PATH}${TEMPLATE_NAME}"
FULL_SERVER_SUBTEMPLATE_PATH="${TEMPLATE_PATH}${TEMPLATE_NAME}"


VS_PATH="${VS_PATH}${LANGUAGE}/${WS_TYPE}"

TEMPLATE_FULL_NAME_LEVEL[1]="/host/z${MODE}_${WS_TYPE}_ws.conf"
TEMPLATE_FULL_NAME_LEVEL[2]="/host/${MODE}/z${DIVISION}_${WS_TYPE}.conf"
TEMPLATE_FULL_NAME_LEVEL[3]="/host/${MODE}/${DIVISION}/z${PROJECT}_${WS_TYPE}.conf"
TEMPLATE_FULL_NAME_LEVEL[4]="/host/${MODE}/${DIVISION}/${PROJECT}/z${MAINPROJECT}_${MAINSITE}_${SITE}_${WS_TYPE}.conf"
TEMPLATE_FULL_NAME_LEVEL[5]="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/z${LANGUAGE}_${WS_TYPE}.conf"
TEMPLATE_FULL_NAME_LEVEL[6]="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/z${WS_TYPE}.conf"
TEMPLATE_FULL_NAME_LEVEL[7]="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINPROJECT}_${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_DOMAIN}"

TEMPLATE_FOLDER_LEVEL[1]="/host/"
TEMPLATE_FOLDER_LEVEL[2]="/host/${MODE}/"
TEMPLATE_FOLDER_LEVEL[3]="/host/${MODE}/${DIVISION}/"
TEMPLATE_FOLDER_LEVEL[4]="/host/${MODE}/${DIVISION}/${PROJECT}/"
TEMPLATE_FOLDER_LEVEL[5]="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINSITE}_${SITE}/"
TEMPLATE_FOLDER_LEVEL[6]="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINSITE}_${SITE}/${LANGUAGE}/"
TEMPLATE_FOLDER_LEVEL[7]="/host/${MODE}/${DIVISION}/${PROJECT}/${MAINSITE}_${SITE}/${LANGUAGE}/${WS_TYPE}/"


FULL_VS_DOMAIN_PATH="${VS_PATH}/${VS_DOMAIN}"


if [ -f ${FULL_VS_DOMAIN_PATH} ] ; then
rmf ${FULL_VS_DOMAIN_PATH}
fi

for num_template in 1 2 3 4 5 6 7 ; do

if [ "${num_template}" != "7" ] ; then
TEMPLATE_FULL_NAME="${FULL_SERVER_TEMPLATE_PATH}_0${num_template}"
else
TEMPLATE_FULL_NAME="${FULL_SERVER_SUBTEMPLATE_PATH}"
fi


echo "y" | cp -f ${TEMPLATE_FULL_NAME} ${TEMPLATE_FULL_NAME_LEVEL[${num_template}]}    	2> /dev/null

chow ${TEMPLATE_FULL_NAME_LEVEL[${num_template}]}


if [ -f "${TEMPLATE_FULL_NAME_LEVEL[${num_template}]}" ] ; then


ws_subtemplate_create  	${MAIN_LINE} 				${TEMPLATE_FULL_NAME_LEVEL[${num_template}]} 	${WS_TYPE} ${LANGUAGE}

ws_subtemplate_update 	${SUBD_LINE} ${MAIN_LINE} 	${TEMPLATE_FULL_NAME_LEVEL[${num_template}]} 	${WS_TYPE} ${LANGUAGE}

else

apache_create_subdomain_COD=10
apache_create_subdomain_EER="#-NO EXISTE LA PLANTILLA : ${TEMPLATE_FULL_NAME_LEVEL[${num_template}]} ##"

apache_create_subdomain_OUT=$(expr  ${apache_create_subdomain_OUT} + ${apache_create_subdomain_COD})
apache_create_subdomain_ERR="${apache_create_subdomain_ERR}${apache_create_subdomain_EER}"

fi

done


if [  "${apache_create_subdomain_OUT}" != "0" ] ; then
apache_create_subdomain_ERR="+${apache_create_subdomain_FUN}::##${apache_create_subdomain_ERR}"
footer_error "${apache_create_subdomain_ERR}"
fi


#-Empty variables : 
SITE_LANGUAGE=""
SITE_DOMAIN=""

fi
}
