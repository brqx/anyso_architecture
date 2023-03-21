#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.0" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#--------------------------------------------------------------------------------
#-- wdom
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas / Comandos
#--------------------------------------------------------------------------------
#-- nslookup
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Resolucion de nombre de dominio con nslookup
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T domain name resolution lookup
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P [DOMAIN]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wdomout brqx.es 	-- Resolucion de nombre de dominio con nslookup 
#--------------------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#--------------------------------------------------------------------------------
#F shell
#--------------------------------------------------------------------------------
wdom()
{
VER="0.1.0"

wdom_FUN="wdom"
wdom_NFO="Resolucion de nombre de dominio con nslookup"
wdom_FMT="wdom [DOMAIN]"
wdom_EXA="wdom pbrqx.com"

wdom_OUT=0
wdom_MSG_CLEAN="wdom_KO"
wdom_ERR=""

if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wdom_NFO}" "${wdom_FMT}" "${wdom_EXA}"
#--------------------------------------------------------------------------------
else

DOMAIN_wdom=${1}

NSLOOKUP_SW=$(which nslookup | wc -l )

if [ "${NSLOOKUP_SW}" 	== "1" 	] 	; 	then
#--STA_IF_[01] - [ NSLOOLUP INSTALLED ] -----------------------------------------

nslookup ${DOMAIN_wdom}		&>	/dev/null
wdom_nslookup_ip_OUT=$?

if [ "${wdom_nslookup_ip_OUT}" == "0" ] ; then
#--STA_IF_[02] - [ NSLOOKUP DOMAIN ANSWERED ] -----------------------------------

IP_DOMAIN=$(	nslookup ${DOMAIN_wdom} 		2> /dev/null | grep Address	| tail -1 | grep -v "#" |  cut -d " " -f2 )

if [ "${IP_DOMAIN}" 	!= "" 	]	;	then
#--STA_IF_[03] - [ IP DOMAIN CHECKED ] ------------------------------------------

nslookup ${IP_DOMAIN}		&>	/dev/null
wdom_nslookup_host_OUT=$?

if [ "${wdom_nslookup_host_OUT}" == "0" ] ; then
#--STA_IF_[04] - [ NSLOOKUP IP ANSWERED ] ---------------------------------------

HOST_SERVER=$(	nslookup ${IP_DOMAIN} 			2> /dev/null | grep arpa 	| head -1 | cut -d " " -f3)

if [ "${HOST_SERVER}" 	!= "" 	]	;	then
#--STA_IF_[05] - [ HOST DOMAIN CHECKED ] ----------------------------------------

wdom_MSG_CLEAN="Wdom_OK"
wdom_TXT="#${wdom_MSG_CLEAN}-Valores para host e ip obtenidos correctamente con dominio ${DOMAIN_wdom} - IP : ${IP_DOMAIN} - HOST :  ${HOST_SERVER} ##"
wdom_OUT=$(	expr ${wdom_nslookup_ip_OUT} + ${wdom_nslookup_host_OUT}	)

else

wdom_COD=${wdom_nslookup_host_OUT}
wdom_EER="#${wdom_COD}-Error al obtnener el host con dominio ${DOMAIN_wdom} ##"

wdom_OUT=$(expr  ${wdom_OUT} + ${wdom_COD})
wdom_ERR="${wdom_ERR}${wdom_EER}"


#--END_IF_[05] - [ HOST DOMAIN CHECKED ] ----------------------------------------
fi
else
wdom_COD=50
wdom_EER="#${wdom_COD}-Error al obtnener el host. Codigo de retorno ${wdom_nslookup_ip_OUT} ##"

wdom_OUT=$(expr  ${wdom_OUT} + ${wdom_COD})
wdom_ERR="${wdom_ERR}${wdom_EER}"
#--END_IF_[04] - [ NSLOOKUP IP ANSWERED ] ---------------------------------------
fi
else
wdom_COD=40
wdom_EER="#${wdom_COD}-Error al obtener la ip del dominio ${DOMAIN_wdom} ##"
wdom_OUT=$(expr  ${wdom_OUT} + ${wdom_COD})
wdom_ERR="${wdom_ERR}${wdom_EER}"

#--END_IF_[03] - [ IP DOMAIN CHECKED ] ------------------------------------------
fi
else
wdom_COD=${wdom_nslookup_ip_OUT}
wdom_EER="#-Nslookup no ha obtenido bien los datos del dominio ${DOMAIN_wdom} ##"
wdom_OUT=$(expr  ${wdom_OUT} + ${wdom_COD})
wdom_ERR="${wdom_ERR}${wdom_EER}"
#--STA_IF_[02] - [ NSLOOKUP DOMAIN ANSWERED ] -----------------------------------
fi
else

wdom_COD=20
wdom_EER="#-No se ha detectado nslookup instalado en el servidor ##"
wdom_OUT=$(expr  ${wdom_OUT} + ${wdom_COD})
wdom_ERR="${wdom_ERR}${wdom_EER}"
#--END_IF_[01] - [ NSLOOLUP INSTALLED ] -----------------------------------------
fi

wdom_MSG="-[${FUNC}] ${wdom_MSG_CLEAN}"


SHOW=1
if [ ${SHOW} -a  "${wdom_OUT}" != "0" ] ; then
wdom_ERR="#+${wdom_FUN}::##${wdom_ERR}"
footer_error "${wdom_NFO}" "${wdom_ERR}"
fi


fi

}
