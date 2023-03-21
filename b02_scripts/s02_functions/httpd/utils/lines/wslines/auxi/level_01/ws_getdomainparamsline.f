#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2018
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.9" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- d-ws_getdomainparamsline-
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
#E ws_getdomainparamsline [FINDLINE] -- Obtiene valores para la FINDLINE
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_getdomainparamsline()
{
VER="0.1.9"

ws_getdomainparamsline_OUT=0
ws_getdomainparamsline_ERR=""
ws_getdomainparamsline_MSG=""

ws_getdomainparamsline_FUN="ws_getdomainparamsline"
ws_getdomainparamsline_NFO="Define las variables ren razon a la linea de configuracion de entrada[$VER]"
ws_getdomainparamsline_FMT="ws_getdomainparamsline LINE"
ws_getdomainparamsline_EXA="ws_getdomainparamsline LINE"


if [ "${1}" == "-?"  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_getline_NFO}" "${ws_getline_FMT}" "${ws_getline_EXA}"
#--------------------------------------------------------------------------------

else
#Unique project to uniform all design indepdent of dynamic implemmentation
UPROJECT=$(         cat  ${PARAMS_FIND_TMP}     | grep "^UPROJECT="     | head -1           | cut -d "=" -f2    )
MODE=$(             cat  ${PARAMS_FIND_TMP} 	| grep "^MODE="   			| head -1          	| cut -d "=" -f2    )
SITE=$(             cat  ${PARAMS_FIND_TMP}		| grep "^SITE="   			| head -1          	| cut -d "=" -f2    )
MAIN_SITE=$(        cat  ${PARAMS_FIND_TMP}     | grep "^MAIN_SITE="    | head -1           | cut -d "=" -f2    )
LANGUAGE=$(         cat  ${PARAMS_FIND_TMP} 	| grep "^LANG="   			| head -1          	| cut -d "=" -f2    )
TYPE_LAN_SITE=$(    cat  ${PARAMS_FIND_TMP}     | grep "^TYPE_LAN_SITE="| head -1           | cut -d "=" -f2    )
ENVIRONMENT=$(      cat  ${PARAMS_FIND_TMP} 	| grep "^ENV="    			| head -1   		| cut -d "=" -f2    )
PRODUCT=$(   		cat  ${PARAMS_FIND_TMP} 	| grep "^PRODUCT=" 			| head -1  			| cut -d "=" -f2    )
VARIANT=$(          cat  ${PARAMS_FIND_TMP}     | grep "^VARIANT="      | head -1       | cut -d "=" -f2    )
SITE_VERSION=$(		cat  ${PARAMS_FIND_TMP} 	| grep "^SITE_VERSION=" 	| head -1  			| cut -d "=" -f2    )
FLOW_VERSION=$(		cat  ${PARAMS_FIND_TMP} 	| grep "^FLOW_VERSION=" 	| head -1  			| cut -d "=" -f2    )

SECURED_SITE=$(     cat  ${PARAMS_FIND_TMP}     | grep "^SECURED_SITE="   | head -1       | cut -d "=" -f2    )

FLOW_STAGE=$(       cat  ${PARAMS_FIND_TMP}     | grep "^FLOW_STAGE="   | head -1       | cut -d "=" -f2    )

FUNCTIONALITIES=$(  cat  ${PARAMS_FIND_TMP}     | grep "^FUNCTIONALITIES="   | head -1       | cut -d "=" -f2    )
COM_FUNCTIONALITIES=$(  cat  ${PARAMS_FIND_TMP}     | grep "^COM_FUNCTIONALITIES="   | head -1       | cut -d "=" -f2    )
SPC_FUNCTIONALITIES=$(  cat  ${PARAMS_FIND_TMP}     | grep "^SPC_FUNCTIONALITIES="   | head -1       | cut -d "=" -f2    )
NEW_FUNCTIONALITIES=$(  cat  ${PARAMS_FIND_TMP}     | grep "^NEW_FUNCTIONALITIES="   | head -1       | cut -d "=" -f2    )


ANGULAR_SITE=$(     cat  ${PARAMS_FIND_TMP}     | grep "^ANGULAR_SITE="   | head -1       | cut -d "=" -f2    )
REACT_SITE=$(       cat  ${PARAMS_FIND_TMP}     | grep "^REACT_SITE="   | head -1       | cut -d "=" -f2    )


DRUPAL_VERSION=$(   cat  ${PARAMS_FIND_TMP} 	| grep "^DRUPAL_VERSION=" 	| head -1  			| cut -d "=" -f2    )
MAGENTO_VERSION=$(  cat  ${PARAMS_FIND_TMP} 	| grep "^MAGENTO_VERSION="  | head -1  			| cut -d "=" -f2    )
NODEJS_VERSION=$(   cat  ${PARAMS_FIND_TMP} 	| grep "^NODEJS_VERSION="  | head -1  			| cut -d "=" -f2    )

#-Este parametro fue util pero ahora se queda para veriones en cluster - Pendiente
REPLICATION=$(      cat  ${PARAMS_FIND_TMP} 	| grep "^REP="    	| head -1           	| cut -d "=" -f2    )

CLEAN_SITE_VERSION=$(echo ${SITE_VERSION} 		| tr "." "_" 														)

DIVISION=$(         echo ${PARAMS_FIND_LINE}	| cut -d "/" -f3                                          	)
PROJECT=$(          echo ${PARAMS_FIND_LINE} 	| cut -d "/" -f4                                          	)
CLEAN_DOMAIN=$(     echo ${PARAMS_FIND_LINE} 	| cut -d "/" -f5  	| cut -d "_" -f2-   	| cut -d "." -f1    )
DOMAIN=$(           echo ${CLEAN_DOMAIN}		| tr "_" "."                            								)
ESCAPED_DOMAIN=$(   echo ${CLEAN_DOMAIN}		| tr "_" "\."                            								)

if [ "${UPROJECT}" == "" ] ; then
UPROJECT=${PROJECT}
fi  

# Si el flujo no se indica, partimos del estado dev
if [ "${FLOW_STAGE}" == "" ] ; then
FLOW_STAGE=dev
fi  

if [ "${FLOW_VERSION}" == "" ] ; then
FLOW_VERSION=v01
fi  


if [ "${ws_getdomainparamsline_OUT}" != "0" ] ; then
ws_getdomainparamsline_ERR="+${ws_getdomainparamsline_FUN}::##${ws_getdomainparamsline_ERR}"
footer_error "${ws_getdomainparamsline_ERR}"
fi


fi
}
