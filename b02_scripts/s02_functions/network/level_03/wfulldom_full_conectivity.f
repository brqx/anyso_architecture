#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wfulldom
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wdom - wpin - wcur
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Genera el una linea de informacion del dominio actual nslookup
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T generate domain multiple line structure conectivity
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P [DOMAIN]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wfulldom brqx.es 	-- Genera una linea de informacion del dominio 
#--------------------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#--------------------------------------------------------------------------------
#F shell
#--------------------------------------------------------------------------------
wfulldom()
{
VER="0.0.7"

wfulldom_FUN="wfulldom"
wfulldom_NFO="Resolucion de nombre de dominio con nslookup"
wfulldom_FMT="wfulldom [DOMAIN]"
wfulldom_EXA="wfulldom pbrqx.com"

wfulldom_OUT=0
wfulldom_MSG="dom_KO"
wfulldom_ERR=""

F=${wfulldom_FUN}

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMUN
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
header_common "${wfulldom_NFO} [$VER]"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE ESPECIFICA
#--------------------------------------------------------------------------------
header_specific "${wfulldom_FMT}" "${wfulldom_EXA}"
#--------------------------------------------------------------------------------

else

DOMAIN_wfulldom=${1}

#wdomlite --> WAF_LINE :
#CKZ [ 0 ] TIME [ 3.333s ] SZ [@@@@@@@@] SPEED [ 57457bps ] < lighttpd/1.4.41 > < PHP/5.2.17 >

wdomlite ${DOMAIN_wfulldom}
wfulldom_ERR="${wdomlite_ERR}"
wfulldom_MSG="${wdomlite_MSG}"
wfulldom_OUT=$(  expr ${wfulldom_OUT} + ${wdomlite_OUT} )

#wcurlite --> DOF_LINE : (deberia ser CUF_LINE)
#cards.abrqx.com IP [ 173.208.203.146 ] HOST [ mail.ybrqx.com. ] WPIN < Ping_Ok >

#Long Ideal Line : 
#cards.abrqx.com       [173.208.203.146 - mail.ybrqx.com.    - Ping_Ok  - Curl_Ok ( 3.3s     - 25k     - 574bps    -    lighttpd  -  PHP/52 )]

#Short Ideal Line : 
#cards.abrqx.com       [173.208.203.146 - mail.ybrqx.com.    - Ping_Ok  - Curl_Ok - Dom_Ok ]


wcurlite ${DOMAIN_wfulldom}
wfulldom_ERR="${wfulldom_ERR}${wcurlite_ERR}"
wfulldom_MSG="${wfulldom_MSG}${wcurlite_MSG}"
wfulldom_OUT=$(  expr ${wfulldom_OUT} + ${wcurlite_OUT} )

FULLDOM_LINE=""

FULLDOM_LINE="${FULLDOM_LINE}##${DOF_LINE}"


if [ "${wcurlite_OUT}" == "0" ] ; then
FULLDOM_LINE="${FULLDOM_LINE}##${WAF_LINE}"
fi


if [  "${wfulldom_OUT}" != "0" ] ; then
wfulldom_ERR="#+${wfulldom_FUN}::##${wfulldom_ERR}"
footer_error_force "${wfulldom_ERR}" "${wfulldom_ERR}"
fi


fi

}
