#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.0" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_ckidsite_dashformat
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_ckidsubsite
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Comprueba si el dominio existe en el sistema para no generarlo en una ruta repetida
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T get values settings file
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P 
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_ckidsite_dashformat -- Comprueba si el dominio existe en el sistema para no generarlo en una ruta repetida
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_ckidsite_dashformat()
{
VER="0.1.0"

ws_ckidsite_dashformat_OUT=0
ws_ckidsite_dashformat_ERR=""
ws_ckidsite_dashformat_MSG=""

ws_ckidsite_dashformat_FUN="ws_ckidsite_dashformat"
ws_ckidsite_dashformat_NFO="Analiza los parametros de entrada para ver si son validos para interactuar con la estructura [$VER]"
ws_ckidsite_dashformat_FMT="ws_ckidsite_dashformat"
ws_ckidsite_dashformat_EXA="ws_ckidsite_dashformat"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_ckidsite_dashformat_NFO}" "${ws_ckidsite_dashformat_FMT}" "${ws_ckidsite_dashformat_EXA}"
#--------------------------------------------------------------------------------
else

#-Require que se hayan definido IDSITE 

PROJECT_PATH="/brqi/"

#-Por defecto los proyectos son dominios
PROJECT_TYPE="domain"

if [ "${IDSITE}" != "" ] ; then
#--STA_IF_[01] - [ IF IDSITE IS DEFINED ] ---------------------------------------

#-Comprueba si es un dominio o un IDSITE su valor es 1 o 0
SW_IS_DOT_DOMAIN=$(echo ${IDSITE} 		| grep "\." 		| wc -l )
SW_IS_DASH_DOMAIN=$(echo ${IDSITE} 		| grep "_" 			| wc -l )
#-Cuenta el numero de puntos o dashes
NUMBER_DOT_SUBDOMAIN=$(echo ${IDSITE} 	| tr  "." "\n" 		| wc -l )
NUMBER_DASH_SUBDOMAIN=$(echo ${IDSITE} 	| tr  "_" "\n" 		| wc -l )

if    		[ "${SW_IS_DOT_DOMAIN}" == "0" -a "${SW_IS_DASH_DOMAIN}" == "0" ] ; then
#-En este caso o es un ID 
#- Casos zd - (zgg)

	FIND_LINE=$(   find ${PROJECT_PATH} -type f -name "${IDSITE}_*.pj"  | head -1    )

	if [ "${FIND_LINE}" != "" ] ; then
		#- Marcar como correcto
		CLEAN_DOMAIN=$(	basename ${FIND_LINE} 	| cut -d "." -f1 | cut -d "_" -f2- 	)
		DOMAIN=$(       echo ${CLEAN_DOMAIN} 	| tr "_" "."                       	)

	else
		ws_ckidsite_dashformat_EER="#-E41:Domain don't exist in structure : ${IDSITE} ##"
		ws_ckidsite_dashformat_COD=41

		ws_ckidsite_dashformat_OUT=$(expr  ${ws_ckidsite_dashformat_OUT} + ${ws_ckidsite_dashformat_COD})
		ws_ckidsite_dashformat_ERR="${ws_ckidsite_dashformat_ERR}${ws_ckidsite_dashformat_EER}"

	fi
else
	ws_ckidsite_dashformat_EER="#-E43:Incorrect format or subdomain : ${IDSITE} ##"
	ws_ckidsite_dashformat_COD=43
		
	ws_ckidsite_dashformat_OUT=$(expr  ${ws_ckidsite_dashformat_OUT} + ${ws_ckidsite_dashformat_COD})
	ws_ckidsite_dashformat_ERR="${ws_ckidsite_dashformat_ERR}${ws_ckidsite_dashformat_EER}"



#--END_IF_[02] - [ IF DOT AND DASHES ] ------------------------------------------
fi

else
ws_ckidsite_dashformat_EER="#-E42:Id Site no defined : ${IDSITE} ##"
ws_ckidsite_dashformat_COD=42
	
ws_ckidsite_dashformat_OUT=$(expr  ${ws_ckidsite_dashformat_OUT} + ${ws_ckidsite_dashformat_COD})
ws_ckidsite_dashformat_ERR="${ws_ckidsite_dashformat_ERR}${ws_ckidsite_dashformat_EER}"

#--END_IF_[01] - [ IF IDSITE DEFINED ] ------------------------------------------
fi


if [ "${ws_ckidsite_dashformat_OUT}" != "0" ] ; then
ws_ckidsite_dashformat_ERR="#+${ws_ckidsite_dashformat_FUN}::##${ws_ckidsite_dashformat_ERR}"
footer_error "${ws_ckidsite_dashformat_NFO}" "${ws_ckidsite_dashformat_ERR}"
fi


fi
}
