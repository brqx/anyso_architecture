#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2017
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.0" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- d-ws_ckidsite-
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
#E ws_ckidsite -- Comprueba si el dominio existe en el sistema para no generarlo en una ruta repetida
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_ckidsite()
{
VER="0.1.0"

ws_ckidsite_OUT=0
ws_ckidsite_ERR=""
ws_ckidsite_MSG=""

ws_ckidsite_FUN="ws_ckidsite"
ws_ckidsite_NFO="Analiza los parametros de entrada para ver si son validos para interactuar con la estructura [$VER]"
ws_ckidsite_FMT="ws_ckidsite"
ws_ckidsite_EXA="ws_ckidsite"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_ckidsite_NFO}" "${ws_ckidsite_FMT}" "${ws_ckidsite_EXA}"
#--------------------------------------------------------------------------------
else

#-Require que se hayan definido IDSITE y opcionalmente IDSUBS

PROJECT_PATH="/brqi/"

#-Por defecto los proyectos son dominios
PROJECT_TYPE="domain"

if [ "${IDSITE}" != "" ] ; then
#--STA_IF_[01] - [ IF IDSITE IS DEFINED ] ---------------------------------------

#-Comprueba si es un dominio o un IDSITE su valor es 1 o 0
SW_IS_DOT_DOMAIN=$(     echo ${IDSITE} 2> /dev/null		  | grep "\." 		  | wc -l )
SW_IS_DASH_DOMAIN=$(    echo ${IDSITE} 2> /dev/null     | grep "_" 			  | wc -l )
#-Cuenta el numero de puntos o dashes
NUMBER_DOT_SUBDOMAIN=$( echo ${IDSITE} 2> /dev/null     | tr  "." "\n" 		| wc -l )
NUMBER_DASH_SUBDOMAIN=$(echo ${IDSITE} 2> /dev/null     | tr  "_" "\n" 		| wc -l )

if 				[ "${SW_IS_DOT_DOMAIN}" == "1" -a "${SW_IS_DASH_DOMAIN}" == "1" ] ; then
#--STA_IF_[02] - [ IF DOT AND DASHES ] ------------------------------------------
#-Se trata de un caso raro que hay que parar (hay puntos y dash) 
	ws_ckidsite_EER="#-Bad parameter : ${IDSITE} ##"
	ws_ckidsite_COD=90
	ws_ckidsite_OUT=$(expr  ${ws_ckidsite_OUT} + ${ws_ckidsite_COD})
	ws_ckidsite_ERR="${ws_ckidsite_ERR}${ws_ckidsite_EER}"

elif    		[ "${SW_IS_DOT_DOMAIN}" == "0" -a "${SW_IS_DASH_DOMAIN}" == "0" ] ; then
#-En este caso o es un ID o tenemos subid
#--ELS_IF_[02] - [ IF DOT AND DASHES ] ------------------------------------------

	if 			[ "${ID_SUBD}" 			== ""		]	; then
	#--STA_IF_[03] - [ IF NORMAL SUBDOMAIN ] ------------------------------------

		#-Caso nomrmal para subdominio con ID y IDSUB
		ws_ckidsite_dashformat
		ws_ckidsite_OUT=$(expr  ${ws_ckidsite_OUT} + ${ws_ckidsite_dashformat_OUT})
		ws_ckidsite_ERR="${ws_ckidsite_ERR}${ws_ckidsite_dashformat_ERR}"


	else
		#-Caso nomrmal para subdominio con ID y IDSUB
		ws_ckidsubsite
		ws_ckidsite_OUT=$(expr  ${ws_ckidsite_OUT} + ${ws_ckidsubsite_OUT})
		ws_ckidsite_ERR="${ws_ckidsite_ERR}${ws_ckidsubsite_ERR}"
	#--END_IF_[03] - [ IF NORMAL SUBDOMAIN ] ------------------------------------
	fi
else
#--ELS_IF_[02] - [ IF DOT AND DASHES ] ------------------------------------------

#-O bien hay puntos o dashes ( si hay dashes es un caso de subdominio)
	if 			[ "${SW_IS_DOT_DOMAIN}" 		== "1" 	] ; then
	#--STA_IF_[03] - [ IF POINT SUBDOMAIN ] -------------------------------------

		if 		[ "${NUMBER_DOT_SUBDOMAIN}" 	== "2" 	] ; then

		#-Caso nomrmal para subdominio con ID y IDSUB
		ws_ckidsite_dotformat
		ws_ckidsite_OUT=$(expr  ${ws_ckidsite_OUT} + ${ws_ckidsite_dotformat_OUT})
		ws_ckidsite_ERR="${ws_ckidsite_ERR}${ws_ckidsite_dotformat_ERR}"

		else
		## 	"${SW_DOT_SUBDOMAIN}" == "3"
		#- Es un subdominio normal o superior
		PROJECT_TYPE="subdomain"
		ws_ckidsubsite
		ws_ckidsite_OUT=$(expr  ${ws_ckidsite_OUT} + ${ws_ckidsubsite_OUT})
		ws_ckidsite_ERR="${ws_ckidsite_ERR}${ws_ckidsubsite_ERR}"
		
		#--END_IF_[04] - [ IF NUMBER POINTS ] -----------------------------------
		fi
	else
	#--ELS_IF_[03] - [ IF POINT SUBDOMAIN ] -------------------------------------
    #-- DASH DOMAIN ZONE 
		#- Es un idsite subdominio
	
		PROJECT_TYPE="subdomain"
	
		ws_ckidsubsite
		ws_ckidsite_OUT=$(expr  ${ws_ckidsite_OUT} + ${ws_ckidsubsite_OUT})
		ws_ckidsite_ERR="${ws_ckidsite_ERR}${ws_ckidsubsite_ERR}"


	#--END_IF_[03] - [ IF POINT SUBDOMAIN ] -------------------------------------
	fi

#--END_IF_[02] - [ IF DOT AND DASHES ] ------------------------------------------
fi

else
ws_ckidsite_EER="#-E50:Id Site no defined : ${IDSITE} ##"
ws_ckidsite_COD=15
	
ws_ckidsite_OUT=$(expr  ${ws_ckidsite_OUT} + ${ws_ckidsubsite_COD})
ws_ckidsite_ERR="${ws_ckidsite_ERR}${ws_ckidsite_EER}"

#--END_IF_[01] - [ IF IDSITE DEFINED ] ------------------------------------------
fi

if [ "${ws_ckidsite_OUT}" != "0" ] ; then
ws_ckidsite_ERR="#+${ws_ckidsite_FUN}::##${ws_ckidsite_ERR}"
footer_error "${ws_ckidsite_NFO}" "${ws_ckidsite_ERR}"
fi


fi
}
