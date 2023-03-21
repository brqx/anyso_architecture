#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wfulldomout
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
#E wfulldomout brqx.es 	-- Genera una linea de informacion del dominio 
#--------------------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#--------------------------------------------------------------------------------
#F shell
#--------------------------------------------------------------------------------
wfulldomout()
{
VER="0.0.7"

wfulldomout_FUN="wfulldomout"
wfulldomout_NFO="Resolucion de nombre de dominio con nslookup"
wfulldomout_FMT="wfulldomout [DOMAIN]"
wfulldomout_EXA="wfulldomout pbrqx.com"

wfulldomout_OUT=0
wfulldomout_MSG="dom_KO"
wfulldomout_ERR=""

F=${wfulldomout_FUN}

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMUN
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
header_common "${wfulldomout_NFO} [$VER]"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE ESPECIFICA
#--------------------------------------------------------------------------------
header_specific "${wfulldomout_FMT}" "${wfulldomout_EXA}"
#--------------------------------------------------------------------------------

else

DOMAIN_wfulldomout=${1}


wfulldom ${DOMAIN_wfulldomout}
wfulldomout_ERR="${wfulldom_ERR}"
wfulldomout_MSG="${wfulldom_MSG}"
wfulldomout_OUT=$(  expr ${wfulldomout_OUT} + ${wfulldom_OUT} )

multi_line_basic "${FULLDOM_LINE}"

if [  "${wfulldomout_OUT}" != "0" ] ; then
wfulldomout_ERR="#+${wfulldomout_FUN}::##${wfulldomout_ERR}"
footer_error_force "${wfulldomout_ERR}" "${wfulldomout_ERR}"
fi


fi

}
