#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#-------------------------------------------------------------------
#-- wcur
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas /Comandos
#-------------------------------------------------------------------
#-- curl		-	dos2unix
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Chequeo pagina en servidor con curl
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T full check page curl
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [DOMAIN]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wcur brqx.es 	-- Comprueba pagina con curl 
#-------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#-------------------------------------------------------------------
#F wcurout - wsdg
#-------------------------------------------------------------------
wcur()
{
VER="0.0.7"

wcur_FUN="wcur"
wcur_NFO="Chequeo pagina completo en servidor [$VER]"
wcur_FMT="wcur [DOMAIN]"
wcur_EXA="wcur pbrqx.com"

wcur_OUT=0
wcur_MSG_CLEAN="curl_KO"
wcur_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wcur_NFO}" "${wcur_FMT}" "${wcur_EXA}"
#--------------------------------------------------------------------------------
else

DOMAIN_CURL=${1}
CURL_SW=$(		which curl 			| wc -l )
DOS2UNIX_SW=$(	which dos2unix 		| wc -l )

if [ "${CURL_SW}" 			== "1" 			] ; then
#--STA_IF_[01] - [ CURL INSTALLED ] ---------------------------------------------

if [ "${DOS2UNIX_SW}" 		== "1" 			] ; then
#--STA_IF_[02] - [ DOS2UNIX INSTALLED ] -----------------------------------------

if [ -d "/brqi/zzz/curls" 					] ; then
#--STA_IF_[03] - [ PATH CURLS READY ] -------------------------------------------

CLEAN_DOMAIN_CURL=$(echo ${DOMAIN_CURL} | tr "." "_" )

DOMAIN_CURL_FILE=/brqi/zzz/curls/${CLEAN_DOMAIN_CURL}.curl


curl -IL "${DOMAIN_CURL}" -o ${DOMAIN_CURL_FILE} 2> /dev/null
curl_OUT=$?
#-s = Silent cURL's output
#-L = Follow redirects
#-w = Custom output format
#-o = Redirects the HTML output to file

wcur_OUT=${curl_OUT}

if [ "${curl_OUT}" == "0" 			] ; then
#--STA_IF_[04] - [ CURL RUNNED ] ------------------------------------------------

#-Ojo que la salida del curl es en tipo windows con los jodidos control M
dos2unix ${DOMAIN_CURL_FILE} &> /dev/null

#TIME_STRING=$(					curl -o /dev/null -s -w %{time_connect}:%{time_starttransfer}:%{time_total}\\n ${DOMAIN} 	)
TIME_STRING=$(					curl -o /dev/null -s -w %{time_total} ${DOMAIN_CURL} 										)
SPEED_DOWNLOAD_BYTES_SEG=$(		curl -o /dev/null -s -w %{speed_download} ${DOMAIN_CURL}									)
SPEED_DOWNLOAD_CHANGED="$(		echo ${SPEED_DOWNLOAD_BYTES_SEG}|	cut -d ',' -f1											)bps"	
PAGE_SIZE_BYTES=$(				curl -o /dev/null -s -w %{size_download} ${DOMAIN_CURL}										)
PAGE_SIZE_CHANGED="$(			echo ${PAGE_SIZE_BYTES}			|	cut -d ',' -f1											)b"
#PAGE_SIZE="$(					expr ${PAGE_SIZE_CHANGED} / 1024 															)kb"

#SPEED_DOWNLOAD=$(				expr ${SPEED_DOWNLOAD_CHANGED} / 1024 														)

HTTP_CODE=$( 					cat "${DOMAIN_CURL_FILE}" | grep "HTTP"  | cut -d " " -f2 									)
SERVER_TYPE=$( 					cat "${DOMAIN_CURL_FILE}" | grep "Server" | cut -d " " -f2 									)
PHP_VERSION=$( 					cat "${DOMAIN_CURL_FILE}" | grep "X-Powered-By" | cut -d " " -f2 							)
TIME_TOTAL="$(					echo ${TIME_STRING} | tr ',' '.'															)s"

wcur_MSG_CLEAN="Curl_OK"
wcur_TXT="-[${FUNC}] Orden curl lanzada de forma correcta contra el dominio"

else
wcur_COD=10
wcur_EER="#-Error - Curl no ha funcionado correctamente [ ${curl_OUT} ] en dominio ${DOMAIN_CURL} ##"
wcur_OUT=$(expr  ${wcur_OUT} + ${wcur_COD})
wcur_ERR="${wcur_ERR}${wcur_EER}"

##curl: (52) Empty reply from server

#--END_IF_[04] - [ CURL RUNNED ] ------------------------------------------------
fi
else
wcur_COD=20
wcur_EER="#-Error - No existe la ruta donde guardar la informacion de curl ##"
wcur_OUT=$(expr  ${wcur_OUT} + ${wcur_COD})
wcur_ERR="${wcur_ERR}${wcur_EER}"

#--END_IF_[03] - [ PATH CURLS READY ] -------------------------------------------
fi
else

wcur_COD=30
wcur_EER="#-Error - No se ha detectado dos2unix ##"
wcur_OUT=$(expr  ${wcur_OUT} + ${wcur_COD})
wcur_ERR="${wcur_ERR}${wcur_EER}"

#--END_IF_[02] - [ DOS2UNIX INSTALLED ] -----------------------------------------
fi
else

wcur_COD=40
wcur_EER="#-No se ha detectado curl instalado en el servidor ##"
wcur_OUT=$(expr  ${wcur_OUT} + ${wcur_COD})
wcur_ERR="${wcur_ERR}${wcur_EER}"

#--END_IF_[01] - [ CURL INSTALLED ] ---------------------------------------------
fi

wcur_MSG="-[${FUNC}] ${wcur_MSG_CLEAN}"


if [ ${SHOW} -a  "${wcur_OUT}" != "0" ] ; then
wcur_ERR="#+${wcur_FUN}::##${wcur_ERR}"
footer_error "${wcur_NFO}" "${wcur_ERR}"
fi


fi
}
