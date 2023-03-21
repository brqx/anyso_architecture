#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wcurlite  
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
#E wcurlite brqx.es 	-- Genera una linea de informacion del dominio 
#--------------------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#--------------------------------------------------------------------------------
#F shell
#--------------------------------------------------------------------------------
wcurlite()
{
VER="0.0.8"                                 

wcurlite_FUN="wcurlite"
wcurlite_NFO="Comprobacion mini de la pagina en el servidor con curl"
wcurlite_FMT="wcurlite [DOMAIN]"
wcurlite_EXA="wcurlite pbrqx.com"

wcurlite_OUT=0
wcurlite_MSG=""
wcurlite_ERR=""

F=${wcurlite_FUN}


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wcurlite_NFO}" "${wcurlite_FMT}" "${wcurlite_EXA}"
#--------------------------------------------------------------------------------

else

DOMAIN_wcurout=${1}

wcur ${DOMAIN_wcurout}

wcurlite_OUT=$(	expr $wcurlite_OUT + $wcur_OUT)
wcurlite_ERR="${wcurlite_ERR}${wcur_ERR}"
wcurlite_MSG="${wcurlite_MSG}${wcur_MSG}"


if [ "${wcur_OUT}" == "0" ] ; then

#CKZ [0] TIME [ 0.376s  ]  SZ [ 27243b   ] SPEED [ 0bps  ]       < nginx/1.11.1  >   < PHP/5.2.17  >    

FILLED_CHAR=" "
OVERFLOW_CHAR="@"

#STATUS [ ]  TIME [      ]  SIZE [      ]  SPEED [      ]  -  SERVER [        ]  ENGINE [      ] 
#CKZ [ 0 ] TIME [ 0.137s  ]  SZ [ 27243b   ] SPEED [ 71727bps  ]   < nginx/1.11.1  >   < PHP/5.2.17  >    
WS[1]="#CKZ [ ${wcur_OUT} ] TIME ["   		;WS[2]=" ${TIME_TOTAL} "		
WS[3]="] SZ ["								;WS[4]=" ${PAGE_SIZE_CHANGED} "   
WS[5]="] SPEED ["							;WS[6]=" ${SPEED_DOWNLOAD_CHANGED} "				   
WS[7]="]  <"								;WS[8]=" ${SERVER_TYPE} "  
WS[9]=">  <" 								;WS[10]=" ${PHP_VERSION} "
WS[11]=">"

#                      1 *2  3 *4  5  *6  7  *8  9  *10  11
prtyline_set_args_len 18  8  6  8  9   12 4  20  4  12   1
                
prtyline_set_line "${WS[1]}" "${WS[2]}" "${WS[3]}" "${WS[4]}" "${WS[5]}" "${WS[6]}" "${WS[7]}" "${WS[8]}" "${WS[9]}" "${WS[10]}"  "${WS[11]}"  
WAF_LINE="${prtyline_set_line_OUT}"



fi

if [  "${wcurlite_OUT}" != "0" ] ; then
wcurlite_ERR="#+${wcurlite_FUN}::##${wcurlite_ERR}"
footer_error "${wcurlite_NFO}" "${wcurlite_ERR}"
fi


fi

}
