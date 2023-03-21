#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.0" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_ckidsubsite
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
#E ws_ckidsubsite -- Comprueba si el dominio existe en el sistema para no generarlo en una ruta repetida
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_ckidsubsite()
{
VER="0.1.0"

ws_ckidsubsite_OUT=0
ws_ckidsubsite_ERR=""
ws_ckidsubsite_MSG=""

ws_ckidsubsite_FUN="ws_ckidsubsite"
ws_ckidsubsite_NFO="Analiza los parametros de entrada para ver si son validos para interactuar con la estructura [$VER]"
ws_ckidsubsite_FMT="ws_ckidsubsite"
ws_ckidsubsite_EXA="ws_ckidsubsite"

F=${ws_ckidsubsite_FUN}

if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_getline_NFO}" "${ws_getline_FMT}" "${ws_getline_EXA}"
#--------------------------------------------------------------------------------
else

#-Require que se hayan definido IDSITE y opcionalmente ID_SUBD

#-Sabemos que es un subdominio

SW_IS_DOT_DOMAIN=$(		echo ${IDSITE} 		| grep "\." 		| wc -l )
SW_IS_DASH_DOMAIN=$(	echo ${IDSITE} 		| grep "_" 			| wc -l )

NUMBER_DASH_SUBDOMAIN=$(echo ${IDSITE} 	| tr  "_" "\n" 		| wc -l )


if 		[ "${SW_IS_DOT_DOMAIN}" == "1" -a "${SW_IS_DASH_DOMAIN}" == "1" ] ; then
#-Casos : (abc.com_es) - (ggg.abc_com) - (ddd-abc_abd.com)
#-Todos incorrectos
	ws_ckidsubsite_EER="#-E10:Format Wrong IDSITE:${IDSITE} is a wrong domain ##"
	ws_ckidsubsite_COD=10

	ws_ckidsubsite_OUT=$(expr  ${ws_ckidsubsite_OUT} + ${ws_ckidsubsite_COD})
	ws_ckidsubsite_ERR="${ws_ckidsubsite_ERR}${ws_ckidsubsite_EER}"

elif 	[ "${SW_IS_DOT_DOMAIN}" == "1" ] ; then
#-Casos : abc.com - ggg.abc.com - (abc.ddd.ggg.hhh.yyy.com)
#-Caso de dominio o subdominio

	ws_ckidsubsite_dotformat
	ws_ckidsubsite_OUT=$(expr  ${ws_ckidsubsite_OUT} + ${ws_ckidsubsite_dotformat_OUT})
	ws_ckidsubsite_ERR="${ws_ckidsubsite_ERR}${ws_ckidsubsite_dotformat_ERR}"

else
#-Casos : zd | zd powerp - abc_com - (ggg_abc_com) - (abc_ddd_ggg_hhh_yyy)
	if 		[ "${ID_SUBD}" 			== ""		]	; then
	#--STA_IF_[03] - [ IS DOMAIN ] ------------------------------------------
	#-Casos :  zd - zd_powerp  - (zd_gg_gg)

		#-Ojo que cualquier dominio tendra una linea siempre
		if 		[ "${NUMBER_DASH_SUBDOMAIN}" 	== "1" 	] ; then
		#-Caso : zd
		PROJECT_TYPE="domain"
		ws_ckidsubsite_EER="#-E11:Parameters error IdSite : ${IDSITE} is a domain ##"
		ws_ckidsubsite_COD=11
	
		ws_ckidsubsite_OUT=$(expr  ${ws_ckidsubsite_OUT} + ${ws_ckidsubsite_COD})
		ws_ckidsubsite_ERR="${ws_ckidsubsite_ERR}${ws_ckidsubsite_EER}"
		else
		#-Casos zd_powerp - (zd_power_power)
			ws_ckidsubsite_dashformat
			ws_ckidsubsite_OUT=$(expr  ${ws_ckidsubsite_OUT} + ${ws_ckidsubsite_dashformat_OUT})
			ws_ckidsubsite_ERR="${ws_ckidsubsite_ERR}${ws_ckidsubsite_dashformat_ERR}"

		fi
	else
	#-caso zd powerp - (zd_ggg_hh powerp)
	#-Composicion de ID

	IDSITE=${IDSITE}_${ID_SUBD}
	ID_SUBD=""
	
##	echd "${F}::Comprobar dash format"

	ws_ckidsubsite_dashformat
	ws_ckidsubsite_OUT=$(expr  ${ws_ckidsubsite_OUT} + ${ws_ckidsubsite_dashformat_OUT})
	ws_ckidsubsite_ERR="${ws_ckidsubsite_ERR}${ws_ckidsubsite_dashformat_ERR}"

	fi

#--END_IF_[00] - [ IF IDSITE DEFINED ] ------------------------------------------
fi


if [ "${ws_ckidsubsite_OUT}" != "0" ] ; then
ws_ckidsubsite_ERR="#+${ws_ckidsubsite_FUN}::##${ws_ckidsubsite_ERR}"
footer_error  "${ws_ckidsubsite_NFO}" "${ws_ckidsubsite_ERR}"

fi


fi
}
