#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.9" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#-------------------------------------------------------------------
#-- wsdg
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- wdom
#-- ws_gdcreate -  wsdg_print_lines
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera el fichero de dominios para usarse en HaProxy
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T create haproxy domain structure
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P DOMAIN [DOMAIN_LIST_FILE]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wsdg brqx.es	-- Genera la estructura de dominios para usarse en HaProxy para el dominio indicad
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#C - Change : Solo va a generar las lineas que realmente tengan estructura creada
#-------------------------------------------------------------------
wsdg()
{
VER="0.0.9"
FUNC="wsdg"

wsdg_NFO="Genera la estructura para un WAF Haproxy para el dominio en arquitectura Brqx [$VER]"
wsdg_FMT="wsdg [domain] [domains_file]"
wsdg_EXA="wsdg brqx.es"


wsdg_OUT=0
wsdg_MSG=""
wsdg_ERR=""

#STA_IF_[01] - Inicio Funcion --------------------------------------------------------------------
if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsdg_NFO}" "${wsdg_FMT}" "${wsdg_EXA}"
#--------------------------------------------------------------------------------
else

IDSITE=${1}

PROJECT_PATH="/brqi/"

DOMAINS_FILE=$( 		find ${PROJECT_PATH} -type f -name "brqx.fulldom"     			 | head -1      )

ws_gdcreate
#wscd_OUT=$(expr  ${wscd_OUT} + ${ws_gdcreate_OUT})
#wscd_ERR="${wscd_ERR}${ws_gdcreate_ERR}"

if [ "${ws_gdcreate_OUT}" == "0" ] ; then
#--STA_IF_[01] - START [IF ws_getdomainline_CORRECT] ----------------------------

#-Si existe una linea es que se ha definido estructura para el dominio y ademas no esta duplicada

FULL_DOMAINS_FILE=/brqs/domains/domains.ful
SERVER_DOMAINS_FILE=/etc/haproxy/domains.map

let real_cont_domain++

#-Domain exist in server
wsdg_MSG="Domain exist in server"

LOADSUBD=""   # Variable usada para saber si debemos mostrar los subdominios
LOADLANGS=""  # Variable usada para determinar si informamos de los idiomas
HEAD_LINE_INFORMATION=""
SHOW_WWW_DOMAIN=""

#Brqx - Sep16 - Uncomment later
wsdg_print_lines ${FULL_DOMAINS_FILE} 

#wsdg_show_lines 

#-Primero comprobamos si el servidor donde generamos los dominios es un proxy
#-si lo es solo debemos generar dominios locales si existen en la estructura
#---- HAY QUE REVISAR ESTA PARTE PUES AHORA NO TENGO CLARO COMO ERA EN CASO DE PROXY
if 				[  	"${SERVER_TYPE}" 					== "proxy" 				] 	; then 
#STA_IF_[02] - [ SERVER IS PROXY ] ----------------------------------------------
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
  echo "Estamos generando en Ex - Fx"
	if 			[ 	"${IP_SERVER}" 						== "${IP_DOMAIN}"		] 	; then
	let pointed_cont_domain++
		if 		[ 	"${DOMAIN_EXIST}"					!= "0" 					] 	; then
			wsdg_print_lines ${SERVER_DOMAINS_FILE} ${HA_LOCAL_BACKEND}
			echo "${SERVER_TYPE}::Estructura Local ${DOMAIN_TYPE} : ${CLEAN_DOMAIN_PASED}"	
			let created_cont_domain++
		fi
	fi
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
else
#ELS_IF_[02] - [ SERVER IS NOT PROXY ] ------------------------------------------
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-El servidor no es un proxy - entonces son dominios locales tanto proxy como no proxy
#Estamos generando en Ux - Ix 
	echo "Generando line : ${DOMAIN} - ${DOMAIN_EXIST} -  [NOPROXY]"
	if 			[ 	"${IP_SERVER}" 						== "${IP_DOMAIN}" 		] 	; then
		if 		[ 	"${DOMAIN_EXIST}" 					!= "0" 					] 	; then
			echo "${FUNC}::${SERVER_TYPE}:${DOMAIN_TYPE} : ${CLEAN_DOMAIN_PASED} - Backend : ${HA_LOCAL_BACKEND}"	
			wsdg_print_lines ${SERVER_DOMAINS_FILE} ${HA_LOCAL_BACKEND}
			let created_cont_domain++
		fi
	elif 		[ 	"${DOMAIN_TYPE}" 					== "proxy" 				] 	; then
	#-El dominio apunta a un proxy siendo el servidor node (no proxy)
		if 		[ 	"${DOMAIN_EXIST}" 					!= "0" 					] 	; then
			echo "${FUNC}::${SERVER_TYPE}:${DOMAIN_TYPE} : ${CLEAN_DOMAIN_PASED} - Backend : ${HA_LOCAL_BACKEND}"
			wsdg_print_lines ${SERVER_DOMAINS_FILE} ${HA_LOCAL_BACKEND}
			let created_cont_domain++
		else
			#En este caso es un domino de proxy pero que aun no tiene estructura
			let proxy_pointed_cont_domain++ 
			find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN_PASED}\.pj"		>> ${UNSTRUCTURED_DOMAINS_FILE}
		fi			
	fi
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#END_IF_[03] - Fin Server Type Proxy ------------------------------------------------------------------
fi

if 	[ 	"${DOMAIN_EXIST_IN_DIFFERENT_PATH}" 	!= "0" 							]	; then
	#Si el dominio aparece mas de una vez entonces hay un fallo en la estructura
	find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN_PASED}\.pj"				>> ${BADDEFINITION_DOMAINS_FILE}
fi

wsdg_MSG="SERVER INFO SERVER : ${SERVER_TYPE}::Estructura Local ${DOMAIN_TYPE} : ${CLEAN_DOMAIN_PASED}"

else
wsdg_MSG="DANGER : MAIN DOMAN FILE DONT EXIST IN CLUSTER STRUCTURE"
wsdg_OUT=1
echo "${DOMAIN_PASED} - IP:${DOMAIN_IP} - HOSTED:${HOST_SERVER} "  					>> ${NOTFOUND_DOMAINS_FILE}

#END_IF_[02] - END Fin Domain Line --------------------------------------------------------------------
fi

#-Vaciado de variables
wsempty

#END_IF_[01] - END Fin Funcion ------------------------------------------------------------------------
fi
}
