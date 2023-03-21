#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.0" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_ckidsite_dotformat
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
#E ws_ckidsite_dotformat -- Comprueba si el dominio existe en el sistema para no generarlo en una ruta repetida
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_ckidsite_dotformat()
{
VER="0.1.0"

ws_ckidsite_dotformat_OUT=0
ws_ckidsite_dotformat_ERR=""
ws_ckidsite_dotformat_MSG=""

ws_ckidsite_dotformat_FUN="ws_ckidsite_dotformat"
ws_ckidsite_dotformat_NFO="Analiza los parametros de entrada para ver si son validos para interactuar con la estructura [$VER]"
ws_ckidsite_dotformat_FMT="ws_ckidsite_dotformat"
ws_ckidsite_dotformat_EXA="ws_ckidsite_dotformat"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_ckidsite_dotformat_NFO}" "${ws_ckidsite_dotformat_FMT}" "${ws_ckidsite_dotformat_EXA}"
#--------------------------------------------------------------------------------
else

PROJECT_PATH="/brqi/"

if 			[ "${IDSITE}" != "" ] ; then
#--STA_IF_[01] - [ IF IDSITE IS DEFINED ] ---------------------------------------

#-Comprueba si es un dominio o un IDSITE su valor es 1 o 0
SW_IS_DOT_DOMAIN=$(echo ${IDSITE} 		| grep "\." 		| wc -l )
SW_IS_DASH_DOMAIN=$(echo ${IDSITE} 		| grep "_" 			| wc -l )
#-Cuenta el numero de puntos o dashes
NUMBER_DOT_SUBDOMAIN=$(echo ${IDSITE} 	| tr  "." "\n" 		| wc -l )
NUMBER_DASH_SUBDOMAIN=$(echo ${IDSITE} 	| tr  "_" "\n" 		| wc -l )

if    		[ "${SW_IS_DOT_DOMAIN}" == "1" -a "${SW_IS_DASH_DOMAIN}" == "0" ] ; then
#--STA_IF_[02] - [ IF SURE IS DOMAIN FORMAT ] -----------------------------------

#Casos dbrqx.com  (DD.com)
	if 		[ "${NUMBER_DOT_SUBDOMAIN}" 	== "2" 	] ; then
	#--STA_IF_[03] - [ IF NUMBER POINTS ] ---------------------------------------

		DOMAIN=${IDSITE}
		CLEAN_DOMAIN=$(           echo ${DOMAIN}		| tr "." "_"                        )

		FIND_LINE=$(   find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}.pj"  | head -1  )

		if [ "${FIND_LINE}" != "" ] ; then
		#--STA_IF_[04] - [ IF EXIST FIND_LINE ] ---------------------------------

			#- Marcar como correcto
			#-Debemos redefinir el IDSITE
	
			IDSITE=$(	basename ${FIND_LINE} | cut -d "_" -f1 )
		else
			#-Casos donde el subdominio no existe
			ws_ckidsite_dotformat_EER="#-E100:IDSITE is a domain which don't exist in server structure: ${IDSITE} ##"
			ws_ckidsite_dotformat_COD=100
		
			ws_ckidsite_dotformat_OUT=$(expr  ${ws_ckidsite_dotformat_OUT} + ${ws_ckidsite_dotformat_COD})
			ws_ckidsite_dotformat_ERR="${ws_ckidsite_dotformat_ERR}${ws_ckidsite_dotformat_EER}"

		#--END_IF_[04] - [ IF EXIST FIND_LINE ] ---------------------------------
		fi

	else
	#--ELS_IF_[03] - [ IF NUMBER POINTS ] -----------------------------------

		ws_ckidsite_dotformat_EER="#-E23:Incorrect format or subdomain : ${IDSITE} ##"
		ws_ckidsite_dotformat_COD=23
			
		ws_ckidsite_dotformat_OUT=$(expr  ${ws_ckidsite_dotformat_OUT} + ${ws_ckidsubsite_COD})
		ws_ckidsite_dotformat_ERR="${ws_ckidsite_dotformat_ERR}${ws_ckidsite_dotformat_EER}"
	
	#--END_IF_[03] - [ IF POINT SUBDOMAIN ] -------------------------------------
	fi

else
ws_ckidsite_dotformat_EER="#-E24:Id Site no correct format or subdomain : ${IDSITE} ##"
ws_ckidsite_dotformat_COD=24
	
ws_ckidsite_dotformat_OUT=$(expr  ${ws_ckidsite_dotformat_OUT} + ${ws_ckidsite_dotformat_COD})
ws_ckidsite_dotformat_ERR="${ws_ckidsite_dotformat_ERR}${ws_ckidsite_dotformat_EER}"

#--END_IF_[02] - [ IF DOT AND DASHES ] ------------------------------------------
fi
else
ws_ckidsite_dotformat_EER="#-E50:Id Site no defined : ${IDSITE} ##"
ws_ckidsite_dotformat_COD=15
	
ws_ckidsite_dotformat_OUT=$(expr  ${ws_ckidsite_dotformat_OUT} + ${ws_ckidsite_dotformat_COD})
ws_ckidsite_dotformat_ERR="${ws_ckidsite_dotformat_ERR}${ws_ckidsite_dotformat_EER}"

#--END_IF_[01] - [ IF IDSITE DEFINED ] ------------------------------------------
fi


if [ "${ws_ckidsite_dotformat_OUT}" != "0" ] ; then
ws_ckidsite_dotformat_ERR="#+${ws_ckidsite_dotformat_FUN}::##${ws_ckidsite_dotformat_ERR}"
footer_error "${ws_ckidsite_dotformat_NFO}" "${ws_ckidsite_dotformat_ERR}"
fi


fi
}
