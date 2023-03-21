#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wdomout
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- wdom
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
#E wdomout brqx.es 	-- Genera una linea de informacion del dominio 
#--------------------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#--------------------------------------------------------------------------------
#F shell
#--------------------------------------------------------------------------------
wdomout()
{
VER="0.0.7"

wdomout_FUN="wdomout"
wdomout_NFO="Resolucion de nombre de dominio con nslookup"
wdomout_FMT="wdomout [DOMAIN]"
wdomout_EXA="wdomout pbrqx.com"

wdomout_OUT=0
wdomout_MSG="dom_KO"
wdomout_ERR=""

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMUN
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
header_common "${wdomout_NFO} [$VER]"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE ESPECIFICA
#--------------------------------------------------------------------------------
header_specific "${wdomout_FMT}" "${wdomout_EXA}"
#--------------------------------------------------------------------------------

else

DOMAIN_wdomout=${1}


wdom ${DOMAIN_wdomout}
wdomout_ERR="${wdom_ERR}"
wdomout_MSG="${wdom_MSG}"
wdomout_OUT=$(  expr ${wdomout_OUT} + ${wdom_OUT} )

if [ "${wdomout_OUT}" == "0" ] ; then
#--STA_IF_[01] - [ WDOM DOMAIN ] ------------------------------------------------

  PROJECT_PATH="/brqi/"

  CLEAN_DOMAIN=$(     echo "${DOMAIN_wdomout}" | tr "." "_"                         )
  DOMAIN_LINE=$(      find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}\.pj"      | head -1     )
  SUBDOMAIN_LINE=$(     find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}\.spj"     | head -1     )
  COUNT_DOMAIN_LINE=$(    find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}\.pj"      | wc -l         )
  COUNT_SUBDOMAIN_LINE=$( find ${PROJECT_PATH} -type f -name "*_${CLEAN_DOMAIN}\.spj"     | wc -l         )

  if [ "${COUNT_DOMAIN_LINE}" == "1" -o "${COUNT_SUBDOMAIN_LINE}" == "1" ] ; then
#--STA_IF_[02] - [ FIND DOMAIN ] ------------------------------------------------


  
  	if [ "${DOMAIN_LINE}" != "" ] ; then
  		ws_getline ${DOMAIN_LINE}
  	else
  		ws_getline ${SUBDOMAIN_LINE}
  	fi
  
  wdomout_ERR="${wdom_ERR}${ws_getline_ERR}"
  wdomout_OUT=$(	expr ${wdomout_OUT} + ${ws_getline_OUT}	)
  

  if [ "${wdomout_OUT}" == "0" ] ; then
  #--STA_IF_[03] - [ WS_GETLINE ] -------------------------------------------------
  
  #STA BRQX_ORG ---------------------- 2016 JUN --- PRO - BORG MAIN -------------------------------------
  #CKZ [0] TIME [ 0.376s  ]  SZ [ 27243b   ] SPEED [ 0bps  ]       < nginx/1.11.1  >   < PHP/5.2.17  >    
  #------------------------------------------------------------------------------------------------------
  #END brqx_org ---------------------- 2016 jun --- pro - borg main -------------------------------------
  
  FILLED_CHAR=" "
  OVERFLOW_CHAR="@"
  
  #
  #WS[1]="#CKZ [ ${wdom_OUT} ] IP ["			;WS[2]=" ${IP_DOMAIN} "		
  #WS[3]="] HOST ["							;WS[4]=" ${HOST_SERVER} "   
  #WS[5]="]"
  
  #                      1 *2  3  *4  5  
  #prtyline_set_args_len 16 20  8  18  1
                
                  
  #prtyline_set_line "${WS[1]}" "${WS[2]}" "${WS[3]}" "${WS[4]}" "${WS[5]}"   
  WAF_LINE=""
  
  HEAD_LINE_INFORMATION=""
  SHOW_WWW_DOMAIN="nowww"
  
  LOADSUBD="nosub"   # Variable usada para saber si debemos mostrar los subdominios
  LOADLANGS="nolangs"  # Variable usada para determinar si informamos de los idiomas
  
  wsdg_show_lines 
  
  
  #--END_IF_[03] - [ WS_GETLINE ] -------------------------------------------------
  fi
  #--END_IF_[02] - [ WDOM DOMAIN ] ------------------------------------------------
  fi
else

wdomout_COD=60
wdomout_EER="#-El dominio o subdomino solicitado no existe en la estructura del servidor ##"

wdomout_OUT=$(expr  ${wdomout_OUT} + ${wdomout_COD})
wdomout_ERR="${wdomout_ERR}${wdomout_EER}"

#--END_IF_[01] - [ FIND DOMAIN ] ------------------------------------------------
fi

echp "${wdomout_MSG}"

if [  "${wdomout_OUT}" != "0" ] ; then
wdomout_ERR="#+${wdomout_FUN}::##${wdomout_ERR}"
footer_error_force "${wdomout_ERR}" "${wdomout_ERR}"
fi


fi

}
