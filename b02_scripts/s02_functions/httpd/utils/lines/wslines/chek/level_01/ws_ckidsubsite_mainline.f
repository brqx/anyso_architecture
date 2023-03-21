#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.1" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_ckidsubsite_mainline
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Comprueba validez de los dominios asociados a los subdominios
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T check domain subdomain asociated
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P 
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_ckidsubsite_mainline -- Comprueba validez de los dominios asociados a los subdominios
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_ckidsubsite_mainline()
{
VER="0.1.1"

ws_ckidsubsite_mainline_OUT=0
ws_ckidsubsite_mainline_ERR=""
ws_ckidsubsite_mainline_MSG=""

ws_ckidsubsite_mainline_FUN="ws_ckidsubsite_mainline"
ws_ckidsubsite_mainline_NFO="Comprueba validez de los dominios asociados a los subdominios [$VER]"
ws_ckidsubsite_mainline_FMT="ws_ckidsubsite_mainline"
ws_ckidsubsite_mainline_EXA="ws_ckidsubsite_mainline"

F=${ws_ckidsubsite_mainline_FUN}

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

#-Gestion del MAIN_LINE
if 			[ 		"${SUBD_LINE}" 		!= "" 			] ; then
#--STA_IF_[01] - [IF NOT EMPTY SUBD_LINE] ---------------------------------------

MAIN_IDSITE=$(	basename ${SUBD_LINE} | cut -d "_" -f1 								)
MAIN_LINE=$( 	find ${PROJECT_PATH} -type f -name "${MAIN_IDSITE}_*.pj" | head -1 	)

if 		[ 		"${MAIN_LINE}" 		!= "" 			] ; then 

	if 	[ -f 	"${MAIN_LINE}" 						] ; then

		ws_ckidsubsite_mainline_MSG="#-Ok.Datos correctos y listos para usarse ##"
	else
		ws_ckidsubsite_mainline_EER="#-E91:Incorrect MAIN_LINE : ${MAIN_LINE} for Id : ${IDSITE} with Subline : ${SUBD_LINE} ##"
		ws_ckidsubsite_mainline_COD=91
	
		ws_ckidsubsite_mainline_OUT=$(expr  ${ws_ckidsubsite_mainline_OUT} + ${ws_ckidsubsite_mainline_COD})
		ws_ckidsubsite_mainline_ERR="${ws_ckidsubsite_mainline_ERR}${ws_ckidsubsite_mainline_EER}"
	fi

fi

#--END_IF_[01] - [ IF ALL CORRECT FOR MAIN LINE ] -------------------------------
fi


if [ "${ws_ckidsubsite_mainline_OUT}" != "0" ] ; then
ws_ckidsubsite_mainline_ERR="#+${ws_ckidsubsite_mainline_FUN}::##${ws_ckidsubsite_mainline_ERR}"
footer_error "${ws_ckidsubsite_mainline_NFO}" "${ws_ckidsubsite_mainline_ERR}"
fi



fi
}
