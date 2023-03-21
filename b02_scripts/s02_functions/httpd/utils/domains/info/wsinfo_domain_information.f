#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.6" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- wsfdg
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- wsdg
#-- ws_getline
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera el fichero de dominios para usarse en HaProxy
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T create haproxy domains structure
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [DOMAIN]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wsinfo brqx.es	-- Informa del dominio actual [domains.ful]
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
wsinfo()
{
VER="0.0.3"

if [ "${1}" == "-?" -o "${1}" == "" ] ; then
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Reporta la estructura para un WAF Haproxy para el dominio en arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : wsdg [file_waf] [file_loc]                 		"
echo "----------------------------------------------------------"
echo "Example : wsndg domains.waf                               "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

OUTOUT="CLEANX"

DOMAIN_PASED=${1}

if [ "${DOMAIN_PASED}" == "" ] ; then
DOMAIN_PASED=brqx.es
fi

if [ "${PROJECT_PATH}" == "" ] ; then
PROJECT_PATH="/brqi/ /brqs/"
fi

if [ "${DOMAINS_FILE}" == "" ] ; then
DOMAINS_FILE=$( find ${PROJECT_PATH} -type f -name "brqx.fulldom"     | head -1                )
fi

CLEAN_DOMAIN_PASED=$( echo "${DOMAIN_PASED}" | tr "." "_"  )

DOMAIN_LINE=$(  		find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN_PASED}\.pj"  | head -1             )
COUNT_DOMAIN_LINE=$(  	find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN_PASED}\.pj"  | wc -l	             )

if [ "${COUNT_DOMAIN_LINE}" != "1" 	] ; then
echo "#ALERT - MULTIPLE DOMAIN DEFINITION"
echo "#$(linea_normal 103)"
find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN_PASED}\.pj"
find_OUT=$?
if [ "${find_OUT}" == "0" 			] ; then
echo "#$(linea_normal 103)"
fi
fi


#Duda si debe existir o no la linea de dominio
if [ "${DOMAIN_LINE}" != "" ] ; then
#STA_IF_01 - Inicio If Domain line

#-Aqui sabemos el proyecto y demas

#-Return ck_OUT - ck_MSG
ck ${DOMAIN_PASED} 80

#-Return wdom_OUT - HOST_SERVER - IP_DOMAIN
wdom ${DOMAIN_PASED}

#-Return wpin_OUT - wpin_MSG
wpin ${DOMAIN_PASED}

#-Return wcur_OUT - PAGE_SIZE - SPEED_DOWNLOAD - HTTP_CODE - SERVER_TYPE - PHP_VERSION - TIME_TOTAL 
wcur ${DOMAIN_PASED}

if [ -f "/brqs/domains/domains.ful" ] ; then
#-Fichero global de dominios del servidor
DOM_FUL_LINE=$( cat "/brqs/domains/domains.ful" | grep "^${DOMAIN_PASED}" )
fi

if [ -f "/etc/haproxy/domains.map" ] ; then
#-Fichero local de dominios del servidor
DOM_MAP_LINE=$( cat "/etc/haproxy/domains.map" | grep "^${DOMAIN_PASED}" )
fi


if [ "${wcur_OUT}" == "0" ] ; then
#STA_IF_02 - Inicio If wcur_OUT

#STA BRQX_ORG ---------------------- 2016 JUN --- PRO - BORG MAIN -------------------------------------
#CKZ [0] TIME [ 0.376s  ]  SZ [ 27243b   ] SPEED [ 0bps  ]       < nginx/1.11.1  >   < PHP/5.2.17  >    
#------------------------------------------------------------------------------------------------------
#END brqx_org ---------------------- 2016 jun --- pro - borg main -------------------------------------

CLEAN_DOMAIN=$( echo "${DOMAIN_wcurout}" | tr "." "_"  )
DOMAIN_LINE=$(  find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}\.pj"  		| head -1    	)
ws_getline ${DOMAIN_LINE}


FILLED_CHAR=" "
OVERFLOW_CHAR="@"

#
#STATUS [ ]  TIME [      ]  SIZE [      ]  SPEED [      ]  -  SERVER [        ]  ENGINE [      ] 
#CKZ [ 0 ] TIME [ 0.137s  ]  SZ [ 27243b   ] SPEED [ 71727bps  ]   < nginx/1.11.1  >   < PHP/5.2.17  >    
WS[1]="#CKZ [ ${wcur_OUT} ] TIME ["   		;WS[2]=" ${TIME_TOTAL} "		
WS[3]="] SZ ["								;WS[4]=" ${PAGE_SIZE_CHANGED} "   
WS[5]="] SPEED ["							;WS[6]=" ${SPEED_DOWNLOAD_CHANGED} "				   
WS[7]="]  <"								;WS[8]=" ${SERVER_TYPE} "  
WS[9]=">  <" 								;WS[10]=" ${PHP_VERSION} "
WS[11]=">"

#                      1 *2  3 *4  5  *6  7  *8  9  *10  11
prtyline_set_args_len 18  8  6  8  9   12 4  17  4  12   1
                
prtyline_set_line "${WS[1]}" "${WS[2]}" "${WS[3]}" "${WS[4]}" "${WS[5]}" "${WS[6]}" "${WS[7]}" "${WS[8]}" "${WS[9]}" "${WS[10]}"  "${WS[11]}"  
WAF_LINE="${prtyline_set_line_OUT}"

LOADSUBD="nosub"   # Variable usada para saber si debemos mostrar los subdominios
LOADLANGS="nolangs"  # Variable usada para determinar si informamos de los idiomas
SHOW_WWW_DOMAIN="nowww"

#                      1 *2  3   *4  5   *6  7  
prtyline_set_args_len 18  4  12  30  12  30  1  

WS[1]="#PIN [ ${wpin_OUT} ] W_80 ["   	    ;WS[2]=" ${ck_OUT} "		
WS[3]="]  DOM_FUL ["						;WS[4]=" ${DOM_FUL_LINE} "   
WS[5]="]  DOM_MAP ["						;WS[6]=" ${DOM_MAP_LINE} "   
WS[7]="]"

prtyline_set_line "${WS[1]}" "${WS[2]}" "${WS[3]}" "${WS[4]}" "${WS[5]}" "${WS[6]}" "${WS[7]}"   
HEAD_LINE_INFORMATION="${prtyline_set_line_OUT}"

wsdg_show_lines 

else
echo "#$(linea_caracter '==--' 102)"
echo "#WRONG : ERROR IN CURL ${wcur_ERR}"
echo "#$(linea_caracter '==--' 102)"

#END_IF_02 - Fin If wcur_OUT
fi
else
echo "#$(linea_caracter '==--' 102)"
echo "#DANGER : MAIN DOMAN FILE DONT EXIST IN CLUSTER STRUCTURE  "
echo "#$(linea_caracter '==--' 102)"



#END_IF_01 - Fin If Domain line
fi


fi
}
