#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.8" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wpinout
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_getline - wpin
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Comprobacion conectividad icmp de la pagina en el servidor con ping
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
#E wpinout brqx.es 	-- Genera una linea de informacion del dominio 
#--------------------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#--------------------------------------------------------------------------------
#F shell
#--------------------------------------------------------------------------------
wpinout()
{
VER="0.0.8"

wpinout_FUN="wpinout"
wpinout_NFO="Comprobacion conectividad icmp de la pagina en el servidor con ping"
wpinout_FMT="wpinout [DOMAIN]"
wpinout_EXA="wpinout pbrqx.com"

wpinout_OUT=0
wpinout_MSG=""
wpinout_ERR=""

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMUN
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
header_common "${wpinout_NFO} [$VER]"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE ESPECIFICA
#--------------------------------------------------------------------------------
header_specific "${wpinout_FMT}" "${wpinout_EXA}"
#--------------------------------------------------------------------------------

else

DOMAIN_wpinout=${1}

wpin ${DOMAIN_wpinout}
wpinout_OUT=$(	expr $wpinout_OUT + $wpin_OUT)
wpinout_ERR="${wpinout_ERR}${wpin_ERR}"
wpinout_MSG="${wpinout_MSG}${wpin_MSG}"


if [ "${wpin_OUT}" == "0" ] ; then
#--STA_IF_[01] - [ WPIN ] -------------------------------------------------------

#STA BRQX_ORG ---------------------- 2016 JUN --- PRO - BORG MAIN -------------------------------------
#CKZ [0] TIME [ 0.376s  ]  SZ [ 27243b   ] SPEED [ 0bps  ]       < nginx/1.11.1  >   < PHP/5.2.17  >    
#------------------------------------------------------------------------------------------------------
#END brqx_org ---------------------- 2016 jun --- pro - borg main -------------------------------------

PROJECT_PATH="/brqi/"

CLEAN_DOMAIN=$( 		      echo "${DOMAIN_wpinout}" 										| tr "." "_"  	                )
DOMAIN_LINE=$(  		      find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}*\.pj"  	| head -1   	)
SUBDOMAIN_LINE=$(  		    find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}\.spj"  		| head -1   )
COUNT_DOMAIN_LINE=$(  	  find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}\.pj"  		| wc -l	    )
COUNT_SUBDOMAIN_LINE=$(   find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}\.spj"  		| wc -l	    )

if [ "${COUNT_DOMAIN_LINE}" == "1" -o "${COUNT_SUBDOMAIN_LINE}" == "1" ] ; then
#--STA_IF_[02] - [ FIND DOMAIN ] ------------------------------------------------

	if [ "${DOMAIN_LINE}" != "" ] ; then
		ws_getline ${DOMAIN_LINE}
	else
		ws_getline ${SUBDOMAIN_LINE}
	fi
	
wpinout_ERR="${wpinout_ERR}${ws_getline_ERR}"
wpinout_OUT=$(	expr ${wpinout_OUT} + ${ws_getline_OUT}	)

#--END_IF_[02] - [ FIND DOMAIN ] ------------------------------------------------

if [ "${wpinout_OUT}" == "0" ] ; then
#--STA_IF_[02] - [ WS_GETLINE ] -------------------------------------------------

FILLED_CHAR=" "
OVERFLOW_CHAR="@"

#
#STATUS [ ]  TIME [      ]  SIZE [      ]  SPEED [      ]  -  SERVER [        ]  ENGINE [      ] 
#CKZ [ 0 ] TIME [ 0.137s  ]  SZ [ 27243b   ] SPEED [ 71727bps  ]   < nginx/1.11.1  >   < PHP/5.2.17  >    
WS[1]="#PIN [ ${wpin_OUT} ] "	
WS[2]="#RTT [ ${wpin_RTT} ] "

#                      1 2
prtyline_set_args_len 12 80
              
                
prtyline_set_line "${WS[1]}" "${WS[2]}"   
WAF_LINE="${prtyline_set_line_OUT}"

LOADSUBD="nosub"   			# Variable usada para saber si debemos mostrar los subdominios
LOADLANGS="nolangs"  		# Variable usada para determinar si informamos de los idiomas
HEAD_LINE_INFORMATION=""
SHOW_WWW_DOMAIN="nowww"

wsdg_show_lines 

#--END_IF_[03] - [ WS_GETLINE ] -------------------------------------------------
fi
#--END_IF_[02] - [ WS_GETLINE ] -------------------------------------------------
fi
else
  
wpinout_COD=60
wpinout_EER="#-El dominio o subdomino solicitado no existe en la estructura del servidor ##"

wpinout_OUT=$(expr  ${wpinout_OUT} + ${wpinout_COD})
wpinout_ERR="${wpinout_ERR}${wpinout_EER}"

#--END_IF_[01] - [ WPIN ] -------------------------------------------------------
fi

echp "${wpinout_MSG}"

if [  "${wpinout_OUT}" != "0" ] ; then
wpinout_ERR="#+${wpinout_FUN}::##${wpinout_ERR}"
footer_error_force "${wpinout_NFO}" "${wpinout_ERR}"
fi

fi

}
