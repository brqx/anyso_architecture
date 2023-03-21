#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2017
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.0" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- d-ws_gdcreate-
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_getdomainline
#-- multi_line_command
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Gestiona una linea de valores de un fichero de configuracion para dominios. Nivel 3
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T check settings line domains v3
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P FIND_LINE
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E ws_gdcreate  -- Gestiona una linea de valores de un fichero de configuracion para dominios. Nivel 3.
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#WS Get Domain Line for CreateDomain Cases
ws_gdcreate()
{
VER="0.1.0"

ws_gdcreate_OUT=0
ws_gdcreate_ERR=""
ws_gdcreate_MSG=""

ws_gdcreate_FUN="ws_gdcreate"
ws_gdcreate_NFO="Gestiona una linea de valores de un fichero de configuracion para dominios. Nivel 3 [$VER]"
ws_gdcreate_FMT="ws_gdcreate"
ws_gdcreate_EXA="ws_gdcreate"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_gdcreate_NFO}" "${ws_gdcreate_FMT}" "${ws_gdcreate_EXA}"
#--------------------------------------------------------------------------------
else

#-Requiere que se haya definido IDSITE en la funcion inicial de llamada
#-Como nueva funcionalidad IDSITE puede ser tambien un dominio

#-Debe comprobar parametros pasados considerando si es dominio - subominio o idsite
#-Cualquier estructura debe ser valida para crear o consultar entidades

#echo "Pasa aqui : ${IDSITE}"

ws_getdomainline
ws_gdcreate_OUT=$(expr  ${ws_gdcreate_OUT} + ${ws_getdomainline_OUT})
ws_gdcreate_ERR="${ws_gdcreate_ERR}${ws_getdomainline_ERR}"

# Call to ws_ckidsite - ws_getline

if 		[ "${ws_gdcreate_OUT}" 					== "0" 			] ; then
#--STA_IF_[01] - [IF ws_getdomainline_CORRECT] ----------------------------------

if 		[ "${PROJECT_TYPE}" 					== "domain" 	] ; then 
#--STA_IF_[02] - [IF CHECK DOMAIN ] ---------------------------------------------

if 		[ "${DOMAIN_EXIST_IN_DIFFERENT_PATH}" 	!= "0" 			] ; then
#--STA_IF_[03] - START [IF DOMAIN_EXIST CREATE] ---------------------------------

ws_gdcreate_EER="#E10-DANGER : Domain : ${DOMAIN} already exist in cluster structure ##"
ws_gdcreate_EMD="find /host -type f -name ${CLEAN_DOMAIN}.conf"

multi_line_command "${ws_gdcreate_EER}"	"${ws_gdcreate_EMD}"

ws_gdcreate_COD=10		## Pound value for this case
ws_gdcreate_OUT=$(expr  ${ws_gdcreate_OUT} + ${ws_gdcreate_COD})
ws_gdcreate_ERR="${ws_gdcreate_ERR}${ws_gdcreate_EER}"


#--END_IF_[03] - END [IF DOMAIN_EXIST CREATE] -----------------------------------
fi
else
ws_gdcreate_EER="#-E30:Wrong Project Type : ${IDSITE} is subdomain type ##"
ws_gdcreate_COD=30

ws_gdcreate_OUT=$(expr  ${ws_gdcreate_OUT} + ${ws_gdcreate_COD})
ws_gdcreate_ERR="${ws_gdcreate_ERR}${ws_gdcreate_EER}"


#--END_IF_[02] - [IF CHECK DOMAIN ] ---------------------------------------------
fi

#--END_IF_[01] - START [IF ws_getdomainline_CORRECT] ----------------------------
fi

if [ "${ws_gdcreate_OUT}" != "0" ] ; then
ws_gdcreate="#+${ws_gdcreate_FUN}::##${ws_gdcreate_ERR}"
footer_error "${ws_gdcreate_NFO}" "${ws_gdcreate_ERR}"
fi


fi
}
