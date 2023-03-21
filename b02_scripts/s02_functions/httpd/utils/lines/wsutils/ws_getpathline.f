#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.4" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_getpathline (alias gline)
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_gdcreate - ws_infoline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Comprueba si un site existe en el sistema
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T create virtual_server cluster multilanguage
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P ID
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_getpathline [ID] -- Comprueba si un site existe en el sistema
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_getpathline()
{
VER="0.0.3"

ws_getpathline_FUN="ws_getpathline"
ws_getpathline_NFO="Obtiene informacion del site en razon a la ruta del mismo [$VER]($DEP)@${QP}"
ws_getpathline_FMT="ws_getpathline IDSITE"
ws_getpathline_EXA="ws_getpathline espalillos"

ws_getpathline_OUT=0
ws_getpathline_ERR=""


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_getpathline_NFO}" "${ws_getpathline_FMT}" "${ws_getpathline_EXA}"
#--------------------------------------------------------------------------------
else
PATH_SITE=${1}

if [ "${PATH_SITE}" == "" ] ; then
PATH_SITE="${PWD}"
fi

PATH_START=$( 	echo ${PATH_SITE} 	| cut -c1 				)

if [ "${PATH_START}" == "/" ] ; then
#--STA_IF_[01] - START [PATH START WITH BAR ] -----------------------------------
#-El path comienza por barra - correcto

#-Numero de barras del path. Dominio (6 correcto) Subdominio (11 correcto)
#-No debe terminar en barra
NUM_BARS=$( 		echo "${PATH_SITE}" | tr "/" "\n" | wc -l	)

#-Devuelve 0 o 1 dependiendo de si es subdominio o dominio
IS_SUBDOMAIN=$( 	echo "${PATH_SITE}" | grep zdom | wc -l	)

if [ "${IS_SUBDOMAIN}" == "0" ] ; then
#--STA_IF_[02] - START [ IS DOMAIN ] --------------------------------------------

if [ "${NUM_BARS}" == "6" ] ; then
#--STA_IF_[03] - START [ NUMBARS DOMAIN CORRECT ] -------------------------------
##/home/emp/drupalng/third/es/

MODEVS=$( 		echo "${PATH_SITE}" | cut -d "/" -f2 )
DIVISION=$(		echo "${PATH_SITE}" | cut -d "/" -f3 )
PROJECT=$(		echo "${PATH_SITE}" | cut -d "/" -f4 )
SITE=$(			echo "${PATH_SITE}" | cut -d "/" -f5 )
LANG=$(			echo "${PATH_SITE}" | cut -d "/" -f6 )

LINE=$(			find /brqi/${DIVISION}/${PROJECT} -type f -name "*.pj" | xargs grep -l "SITE=${SITE}" | head -1 )

##echo "DOMAIN LINE: ${LINE}"

ws_getline ${LINE}
ws_getpathline_OUT=$(expr  ${ws_getpathline_OUT} + ${ws_getline_OUT})
ws_getpathline_ERR="${ws_getpathline_ERR}${ws_getline_ERR}"


else

ws_getpathline_EER="#-Path not correct for a domain (${NUM_BARS}) : ${PATH_SITE} ##"
ws_getpathline_COD=11
ws_getpathline_OUT=$(expr  ${ws_getpathline_OUT} + ${ws_getpathline_COD})
ws_getpathline_ERR="${ws_getpathline_ERR}${ws_getpathline_EER}"

fi
else
#--ELS_IF_[02] - START [ IS SUBDOMAIN ] -----------------------------------------
#-Busco una alternativa al surl pero que no dependa del fichero settings, de forma que sea valido para cualquier producto

##/home/emp/drupalng/third/es/zdom/emp/garland8/drupalng_third_main/es

if [ "${NUM_BARS}" == "11" ] ; then
#--STA_IF_[03] - START [ NUMBARS SUBDOMAIN CORRECT ] ----------------------------

MAINMODEVS=$( 		echo "${PATH_SITE}" | cut -d "/" -f2 )
MAINDIVISION=$(		echo "${PATH_SITE}" | cut -d "/" -f3 )
MAINPROJECT=$(		echo "${PATH_SITE}" | cut -d "/" -f4 )
MAINSITE=$(			echo "${PATH_SITE}" | cut -d "/" -f5 )
MAINLANG=$(			echo "${PATH_SITE}" | cut -d "/" -f6 )

DIVISION=$(			echo "${PATH_SITE}" | cut -d "/" -f8 )
PROJECT=$(			echo "${PATH_SITE}" | cut -d "/" -f9 )

#Cadena compuesta mainid_mainsite_site
MAINSITE=$(			echo "${PATH_SITE}" | cut -d "/" -f10 | cut -d "_" -f2)
SITE=$(				echo "${PATH_SITE}" | cut -d "/" -f10 | cut -d "_" -f3)

#-Este no es correcto
MAINID=$(			echo "${PATH_SITE}" | cut -d "/" -f10 | cut -d "_" -f1)

LANG=$(				echo "${PATH_SITE}" | cut -d "/" -f8 )

MAINLINE=$(			find /brqi/${MAINDIVISION}/${MAINPROJECT} -type f -name "*.pj"  | xargs grep -l "SITE=${MAINSITE}" | head -1)

SUBD_LINE=$(		find /brqi/${DIVISION}/${PROJECT} -type f -name "*.spj"  | xargs grep -l "SITE=${SITE}" | head -1)

##echo "MAINL: ${MAINLINE}"
##echo "SUBD : ${SUBD_LINE}"

ws_subdline ${SUBD_LINE} ${MAINLINE}
ws_getpathline_OUT=$(expr  ${ws_getpathline_OUT} + ${ws_subdline_OUT})
ws_getpathline_ERR="${ws_getpathline_ERR}${ws_subdline_ERR}"


else

ws_getpathline_EER="#-Path not correct for a subdomain (${NUM_BARS}) : ${PATH_SITE} ##"
ws_getpathline_COD=12
ws_getpathline_OUT=$(expr  ${ws_getpathline_OUT} + ${ws_getpathline_COD})
ws_getpathline_ERR="${ws_getpathline_ERR}${ws_getpathline_EER}"

fi

fi
else

ws_getpathline_EER="#-Path dont start with bar : ${PATH_SITE} ##"
ws_getpathline_COD=10
ws_getpathline_OUT=$(expr  ${ws_getpathline_OUT} + ${ws_getpathline_COD})
ws_getpathline_ERR="${ws_getpathline_ERR}${ws_getpathline_EER}"

#--END_IF_[01] - START [PATH START WITH BAR ] -----------------------------------
fi


if [ "${ws_getpathline_OUT}" != "0" ] ; then
wscd_ERR="#+${ws_getpathline_FUN}::##${ws_getpathline_ERR}"
footer_error "${ws_getpathline_NFO}" "${ws_getpathline_ERR}"
fi

fi
}
