#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.3" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (04) ] 
#-------------------------------------------------------------------
#-- apache_cr_domain
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- ws_template_create
#-- ws_getline
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I #- Crea un Virtual server domain en arquitectura Brqx
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T create virtual_server cluser
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P ID [PJ_PATH]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E apache_cr_domain LINE LANG -- Crea el VS identificado por el ID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
apache_cr_domain()
{
VER="0.0.4"					;QP="Brqx Agile Architecture 2016"
DEP="04"		# Depth script

apache_cr_domain_OUT=0
apache_cr_domain_ERR=""

apache_cr_domain_FUN="apache_cr_domain"
apache_cr_domain_NFO="Crea un Virtual server apache | httpd  [$VER]($DEP) @${QP}"
apache_cr_domain_FMT="apache_cr_domain LINE [SITE_LANG] [SITE_DOMAIN]"
apache_cr_domain_EXA="apache_cr_domain LINE es"


if [ "${1}" == "-?" -o "${1}" == "" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${apache_cr_domain_NFO}" "${apache_cr_domain_FMT}" "${apache_cr_domain_EXA}"
#--------------------------------------------------------------------------------
else
FIND_LINE=${1}
WS_TYPE=${2}
SITE_LANGUAGE=${3}
SITE_DOMAIN=${4}

TEMPLATE_NAME="template_com.tplt"

TEMPLATE_PATH="/host/tplt/apache/"

ws_getline ${FIND_LINE}

apache_cr_domain_OUT=$(expr  ${apache_cr_domain_OUT} + ${ws_getline_OUT})
apache_cr_domain_ERR="${apache_cr_domain_ERR}${ws_getline_ERR}"


FULL_SERVER_TEMPLATE_PATH="${TEMPLATE_PATH}${TEMPLATE_NAME}"

VS_PATH="${VS_PATH}${LANGUAGE}/${WS_TYPE}/"
LOGS_PATH="${LOGS_PATH}${LANGUAGE}/${WS_TYPE}/"


TEMPLATE_FULL_NAME_LEVEL[1]="/host/z${MODE}_${WS_TYPE}_ws.conf"
TEMPLATE_FULL_NAME_LEVEL[2]="/host/${MODE}/z${DIVISION}_${WS_TYPE}.conf"
TEMPLATE_FULL_NAME_LEVEL[3]="/host/${MODE}/${DIVISION}/z${PROJECT}_${WS_TYPE}.conf"
TEMPLATE_FULL_NAME_LEVEL[4]="/host/${MODE}/${DIVISION}/${PROJECT}/z${SITE}_${WS_TYPE}.conf"
TEMPLATE_FULL_NAME_LEVEL[5]="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/z${LANGUAGE}_${WS_TYPE}.conf"
TEMPLATE_FULL_NAME_LEVEL[6]="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/z${WS_TYPE}.conf"
TEMPLATE_FULL_NAME_LEVEL[7]="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/${VS_DOMAIN}"

TEMPLATE_FOLDER_LEVEL[1]="/host/"
TEMPLATE_FOLDER_LEVEL[2]="/host/${MODE}/"
TEMPLATE_FOLDER_LEVEL[3]="/host/${MODE}/${DIVISION}/"
TEMPLATE_FOLDER_LEVEL[4]="/host/${MODE}/${DIVISION}/${PROJECT}/"
TEMPLATE_FOLDER_LEVEL[5]="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/"
TEMPLATE_FOLDER_LEVEL[6]="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/"
TEMPLATE_FOLDER_LEVEL[7]="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}/${WS_TYPE}/"

FULL_VS_DOMAIN_PATH="${VS_PATH}${VS_DOMAIN}"


if [ -f ${FULL_VS_DOMAIN_PATH} ] ; then
rmf ${FULL_VS_DOMAIN_PATH}
fi

for num_template in 1 2 3 4 5 6 7 ; do
#- Copiamos la plantilla en el archivo : MAIN TEMPLATE : Level 6

if [ "${num_template}" == "7" ] ; then 
TEMPLATE_FULL_NAME="${TEMPLATE_PATH}${TEMPLATE_NAME}"
else
TEMPLATE_FULL_NAME="${TEMPLATE_PATH}${TEMPLATE_NAME}_0${num_template}"
fi

mkc ${TEMPLATE_FOLDER_LEVEL[${num_template}]}

echo "y" | cp -f ${TEMPLATE_FULL_NAME} 	${TEMPLATE_FULL_NAME_LEVEL[${num_template}]}    	2> /dev/null


if [ -f "${TEMPLATE_FULL_NAME_LEVEL[${num_template}]}" ] ; then

ws_template_create  ${FIND_LINE} ${TEMPLATE_FULL_NAME_LEVEL[${num_template}]} ${WS_TYPE}	${LANGUAGE} ${DOMAIN}

else
apache_cr_domain_OUT=10
apache_cr_domain_ERR="${apache_cr_domain_ERR}-NO EXISTE LA PLANTILLA : ${TEMPLATE_FULL_NAME_LEVEL[${num_template}]} ##"
fi

done


if [  "${apache_cr_domain_OUT}" != "0" ] ; then
apache_cr_domain_ERR="# ${apache_cr_domain_FUN}::##${apache_cr_domain_ERR}"
footer_error "${apache_cr_domain_ERR}"
fi


#-Empty variables : 
SITE_LANGUAGE=""
SITE_DOMAIN=""

fi
}
