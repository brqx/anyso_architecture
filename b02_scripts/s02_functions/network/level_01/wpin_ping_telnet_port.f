#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (01) ] 
#--------------------------------------------------------------------------------
#-- wpin
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Chequeo conectividad ICMP en servidor
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T get domain information ping icmp
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P [DOMAIN]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wpin brqx.es 	-- Llamada de conectividad protocolo icmp 
#--------------------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#--------------------------------------------------------------------------------
#F wsdg
#--------------------------------------------------------------------------------
wpin()
{
VER="0.0.7"

wpin_FUN="wpin"
wpin_NFO="Chequeo conectividad ICMP en servidor [$VER]"
wpin_FMT="wpin [DOMAIN]"
wpin_EXA="wpin pbrqx.com"

wpin_OUT=0
wpin_MSG_CLEAN="Ping_KO"
wpin_ERR=""
wpin_RTT=""

if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wpin_NFO}" "${wpin_FMT}" "${wpin_EXA}"
#--------------------------------------------------------------------------------
else

DOMAIN_PIN=$1

RTT_LINE=$(ping -q -c 1 ${DOMAIN_PIN} 2> /dev/null | grep "rtt"    ) 
ping_OUT=${?}

if [ "${ping_OUT}" 		== "0" ] ; then
wpin_OUT=0
wpin_MSG_CLEAN="Ping_Ok"
wpin_RTT="${RTT_LINE}"

elif [ "${ping_OUT}" 	== "2" ] ; then
wpin_COD=2
wpin_EER="#-Domain not resolved ##"
wpin_OUT=$(expr  ${wpin_OUT} + ${wpin_COD})
wpin_ERR="${wpin_ERR}${wpin_EER}"
elif [ "${ping_OUT}"  == "1" ] ; then
wpin_COD=${ping_OUT}
wpin_EER="#-Error not defined (Maybe Ip don't answer)##"
wpin_OUT=$(expr  ${wpin_OUT} + ${wpin_COD})
wpin_ERR="${wpin_ERR}${wpin_EER}"
else
wpin_COD=${ping_OUT}
wpin_EER="#${wpin_COD}-Error not defined ##"
wpin_OUT=$(expr  ${wpin_OUT} + ${wpin_COD})
wpin_ERR="${wpin_ERR}${wpin_EER}"

fi

wpin_MSG="#-[${wpin_FUN}] ${wpin_MSG_CLEAN}##"

SHOW=1

if [ ${SHOW} -a "${wpin_OUT}" != "0" ] ; then
wpin_ERR="#+${wpin_FUN}::##${wpin_ERR}"
footer_error "${wpin_NFO}" "${wpin_ERR}"
fi


fi

}
