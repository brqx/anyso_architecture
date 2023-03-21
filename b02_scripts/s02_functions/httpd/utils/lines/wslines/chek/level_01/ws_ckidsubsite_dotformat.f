#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.0" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_ckidsubsite_dotformat
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
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
#E ws_ckidsubsite_dotformat -- Comprueba si el dominio existe en el sistema para no generarlo en una ruta repetida
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_ckidsubsite_dotformat()
{
VER="0.1.0"

ws_ckidsubsite_dotformat_OUT=0
ws_ckidsubsite_dotformat_ERR=""
ws_ckidsubsite_dotformat_MSG=""

ws_ckidsubsite_dotformat_FUN="ws_ckidsubsite_dotformat"
ws_ckidsubsite_dotformat_NFO="Analiza los parametros de entrada para ver si son validos para interactuar con la estructura [$VER]"
ws_ckidsubsite_dotformat_FMT="ws_ckidsubsite_dotformat"
ws_ckidsubsite_dotformat_EXA="ws_ckidsubsite_dotformat"

F=${ws_ckidsubsite_dotformat_FUN}

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_getline_NFO}" "${ws_getline_FMT}" "${ws_getline_EXA}"
#--------------------------------------------------------------------------------
else

#-Require que se hayan definido IDSITE y opcionalmente ID_SUBD
#-Sabemos que es un subdominio
#- Por tanto el formato debera ser abd.ddd.com o parecido sino es incorrecto para la estructura

IDSITE_PASED=${IDSITE}

#-Comprueba si es un dominio o un IDSITE su valor es 1 o 0
SW_IS_DOT_DOMAIN=$(echo ${IDSITE} 		| grep "\." 		| wc -l )
#-Cuenta el numero de puntos o dashes
NUMBER_DOT_SUBDOMAIN=$(echo ${IDSITE} 	| tr  "." "\n" 		| wc -l )

#-Algoritmo
#-1.Comprobar que tine dos puntos
#-2.Si es correcto obtener la sublinea
#-3.Si la sublinea es correcta obtener la linea

if 			[ "${NUMBER_DOT_SUBDOMAIN}" == "3" ] ; then
#--STA_IF_[01] - [ IF NUMBER POINTS SUBDOMAIN ] -----------------------------
#-Casos : powerp.dbrqx.com - (POWERP.DBRQX.COM) - (PElus.dd.a)
#- Es un subdominio normal (dos puntos - tres lineas ) o superior

DOMAIN=${IDSITE}
MAIN_DOMAIN=$(            echo ${DOMAIN}		| cut -d "."  -f2-					)
CLEAN_DOMAIN=$(           echo ${DOMAIN}		| tr "." "_"                        )

SUBD_LINE=$( find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}*.spj"    | head -1  )

	if [ "${SUBD_LINE}" != "" ] ; then
		#- Marcar como correcto

		IDSITE=$(	basename ${SUBD_LINE} | cut -d "_" -f1-2 )
	else
		#-Casos donde el subdominio no existe
		ws_ckidsubsite_dotformat_EER="#-E51:IDSITE IS A WRONG SUBDOMAIN: ${IDSITE} ##"
		ws_ckidsubsite_dotformat_COD=51
	
		ws_ckidsubsite_dotformat_OUT=$(expr  ${ws_ckidsubsite_dotformat_OUT} + ${ws_ckidsubsite_dotformat_COD})
		ws_ckidsubsite_dotformat_ERR="${ws_ckidsubsite_dotformat_ERR}${ws_ckidsubsite_dotformat_EER}"

	fi

elif 			[ "${NUMBER_DOT_SUBDOMAIN}" == "4" ] ; then
#--STA_IF_[01] - [ IF NUMBER POINTS SUBDOMAIN ] -----------------------------
#-Casos : powerp.dbrqx.com - (POWERP.DBRQX.COM) - (PElus.dd.a)
#- Es un subdominio normal (dos puntos - tres lineas ) o superior

DOMAIN=${IDSITE}
MAIN_DOMAIN=$(            echo ${DOMAIN}		| cut -d "."  -f3-					)
CLEAN_DOMAIN=$(           echo ${DOMAIN}		| tr "." "_"                        )

SUBD_LINE=$( find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}.spj"    | head -1  )

	if [ "${SUBD_LINE}" != "" ] ; then
		#- Marcar como correcto

		IDSITE=$(	basename ${SUBD_LINE} | cut -d "_" -f1-3 )
	else
		#-Casos donde el subdominio no existe
		ws_ckidsubsite_dotformat_EER="#-E52:IDSITE IS A WRONG SUBDOMAIN: ${IDSITE} ##"
		ws_ckidsubsite_dotformat_COD=52
	
		ws_ckidsubsite_dotformat_OUT=$(expr  ${ws_ckidsubsite_dotformat_OUT} + ${ws_ckidsubsite_dotformat_COD})
		ws_ckidsubsite_dotformat_ERR="${ws_ckidsubsite_dotformat_ERR}${ws_ckidsubsite_dotformat_EER}"

	fi

elif 		[ "${NUMBER_DOT_SUBDOMAIN}" == "2" ] ; then
#--ELS_IF_[01] - [ IF NUMBER POINTS SUBDOMAIN ] -----------------------------
	ws_ckidsubsite_dotformat_EER="#-E53:IDSITE IS A DOMAIN: ${IDSITE} ##"
	ws_ckidsubsite_dotformat_COD=53

	ws_ckidsubsite_dotformat_OUT=$(expr  ${ws_ckidsubsite_dotformat_OUT} + ${ws_ckidsubsite_dotformat_COD})
	ws_ckidsubsite_dotformat_ERR="${ws_ckidsubsite_dotformat_ERR}${ws_ckidsubsite_dotformat_EER}"
else
	ws_ckidsubsite_dotformat_EER="#-E54:IDSITE IS A WRONG SUBDOMAIN: ${IDSITE} ##"
	ws_ckidsubsite_dotformat_COD=54

	ws_ckidsubsite_dotformat_OUT=$(expr  ${ws_ckidsubsite_dotformat_OUT} + ${ws_ckidsubsite_dotformat_COD})
	ws_ckidsubsite_dotformat_ERR="${ws_ckidsubsite_dotformat_ERR}${ws_ckidsubsite_dotformat_EER}"

#--END_IF_[01] - [ IF NUMBER POINTS SUBDOMAIN ] -----------------------------
fi

ws_ckidsubsite_mainline

if [ "${ws_ckidsubsite_dotformat_OUT}" != "0" ] ; then
ws_ckidsubsite_dotformat_ERR="#+${ws_ckidsubsite_dotformat_FUN}::##${ws_ckidsubsite_dotformat_ERR}"
footer_error "${ws_ckidsubsite_dotformat_NFO}" "${ws_ckidsubsite_dotformat_ERR}"

fi


fi
}
