#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- wfulldomliteout
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
#E wfulldomliteout brqx.es 	-- Genera una linea de informacion del dominio 
#--------------------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#--------------------------------------------------------------------------------
#F shell
#--------------------------------------------------------------------------------
wfulldomliteout()
{
VER="0.0.7"

wfulldomliteout_FUN="wfulldomliteout"
wfulldomliteout_NFO="Linea de informacion conectividad del dominio indicado"
wfulldomliteout_FMT="wfulldomliteout [DOMAIN]"
wfulldomliteout_EXA="wfulldomliteout pbrqx.com [long|short]"

wfulldomliteout_OUT=0
wfulldomliteout_MSG="dom_KO"
wfulldomliteout_ERR=""

F=${wfulldomliteout_FUN}

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMUN
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
header_common "${wfulldomliteout_NFO} [$VER]"
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--


if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then

#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE ESPECIFICA
#--------------------------------------------------------------------------------
header_specific "${wfulldomliteout_FMT}" "${wfulldomliteout_EXA}"
#--------------------------------------------------------------------------------

else

DOMAIN_wfulldomliteout=${1}
INFO_TYPE=$2

if [ "${INFO_TYPE}" == "" ] ; then 
#-Por defecto mostramos el listado largo
INFO_TYPE="long"

fi


wfulldomlite ${DOMAIN_wfulldomliteout}
wfulldomliteout_ERR="${wfulldomlite_ERR}"
wfulldomliteout_MSG="${wfulldomlite_MSG}"
wfulldomliteout_OUT=$(  expr ${wfulldomliteout_OUT} + ${wfulldomlite_OUT} )

if [ "${INFO_TYPE}" == "long" ] ; then 
echo "${WFDL_LONG_LINE}"
else
echo "${WFDL_SHORT_LINE}"
fi  


fi

}
