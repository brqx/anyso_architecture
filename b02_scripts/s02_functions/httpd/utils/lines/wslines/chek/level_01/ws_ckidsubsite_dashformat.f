#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.1" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_ckidsubsite_dashformat
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
#E ws_ckidsubsite_dashformat -- Comprueba si el dominio existe en el sistema para no generarlo en una ruta repetida
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_ckidsubsite_dashformat()
{
VER="0.1.1"

ws_ckidsubsite_dashformat_OUT=0
ws_ckidsubsite_dashformat_ERR=""
ws_ckidsubsite_dashformat_MSG=""

ws_ckidsubsite_dashformat_FUN="ws_ckidsubsite_dashformat"
ws_ckidsubsite_dashformat_NFO="Analiza los parametros de entrada para ver si son validos para interactuar con la estructura [$VER]"
ws_ckidsubsite_dashformat_FMT="ws_ckidsubsite_dashformat"
ws_ckidsubsite_dashformat_EXA="ws_ckidsubsite_dashformat"

F=${ws_ckidsubsite_dashformat_FUN}

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_getline_NFO}" "${ws_getline_FMT}" "${ws_getline_EXA}"
#--------------------------------------------------------------------------------
else

IDSITE_PASED=${IDSITE}

#-Require que se hayan definido IDSITE (no se analiza ID_SUBD)

#-Sabemos que es un subdominio

SW_IS_DASH_DOMAIN=$(echo ${IDSITE} 		| grep "_" 			| wc -l )
#-Cuenta el numero de puntos o dashes
NUMBER_DASH_SUBDOMAIN=$(echo ${IDSITE} 	| tr  "_" "\n" 		| wc -l )

##echo "${F}::Test Subdominio - Formato dash - subdominio"

if 		[ "${SW_IS_DASH_DOMAIN}" == "1" ] ; then
#--STA_IF_[01] - [ IF DASH SUBDOMAIN ] --------------------------------------
#-Casos : abc_cc - (ddd_abc_aa)
##		echo "${F}::Test Subdominio - Formato dash - subdominio"

	if 		[ "${NUMBER_DASH_SUBDOMAIN}" 	== "2" 	] ; then
	#-Casos abc_cd
		SUBD_LINE=$( find ${PROJECT_PATH} -type f -name "*${IDSITE}_*.spj"    | head -1  )

		if [ "${SUBD_LINE}" != "" ] ; then
			#- Marcar como correcto
			CLEAN_DOMAIN=$(	basename ${SUBD_LINE} 	| cut -d "." -f1 | cut -d "_" -f2- 	)
			DOMAIN=$(       echo ${CLEAN_DOMAIN} 	| tr "_" "."                       	)
			MAIN_DOMAIN=$(	echo ${DOMAIN}			| cut -d "." -f2-					)

		else
			ws_ckidsubsite_dashformat_EER="#-E41:Subdomain don't exist in structure : ${IDSITE} ##"
			ws_ckidsubsite_dashformat_COD=41
	
			ws_ckidsubsite_dashformat_OUT=$(expr  ${ws_ckidsubsite_dashformat_OUT} + ${ws_ckidsubsite_dashformat_COD})
			ws_ckidsubsite_dashformat_ERR="${ws_ckidsubsite_dashformat_ERR}${ws_ckidsubsite_dashformat_EER}"
	
		fi
	elif 		[ "${NUMBER_DASH_SUBDOMAIN}" 	== "3" 	] ; then
	#-Casos abc_cd_ff
		SUBD_LINE=$( find ${PROJECT_PATH} -type f -name "*${IDSITE}_*.spj"    | head -1  )

		if [ "${SUBD_LINE}" != "" ] ; then
			#- Marcar como correcto
			CLEAN_DOMAIN=$(	basename ${SUBD_LINE} 	| cut -d "." -f1 | cut -d "_" -f2- 	)
			DOMAIN=$(       echo ${CLEAN_DOMAIN} 	| tr "_" "."                       	)
			MAIN_DOMAIN=$(	echo ${DOMAIN}			| cut -d "." -f2-					)

		else
			ws_ckidsubsite_dashformat_EER="#-E42:Subdomain don't exist in structure : ${IDSITE} ##"
			ws_ckidsubsite_dashformat_COD=42
	
			ws_ckidsubsite_dashformat_OUT=$(expr  ${ws_ckidsubsite_dashformat_OUT} + ${ws_ckidsubsite_dashformat_COD})
			ws_ckidsubsite_dashformat_ERR="${ws_ckidsubsite_dashformat_ERR}${ws_ckidsubsite_dashformat_EER}"
	
		fi
	else
	#--ELS_IF_[03] - [ IF EMPTY SUBDOMAIN ] ---------------------------------
	#caso zd_powerp_cccc

		ws_ckidsubsite_dashformat_EER="#-E43:Error en parametros IDSITE:${IDSITE} ##"
		ws_ckidsubsite_dashformat_COD=43
	
		ws_ckidsubsite_dashformat_OUT=$(expr  ${ws_ckidsubsite_dashformat_OUT} + ${ws_ckidsubsite_dashformat_COD})
		ws_ckidsubsite_dashformat_ERR="${ws_ckidsubsite_dashformat_ERR}${ws_ckidsubsite_dashformat_EER}"
	#--END_IF_[03] - [ IF EMPTY SUBDOMAIN ] ---------------------------------
	fi
fi

ws_ckidsubsite_mainline
ws_ckidsubsite_OUT=$(expr  ${ws_ckidsubsite_OUT} + ${ws_ckidsubsite_mainline_OUT})
ws_ckidsubsite_ERR="${ws_ckidsubsite_ERR}${ws_ckidsubsite_mainline_ERR}"



if [ "${ws_ckidsubsite_dashformat_OUT}" != "0" ] ; then
ws_ckidsubsite_dashformat_ERR="#+${ws_ckidsubsite_dashformat_FUN}::##${ws_ckidsubsite_dashformat_ERR}"
footer_error "${ws_ckidsubsite_dashformat_NFO}" "${ws_ckidsubsite_dashformat_ERR}"
fi


fi
}
