#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wdomlite  
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Comprobacion total del servidor con curl
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T check full server curl print out
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P [DOMAIN]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wdomlite brqx.es 	-- Genera una linea de informacion del dominio 
#--------------------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#--------------------------------------------------------------------------------
#F shell
#--------------------------------------------------------------------------------
wdomlite()
{
VER="0.0.8"                                 

wdomlite_FUN="wdomlite"
wdomlite_NFO="Comprobacion mini de la pagina en el servidor con ping y nslookup"
wdomlite_FMT="wdomlite [DOMAIN]"
wdomlite_EXA="wdomlite pbrqx.com"

wdomlite_OUT=0
wdomlite_MSG=""
wdomlite_ERR=""

F=${wdomlite_FUN}


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wdomlite_NFO}" "${wdomlite_FMT}" "${wdomlite_EXA}"
#--------------------------------------------------------------------------------

else

DOMAIN_wdomlite=${1}

wdom ${DOMAIN_wdomlite}
wdomlite_ERR="${wdom_ERR}"
wdomlite_MSG="${wdom_MSG}"
wdomlite_OUT=$(  expr ${wdomlite_OUT} + ${wdom_OUT} )

wpin ${DOMAIN_wdomlite}
wdomlite_ERR="${wdomlite_ERR}${wpin_ERR}"
wdomlite_MSG="${wdomlite_MSG}${wpin_MSG}"
wdomlite_OUT=$(  expr ${wdomlite_OUT} + ${wpin_OUT} )


FULLDOM_LINE="${DOMAIN_wfulldom}:${IP_DOMAIN}:${HOST_SERVER}:${wpin_MSG_CLEAN}"

##if [ "${wdomlite_OUT}" == "0" ] ; then

#CKZ [0] TIME [ 0.376s  ]  SZ [ 27243b   ] SPEED [ 0bps  ]       < nginx/1.11.1  >   < PHP/5.2.17  >    

FILLED_CHAR=" "
OVERFLOW_CHAR="@"

#STATUS [ ]  TIME [      ]  SIZE [      ]  SPEED [      ]  -  SERVER [        ]  ENGINE [      ] 
#CKZ [ 0 ] TIME [ 0.137s  ]  SZ [ 27243b   ] SPEED [ 71727bps  ]   < nginx/1.11.1  >   < PHP/5.2.17  >    
WS[1]="#${DOMAIN_wdomlite}"    		
WS[2]=" IP ["		  						;WS[3]=" ${IP_DOMAIN} "   
WS[4]="] HOST ["							;WS[5]=" ${HOST_SERVER} "				   
WS[6]="] WPIN <"							;WS[7]=" ${wpin_MSG_CLEAN} "  
WS[8]=">"

#                      1 *2  3  *4  5   *6  7  *8  
prtyline_set_args_len 30  5  20  8  29   12 30  2  
                
prtyline_set_line "${WS[1]}" "${WS[2]}" "${WS[3]}" "${WS[4]}" "${WS[5]}" "${WS[6]}" "${WS[7]}" "${WS[8]}"   
DOF_LINE="${prtyline_set_line_OUT}"

##echo "${DOF_LINE}"
##fi

SHOW=1

if [ ${SHOW} -a "${wdomlite_OUT}" != "0" ] ; then
wdomlite_ERR="#+${wdomlite_FUN}::##${wdomlite_ERR}"
footer_error "${wdomlite_NFO}" "${wdomlite_ERR}"
fi


fi

}
