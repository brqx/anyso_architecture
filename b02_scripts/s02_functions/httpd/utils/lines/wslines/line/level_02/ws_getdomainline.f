#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2017
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.9" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas:
#--------------------------------------------------------------------------------
#-- d-ws_getdomainline-
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- ws_ckidsite - ws_getline
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Obtiene una linea de valores de un fichero de configuracion
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
#E ws_getdomainline  -- Obtiene valores del site relacionado con la variable IDSITE
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
ws_getdomainline()
{
VER="0.1.0"

ws_getdomainline_OUT=0
ws_getdomainline_ERR=""
ws_getdomainline_MSG=""

ws_getdomainline_FUN="ws_getdomainline"
ws_getdomainline_NFO="Obtiene una linea de valores de un fichero de configuracion [$VER]"
ws_getdomainline_FMT="ws_getdomainline LINE"
ws_getdomainline_EXA="ws_getdomainline LINE"


if [ "${1}" == "-?" ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${ws_getdomainline_NFO}" "${ws_getdomainline_FMT}" "${ws_getdomainline_EXA}"
#--------------------------------------------------------------------------------
else
#-Requiere que se haya definido IDSITE en la funcion de llamada

ws_ckidsite
ws_getdomainline_OUT=$(expr  ${ws_getdomainline_OUT} + ${ws_ckidsite_OUT})
ws_getdomainline_ERR="${ws_getdomainline_ERR}${ws_ckidsite_ERR}"


if [ "${ws_ckidsite_OUT}" == "0" ] ; then
#--STA_IF_[01] - [ IF ws_getdomainline_CORRECT ] --------------------------------

#-Puede ser un subdominio
if 	[ "${PROJECT_TYPE}" 		== "domain" 	] ; then 
#--STA_IF_[02] - [ IF check_domain_or_subdomain ] -------------------------------

if [ "${FIND_LINE}" != "" ] ; then
#--STA_IF_[03] - [ IF FIND_LINE ] -----------------------------------------------

ws_getline ${FIND_LINE}

ws_getdomainline_OUT=$(expr  ${ws_getdomainline_OUT} + ${ws_getline_OUT})
ws_getdomainline_ERR="${ws_getdomainline_ERR}${ws_getline_ERR}"

# Call to ws_getparamsline - ws_setdomparamsline

#-Falta gestionar codigos de error

else

ws_getdomainline_EER="#E10-DANGER: IdSite ($IDSITE) - FindLine is empty ( ${FIND_LINE} ). Maybe ID dont exist or is a subdomain ##"
ws_getdomainline_OUT=10

ws_getdomainline_OUT=$(expr  ${ws_getdomainline_OUT} + ${ws_getdomainline_COD})
ws_getdomainline_ERR="${ws_getdomainline_ERR}${ws_getdomainline_EER}"

#--END_IF_[03] - [ IF FIND_LINE ] -----------------------------------------------
fi
else
#--ELS_IF_[02] - [ IF check_domain_or_subdomain ] -------------------------------

ws_getdomainline_EER="#-E11:IdSite is a subdomain or wrong : ${IDSITE} ##"
ws_getdomainline_COD=11
	
ws_getdomainline_OUT=$(expr  ${ws_getdomainline_OUT} + ${ws_getdomainline_COD})
ws_getdomainline_ERR="${ws_getdomainline_ERR}${ws_getdomainline_EER}"

#--END_IF_[02] - [ IF check_domain_or_subdomain ] -------------------------------
fi

#--END_IF_[01] - [ IF ws_getdomainline_CORRECT ] --------------------------------
fi

if [ "${ws_getdomainline_OUT}" != "0" ] ; then
ws_getdomainline_ERR="#+${ws_getdomainline_FUN}::##${ws_getdomainline_ERR}"
footer_error "${ws_getdomainline_NFO}" "${ws_getdomainline_ERR}"
fi


fi
}
