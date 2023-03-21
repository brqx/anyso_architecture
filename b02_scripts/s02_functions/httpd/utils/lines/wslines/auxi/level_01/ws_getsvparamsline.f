#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.1" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_getsvparamsline
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_ckparamsline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Obtiene una linea de valores de un fichero de configuracion
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T get values settings file
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P FIND_LINE
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_getsvparamsline [FINDLINE] -- Obtiene valores para la FINDLINE
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_getsvparamsline()
{
VER="0.1.1"

ws_getsvparamsline_OUT=0
ws_getsvparamsline_ERR=""
ws_getsvparamsline_MSG=""

ws_getsvparamsline_FUN="ws_getsvparamsline"
ws_getsvparamsline_NFO="Define las variables ren razon a la linea de configuracion de entrada[$VER]"
ws_getsvparamsline_FMT="ws_getsvparamsline LINE"
ws_getsvparamsline_EXA="ws_getsvparamsline LINE"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_getline_NFO}" "${ws_getline_FMT}" "${ws_getline_EXA}"
#--------------------------------------------------------------------------------

else
#-Require PARAMS_FIND_TMP definido 

#-Get Server Data
gsd

#-Only exist in Centos 6x
IP_SERVER=${SERVER_IP}

#-Esto hay que cambiarlo para que sea mas consistente
SERVER_NAME=${CLEAN_SERVER_NAME}

if [ "${PARAMS_FIND_TMP}" != "" ] ; then

#---------------------------------------------------
#-Web Servers
#---------------------------------------------------
WEBSERVERS=$(   	cat  ${PARAMS_FIND_TMP} 	| grep "^SERVERS" | head -1  			| cut -d "=" -f2    | tr ":" " "    )
#---------------------------------------------------
#-Php Engines
#---------------------------------------------------
ENGINE_NGINX=$(     cat  ${PARAMS_FIND_TMP}  	| grep "^ENGINE_NGINX="    	| head -1   | cut -d "=" -f2    )
ENGINE_LIGHTTP=$(   cat  ${PARAMS_FIND_TMP} 	| grep "^ENGINE_LIGHTTP="  	| head -1   | cut -d "=" -f2    )
ENGINE_HTTPD=$(   	cat  ${PARAMS_FIND_TMP} 	| grep "^ENGINE_HTTPD="    	| head -1   | cut -d "=" -f2    )

#---------------------------------------------------
#-Php PDO Engines
#---------------------------------------------------
#-For Apache 2.2 - php 52 
FILEPDO_APACHE=$(   cat  ${PARAMS_FIND_TMP} 	| grep "^FILEPDO_APACHE="  	| head -1   | cut -d "=" -f2    )

#-For Apache 2.4 - php 56 - php 7
FILEPDO_HTTPD=$(   	cat  ${PARAMS_FIND_TMP} 	| grep "^FILEPDO_HTTPD="   	| head -1   | cut -d "=" -f2    )

#---------------------------------------------------
#-HA Proxy Local Backend
#---------------------------------------------------
HA_LOCAL_BACKEND=$( cat  ${PARAMS_FIND_TMP} 	| grep "^HA_LOCAL_BACKEND="	| head -1   | cut -d "=" -f2    )

#---------------------------------------------------
#-DEPLOYMENT FILESYSTEM TYPE
#---------------------------------------------------
#-Indica el tipo de filesystem para usar con el site: RAM : SSD : SATA

MAIN_STORAGE_TYPE=$(cat  ${PARAMS_FIND_TMP} 		| grep "^MAIN_STORAGE_TYPE="	| head -1   | cut -d "=" -f2    )
OLD_STORAGE_TYPE=$( cat  ${PARAMS_FIND_TMP} 		| grep "^OLD_STORAGE_TYPE="		| head -1   | cut -d "=" -f2    )

#---------------------------------------------------
#-NODE TYPE - pENDIENTe
#---------------------------------------------------
NODE_TYPE=$(       	cat  ${SERVER_NFO_FILE} 		| grep -v "^#" | grep "^NODE_TYPE="   | head -1   	| cut -d "=" -f2    )

VS_PORT=${CLEAN_DOMAIN}_port.conf

#else

#Error Fichero no definido ${PARAMS_FIND_TMP}

fi

if [ "${ws_getsvparamsline_OUT}" != "0" ] ; then
ws_getsvparamsline_ERR="+${ws_getsvparamsline_FUN}::##${ws_getsvparamsline_ERR}"
footer_error "${ws_getsvparamsline_ERR}"
fi


fi
}
