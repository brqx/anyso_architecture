#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- wsliteinfo
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- ck - wpin - wdom
#-- ws_getline
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Chequeo dominio en ficheros maestros haproxy en servidor
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T report domain information lite haproxy files
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [DOMAIN]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wsliteinfo brqx.es	-- Informa del dominio actual [domains.ful]
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
wsliteinfo()
{
VER="0.0.3"
FUNC="wsliteinfo"

wsliteinfo_NFO="Chequeo dominio en ficheros maestros haproxy en servidor [$VER]"
wsliteinfo_FMT="wsliteinfo [DOMAIN]"
wsliteinfo_EXA="wsliteinfo pbrqx.com"

wsliteinfo_OUT=0
wsliteinfo_ERR=""
wsliteinfo_MSG=""

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMUN
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
header_common "${wsliteinfo_NFO}"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--


#STA_IF_[01] - Inicio Funcion --------------------------------------------------------------------
if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE ESPECIFICA
#--------------------------------------------------------------------------------
header_specific "${wslitenifo_FMT}" "${wslitenifo_EXA}"
#--------------------------------------------------------------------------------

else

OUTOUT="CLEANX"

DOMAIN_PASED=${1}

if [ "${DOMAIN_PASED}" == "" ] ; then
DOMAIN_PASED=brqx.es
fi

PROJECT_PATH="/brqi/"

DOMAINS_FILE=$( find ${PROJECT_PATH} -type f -name "brqx.fulldom"     | head -1                )

CLEAN_DOMAIN_PASED=$( echo "${DOMAIN_PASED}" | tr "." "_"  )

DOMAIN_LINE=$(  		find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN_PASED}\.pj"  | head -1             )
COUNT_DOMAIN_LINE=$(  	find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN_PASED}\.pj"  | wc -l	             )

#-En este punto tenemos la linea y las veces que aparece

#-Return ck_OUT - ck_MSG
ck ${DOMAIN_PASED} 80
wsliteinfo_OUT=$(expr $wsliteinfo_OUT + $ck_OUT)
wsliteinfo_ERR="${wsliteinfo_ERR}${ck_ERR}"

#-Return wdom_OUT - HOST_SERVER - IP_DOMAIN
wdom ${DOMAIN_PASED}
wsliteinfo_OUT=$(expr $wsliteinfo_OUT + $wdom_OUT)
wsliteinfo_ERR="${wsliteinfo_ERR}${wdom_ERR}"


#-Return wpin_OUT - wpin_MSG
wpin ${DOMAIN_PASED}
wsliteinfo_OUT=$(expr $wsliteinfo_OUT + $wpin_OUT)
wsliteinfo_ERR="${wsliteinfo_ERR}${wpin_ERR}"


if [ -f "/brqs/domains/domains.ful" 		] ; then
#-Fichero global de dominios del servidor
DOM_FUL_LINE=$( cat "/brqs/domains/domains.ful" | grep "^${DOMAIN_PASED}" )
fi

if [ -f "/etc/haproxy/domains.map" 			] ; then
#-Fichero local de dominios del servidor
DOM_MAP_LINE=$( cat "/etc/haproxy/domains.map" | grep "^${DOMAIN_PASED}" )
fi

if [ "${COUNT_DOMAIN_LINE}" == "1" 			] ; then
ws_getline ${DOMAIN_LINE}
else
ws_getlineNOEXEC=1
wsliteinfo_OUT=$(	expr $wsliteinfo_OUT + $ws_getlineNOEXEC	)

#-Last line - dont have separator
ws_getline_ERR="#-[${FUNC}] Domain ${DOMAIN_PASED} dont exist in structure"
wsliteinfo_ERR="${wsliteinfo_ERR}${ws_getline_ERR}"

fi


if [ "${wsliteinfo_OUT}" == "0"				] ; then
#STA_IF_02 - Inicio If wcur_OUT

FILLED_CHAR=" "
OVERFLOW_CHAR="@"

WAF_LINE="${prtyline_set_line_OUT}"

#                      1 *2  3   *4  5   *6  7  
prtyline_set_args_len 18  4  12  30  12  30  1  

WS[1]="#PIN [ ${wpin_OUT} ] W_80 ["   	    ;WS[2]=" ${ck_OUT} "		
WS[3]="]  DOM_FUL ["						;WS[4]=" ${DOM_FUL_LINE} "   
WS[5]="]  DOM_MAP ["						;WS[6]=" ${DOM_MAP_LINE} "   
WS[7]="]"

prtyline_set_line "${WS[1]}" "${WS[2]}" "${WS[3]}" "${WS[4]}" "${WS[5]}" "${WS[6]}" "${WS[7]}"   
WAF_LINE="${prtyline_set_line_OUT}"

HEAD_LINE_INFORMATION=""

wsdg_show_lines 

else
#-- Hemos creado libreria de funciones para tratar codigos de error multiples
#- El formato va a ser MENSAJE ## MENSAJE ## ...

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- PIE DE ERROR ESPECIFICO
#--------------------------------------------------------------------------------
footer_error "wsliteinfo ${DOMAIN_PASED}" "${wsliteinfo_ERR}"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

#END_IF_01 - Fin If wpin_OUT
fi

#END_IF_[01] - END Fin Funcion --------------------------------------------------
fi
}
