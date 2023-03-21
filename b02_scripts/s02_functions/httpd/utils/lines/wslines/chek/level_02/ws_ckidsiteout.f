#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.0" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- ws_ckidsiteout
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Comprueba si el dominio existe en el sistema para no generarlo en una ruta repetida
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T get values settings file
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P 
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_ckidsiteout -- Comprueba si el dominio existe en el sistema para no generarlo en una ruta repetida
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_ckidsiteout()
{
VER="0.1.0"

ws_ckidsiteout_OUT=0
ws_ckidsiteout_ERR=""
ws_ckidsiteout_MSG=""

ws_ckidsiteout_FUN="ws_ckidsiteout"
ws_ckidsiteout_NFO="Analiza los parametros de entrada para ver si son validos para interactuar con la estructura [$VER]"
ws_ckidsiteout_FMT="ws_ckidsiteout"
ws_ckidsiteout_EXA="ws_ckidsiteout"


if [ "${1}" == "-?" -a  "${1}" == "" -a "${1}" == " " ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_ckidsiteout_NFO}" "${ws_ckidsiteout_FMT}" "${ws_ckidsiteout_EXA}"
#--------------------------------------------------------------------------------
else

#-Require que se hayan definido IDSITE y opcionalmente IDSUBS
IDSITE=$1
ID_SUBD=$2

ws_ckidsite
ws_ckidsiteout_OUT=$(expr  ${ws_ckidsiteout_OUT} + ${ws_ckidsite_OUT})
ws_ckidsiteout_ERR="${ws_ckidsiteout_ERR}${ws_ckidsite_ERR}"


if 		[ "${ws_ckidsiteout_OUT}" 	== "0" 			] ; then

echo "PROJECT TYPE: ${PROJECT_TYPE}"

if 		[ "${PROJECT_TYPE}" 		== "domain" 	] ; then 

echo "FINDLINE    : ${FIND_LINE}"
echo "IDSITE      : ${IDSITE}"

elif 	[ "${PROJECT_TYPE}" 		== "subdomain" 	] ; then 

echo "SUBDLINE    : ${SUBD_LINE}"
echo "MAINLINE    : ${MAIN_LINE}"

echo "IDSITE      : ${IDSITE}"
echo "MAINIDSITE  : ${MAIN_IDSITE}"

else

ws_ckidsiteout_EER="#E20-Wrong Project : ${IDSITE}. DONT EXIST IN CLUSTER STRUCTURE ##"
ws_ckidsiteout_COD=20

ws_ckidsiteout_OUT=$(expr  ${ws_ckidsiteout_OUT} + ${ws_ckidsiteout_COD})
ws_ckidsiteout_ERR="${ws_ckidsiteout_ERR}${ws_ckidsiteout_EER}"

fi

fi

if [ "${ws_ckidsiteout_OUT}" != "0" ] ; then
ws_ckidsiteout_ERR="+${ws_ckidsiteout_FUN}::##${ws_ckidsiteout_ERR}"
footer_error "${ws_ckidsiteout_ERR}"
fi


fi
}
