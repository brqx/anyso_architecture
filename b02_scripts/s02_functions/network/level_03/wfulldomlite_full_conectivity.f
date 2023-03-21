#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wfulldomlite
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
#E wfulldomlite brqx.es 	-- Genera una linea de informacion del dominio 
#--------------------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#--------------------------------------------------------------------------------
#F shell
#--------------------------------------------------------------------------------
wfulldomlite()
{
VER="0.0.7"

wfulldomlite_FUN="wfulldomlite"
wfulldomlite_NFO="Resolucion de nombre de dominio con nslookup"
wfulldomlite_FMT="wfulldomlite [DOMAIN]"
wfulldomlite_EXA="wfulldomlite pbrqx.com"

wfulldomlite_OUT=0
wfulldomlite_MSG="dom_KO"
wfulldomlite_ERR=""

F=${wfulldomlite_FUN}


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${wsdi_show_lines_NFO}" "${wsdi_show_lines_FMT}" "${wsdi_show_lines_EXA}"
#--------------------------------------------------------------------------------

else

DOMAIN_wfulldomlite=${1}


wdom ${DOMAIN_wfulldomlite}

wcur ${DOMAIN_wfulldomlite}

wpin ${DOMAIN_wfulldomlite}

#Long Ideal Line : 
#cards.abrqx.com       [173.208.203.146 - mail.ybrqx.com.    - Ping_Ok  - Curl_Ok ( 3.3s     - 25k     - 574bps    -    lighttpd  -  PHP/52 )]

#Short Ideal Line : 
#cards.abrqx.com       [173.208.203.146 - mail.ybrqx.com.    - Ping_Ok  - Curl_Ok - Dom_Ok ]


#WS[1]="#${DOMAIN_wfulldomlite}"       
WS[1]="["                 ;WS[2]=" ${IP_DOMAIN} "   
WS[3]="-"                 ;WS[4]=" ${HOST_SERVER} "          
WS[5]="-"                 ;WS[6]=" ${wpin_MSG_CLEAN} "  
WS[7]="-"                 ;WS[8]=" ${wcur_MSG_CLEAN} "  
WS[9]="-"                 ;WS[10]=" ${wdom_MSG_CLEAN} "  
WS[11]="]"                  

#                      1 *2  3  *4  5   *6  7  8  9  10  11  
prtyline_set_args_len  1  16  1  20   1  9  1  9  1   9  1 
                
prtyline_set_line "${WS[1]}" "${WS[2]}" "${WS[3]}" "${WS[4]}" "${WS[5]}" "${WS[6]}" "${WS[7]}" "${WS[8]}" "${WS[9]}"  "${WS[10]}" "${WS[11]}"   
WFDL_SHORT_LINE="${prtyline_set_line_OUT}"

WFDL_SHORT_VALUES="${DOMAIN_wfulldomlite}:${IP_DOMAIN}:${HOST_SERVER}:${wpin_MSG_CLEAN}:${wcur_MSG_CLEAN}:${wdom_MSG_CLEAN}"

##echo "${WDOF_LINE}"

#Long Ideal Line : 
#cards.abrqx.com       [173.208.203.146 - mail.ybrqx.com.    - Ping_Ok  - Curl_Ok ( 3.3s     - 25k     - 574bps    -    lighttpd  -  PHP/52 )]

WS[9]="("                 ;WS[10]=" ${TIME_TOTAL} "    
WS[11]="-"                ;WS[12]=" ${PAGE_SIZE_CHANGED} "   
WS[13]="-"                ;WS[14]=" ${SPEED_DOWNLOAD_CHANGED} "           
WS[15]="-"                ;WS[16]=" ${SERVER_TYPE} "  
WS[17]="-"                ;WS[18]=" ${PHP_VERSION} "
WS[19]="])"                  

#                      1 *2  3  *4  5   *6  7  8  9  10  11    13     15     17     
prtyline_set_args_len  1  16  1  20   1  9  1  9  1   9  1   9  1  9  1   19  1  15  2 

                
prtyline_set_line "${WS[1]}" "${WS[2]}" "${WS[3]}" "${WS[4]}" "${WS[5]}" "${WS[6]}" "${WS[7]}" "${WS[8]}" "${WS[9]}" "${WS[10]}"  "${WS[11]}" \
"${WS[12]}"  "${WS[13]}"  "${WS[14]}"   "${WS[15]}"   "${WS[16]}"   "${WS[17]}"   "${WS[18]}"   "${WS[19]}"   

WFDL_LONG_LINE="${prtyline_set_line_OUT}"

WFDL_LONG_VALUES="${WFDL_SHORT_VALUES}:${TIME_TOTAL}:${PAGE_SIZE_CHANGED}:${SPEED_DOWNLOAD_CHANGED}:${SERVER_TYPE}:${PHP_VERSION}"

##echo "${WDOF_LONG_LINE}"


fi

}
