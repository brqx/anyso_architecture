#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.4" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wssgo
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_getline 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Accede Virtual server subdomain en arquitectura Brqx
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T acces go virtual_server subdomain
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P ID [PJ_PATH]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wssgo mainwar palillos -- Crea el VS identificado por el ID y SUBID
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
wsls()
{
VER="0.0.4"

wsls_FUN="wsls"
wsls_NFO="Lista Virtual servers [$VER]($DEP)@${QP}"
wsls_FMT="wsls [div] [proj] [site] [lang]"
wsls_EXA="wsls espalillos"

wsls_OUT=0
wsls_ERR=""

if [ "${1}" == "-?"  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsls_NFO}" "${wsls_FMT}" "${wsls_EXA}"
#--------------------------------------------------------------------------------
else

OUTOUT="CLEANX"

DIVISION=${1}
PROJECT=${2}
SITE=${3}
LANGUAGE=${4}

CUT_START=3;


PROJECT_PATH="/brqi/"

if [ "${DIVISION}" != "" ] ; then
PROJECT_PATH="${PROJECT_PATH}${DIVISION}/"
fi

if [ "${PROJECT}" != "" ] ; then
PROJECT_PATH="${PROJECT_PATH}${PROJECT}/"
fi

if [ "${SITE}" != "" ] ; then
PROJECT_PATH="${PROJECT_PATH}${SITE}/"
fi

CUT_DIV=${CUT_START}
CUT_PJT=$( expr ${CUT_START} + 1 )
CUT_DOM=$( expr ${CUT_START} + 2 )


for FIND_LINE in $( find ${PROJECT_PATH} -type f -name "*.pj" ) ; do
MODE=$(             cat  ${FIND_LINE} | grep "^MODE="   | head -1           | cut -d "=" -f2    )
SITE=$(             cat  ${FIND_LINE} | grep "^SITE="   | head -1           | cut -d "=" -f2    )
LANGUAGE=$(         cat  ${FIND_LINE} | grep "^LANG="   | head -1           | cut -d "=" -f2    )

DIVISION=$(         echo ${FIND_LINE} | cut -d "/" -f${CUT_DIV}		                            )
PROJECT=$(          echo ${FIND_LINE} | cut -d "/" -f${CUT_PJT}                                 )
CLEAN_DOMAIN=$(     echo ${FIND_LINE} | cut -d "/" -f${CUT_DOM}  | cut -d "_" -f2-   | cut -d "." -f1    )
DOMAIN=$(           echo ${CLEAN_DOMAIN}                | tr "_" "."                            )

if [ "${LANGUAGE}" == "" -o "${LANGUAGE}" == "multi" ] ; then 
LANGUAGE="es"
fi

#-Antes de proceder debemos comprobar que no existe ya uno igual
VS_PATH="/host/${MODE}/${DIVISION}/${PROJECT}/${SITE}/${LANGUAGE}"
DOMAIN_EXIST=$( find /host -type f -name ${CLEAN_DOMAIN}.conf  | wc -l )

echo "${DOMAIN} [${DOMAIN_EXIST}] ${MODE} - ${DIVISION} ${PROJECT} ${SITE} ${LANGUAGE} --> ${FIND_LINE}"

done


fi
}
