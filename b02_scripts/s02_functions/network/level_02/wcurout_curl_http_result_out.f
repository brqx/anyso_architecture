#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wcurout
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wsdg_show_lines - prtyline_set_args_len - prtyline_set_line
#-- ws_getline - wcur
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Comprobacion pagina servidor con curl
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T check curl page out server
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P [DOMAIN]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E wcurout brqx.es 	-- Genera una linea de informacion del dominio 
#--------------------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#--------------------------------------------------------------------------------
#F shell
#--------------------------------------------------------------------------------

wcurout()
{
VER="0.0.7"

wcurout_FUN="wcurout"
wcurout_NFO="Comprobacion total de la pagina en el servidor con curl"
wcurout_FMT="wcurout [DOMAIN]"
wcurout_EXA="wcurout pbrqx.com"


wcurout_OUT=0
wcurout_MSG="curl_KO"
wcurout_ERR=""


#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMUN
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
header_common "${wcurout_NFO} [$VER]"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE ESPECIFICA
#--------------------------------------------------------------------------------
header_specific "${wcurout_FMT}" "${wcurout_EXA}"
#--------------------------------------------------------------------------------

else

DOMAIN_wcurout=${1}

wcur ${DOMAIN_wcurout}

wcurout_OUT=$(	expr $curout_OUT + $wcur_OUT)
wcurout_ERR="${wcurout_ERR}${wcur_ERR}"


if [ "${wcur_OUT}" == "0" ] ; then
#--STA_IF_[01] - [ WCUR ] -------------------------------------------------------

#STA BRQX_ORG ---------------------- 2016 JUN --- PRO - BORG MAIN -------------------------------------
#CKZ [0] TIME [ 0.376s  ]  SZ [ 27243b   ] SPEED [ 0bps  ]       < nginx/1.11.1  >   < PHP/5.2.17  >    
#------------------------------------------------------------------------------------------------------
#END brqx_org ---------------------- 2016 jun --- pro - borg main -------------------------------------

PROJECT_PATH="/brqi/"

CLEAN_DOMAIN=$( 		echo "${DOMAIN_wcurout}" 										| tr "." "_"  	)
DOMAIN_LINE=$(  		find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}*\.pj"  	| head -1    	)
COUNT_DOMAIN_LINE=$(  	find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}\.pj"  	| wc -l	 		)
COUNT_DOMAIN_LINE=$(  	find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}\.pj"  		| wc -l	       	)
COUNT_SUBDOMAIN_LINE=$( find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}\.spj"  		| wc -l	       	)

if [ "${COUNT_DOMAIN_LINE}" == "1" -o "${COUNT_SUBDOMAIN_LINE}" == "1" ] ; then
#--STA_IF_[02] - [ FIND DOMAIN ] ------------------------------------------------

	if [ "${DOMAIN_LINE}" != "" ] ; then
		ws_getline ${DOMAIN_LINE}
	else
		ws_getline ${SUBDOMAIN_LINE}
	fi
wcurout_ERR="${wcurout_ERR}${ws_getline_ERR}"
wcurout_OUT=$(	expr ${wcurout_OUT} + ${ws_getline_OUT}	)

if [ "${wcurout_OUT}" == "0" ] ; then
#--STA_IF_[03] - [ WS_GETLINE ] -------------------------------------------------

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
              
#WS[1]="#CKZ [ ${wcur_OUT} ] "         		;#WS[2]="TIME [ ${TIME_TOTAL}  ]"		
#WS[3]="SZ [ ${PAGE_SIZE_CHANGED}   ]"		;#WS[4]="SPEED [ ${SPEED_DOWNLOAD_CHANGED}  ]"				   
#WS[5]="- ${SERVER_TYPE}  -"	    		;#WS[6]="- ${PHP_VERSION}  -"
               
                
prtyline_set_line "${WS[1]}" "${WS[2]}" "${WS[3]}" "${WS[4]}" "${WS[5]}" "${WS[6]}" "${WS[7]}" "${WS[8]}" "${WS[9]}" "${WS[10]}"  "${WS[11]}"  
WAF_LINE="${prtyline_set_line_OUT}"

LOADSUBD="nosub"   		# Variable usada para saber si debemos mostrar los subdominios
LOADLANGS="nolangs"  	# Variable usada para determinar si informamos de los idiomas
HEAD_LINE_INFORMATION="nohead"
SHOW_WWW_DOMAIN="nowww"

wsdg_show_lines 

#--END_IF_[03] - [ WS_GETLINE ] -------------------------------------------------
fi

#--END_IF_[03] - [ WS_GETLINE ] -------------------------------------------------
fi


else

wcurout_COD=60
wcurout_EER="#${wcurout_COD}-El dominio o subdomino solicitado no existe en la estructura del servidor ##"

wcurout_OUT=$(expr  ${wdomout_OUT} + ${wdomout_COD})
wcurout_ERR="${wcurout_ERR}${wcurout_EER}"

#--END_IF_[01] - [ WCUR ] -------------------------------------------------------
fi

echp "#+${wcurout_MSG}"

if [  "${wcurout_OUT}" != "0" ] ; then
wcurout_ERR="#+${wcurout_FUN}::##${wcurout_ERR}"
footer_error "${wcurout_NFO}" "${wcurout_ERR}"
fi

fi

}
